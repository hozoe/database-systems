vdatacsv = LOAD '/data/vaccination-data.csv' USING PigStorage(',') AS (country:CHARARRAY, iso3:CHARARRAY, who_region:CHARARRAY, persons_fully_vaccinated:INT);
regiongrp = GROUP vdatacsv BY who_region;
--countrygrp = GROUP vdatacsv BY country;
countries = FOREACH regiongrp GENERATE group, COUNT($1.country),$1.persons_fully_vaccinated;
orderdata = ORDER countries BY group;
DUMP orderdata;
