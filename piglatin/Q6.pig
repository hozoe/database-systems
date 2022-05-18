popcsv = LOAD '/data/pop.csv' USING PigStorage(',') AS (country:CHARARRAY, population:INT);
vmetacsv = LOAD '/data/vaccination-metadata.csv' USING PigStorage(',') AS (iso3:CHARARRAY, vaccine_name:CHARARRAY, product_name:CHARARRAY, company_name:CHARARRAY);
vdatacsv = LOAD '/data/vaccination-data.csv' USING PigStorage(',') AS (country:CHARARRAY, iso3:CHARARRAY, who_region:CHARARRAY, persons_fully_vaccinated:INT);

highpop = FOREACH (FILTER popcsv BY population>100000) GENERATE country AS country, population AS population;
joinByCountry = FOREACH (JOIN highpop BY country, vdatacsv BY country) GENERATE highpop::country AS country, highpop::population AS population, vdatacsv::iso3 AS iso3, vdatacsv::persons_fully_vaccinated as persons_fully_vaccinated;

vaccines_join = FOREACH (JOIN vdatacsv BY iso3, vmetacsv BY iso3) GENERATE vdatacsv::country AS country, vmetacsv::product_name AS product_name;
groupByCountry = GROUP vaccines_join BY country;
brands = FOREACH groupByCountry GENERATE group AS country, COUNT(vaccines_join.product_name) AS count;
 
-- population is in thousands unit *** 
res = FOREACH (JOIN joinByCountry BY country, brands BY country) GENERATE brands::country AS country, joinByCountry::population AS population, (joinByCountry::persons_fully_vaccinated*1.0/joinByCountry::population)/10 AS percent, brands::count AS count;
ordres = ORDER res BY population DESC;
DUMP ordres;
