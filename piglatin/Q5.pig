vmetacsv = LOAD '/data/vaccination-metadata.csv' USING PigStorage(',') AS (iso3:CHARARRAY, vaccine_name:CHARARRAY, product_name:CHARARRAY, company_name:CHARARRAY);
--vdatacsv = LOAD '/data/vaccination-data.csv' USING PigStorage(',') AS (country:CHARARRAY, iso3:CHARARRAY, who_region:CHARARRAY, persons_fully_vaccinated:INT);
companies = GROUP vmetacsv BY company_name;
numvaccines = FOREACH companies {
    unique_countries = DISTINCT vmetacsv.iso3;
    GENERATE group,COUNT(unique_countries) as uc;};
orderdata = ORDER numvaccines BY uc DESC;
top10 = LIMIT orderdata 10;
DUMP top10;
