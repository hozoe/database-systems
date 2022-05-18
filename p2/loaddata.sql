-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!


--HealthcareInstitute
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(01,'Lac-Saint-Louis','rtcmtl@gmail.com','776 Rue Valiquette, Verdun, QC H4H 2E2','514-975-8973');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(02,'Maison de naissance Côte-des-Neiges','cdng@gmail.com','6560 Ch. de la Côte-des-Neiges, Montréal, QC H3S 2A7','514-736-2323');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(03,'HypnoBirthing Montreal','hypnomtl@gmail.com','7249 Av. de l''Épée, Montréal, QC H3N 2E2','438-871-2002');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(04,'Birth House Jeanne Mance','bhjm@gmail.com','1822 Ontario St E, Montreal, Quebec H2K 1T7','514-527-2361');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(05,'Clinique communautaire de Pointe-Saint-Charles','ccpsc@gmail.com','500 Av. Ash, Montréal, QC H3K 2R4','514-937-9251');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(06,'CLSC Parthenais','clscp@gmail.com','2260 Rue Parthenais, Montréal, QC H2K 3T5','514-527-2361');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(07,'CLSC Saint Catherine','clscsc@gmail.com','66 St Catherine St E, Montreal, Quebec H2X 1K6','(514) 527-2361');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(08,'CLSC de Saint-Henri','clscsh@gmail.com','3833 Notre-Dame St W, Montreal, Quebec H4C 1P8','514-933-7541');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(09,'The Montreal Center for Health & Care','mtlhc@gmail.com','5655 Av du Parc suite 206, Montréal, QC H2V 4H2','514-357-2167');
insert into HealthcareInstitution(hid,hname,hemail,haddress,hphone) values(10,'MotherWit Doula Care','motherwit@gmail.com','5726 Sherbrooke St W #214, Montreal, Quebec H4A 1W8','514-237-0737');

--BirthingCenter
insert into BirthingCenter(hid) values(01);
insert into BirthingCenter(hid) values(02);
insert into BirthingCenter(hid) values(03);
insert into BirthingCenter(hid) values(04);
insert into BirthingCenter(hid) values(10);
--CommunityClinic
insert into CommunityClinic(hid) values(05);
insert into CommunityClinic(hid) values(06);
insert into CommunityClinic(hid) values(07);
insert into CommunityClinic(hid) values(08);
insert into CommunityClinic(hid) values(09);
--Midwife
insert into MidWife(practitionerid,name,email,phone,hid) values (01,'Marion Girard','mariong@gmail.com','4505550181',01);
insert into MidWife(practitionerid,name,email,phone,hid) values(02,'Miriam Huynh','miriamhuynh@hotmail.com','5146798223',02);
insert into MidWife(practitionerid,name,email,phone,hid) values(03,'Elise Haigh','elise1001@gmail.com','2508732249',03);
insert into MidWife(practitionerid,name,email,phone,hid) values(04,'Frances Shepard','francesfs@outlook.com','4161833429',03);
insert into MidWife(practitionerid,name,email,phone,hid) values(05,'Kira George','kirageorge1998@yahoo.com','4385129807',01);
insert into MidWife(practitionerid,name,email,phone,hid) values(06,'Ayanna Tanner','atanner@yahoo.com','4505550181',01);
insert into MidWife(practitionerid,name,email,phone,hid) values(07,'Athena Terrell','athenatrl@gmail.com','4505550181',01);
insert into MidWife(practitionerid,name,email,phone,hid) values(08,'Victoria Newman','vicnewman@outlook.com','4505550181',01);
insert into MidWife(practitionerid,name,email,phone,hid) values(09,'Marina Lin','marinalin@gmail.com','4505550181',01);
insert into MidWife(practitionerid,name,email,phone,hid) values(10,'Sanai Lopez','sanailopez@hotmail.com','4505550181',01);
--Mother
insert into Mother(hcardid,mname,memail,mphone,mdob,maddress,mprofession,mbloodtype) values('AVUD60421447','Jada Miles','jadamiles@gmail.com','450-930-5809','1985-09-01','4688 Sherbrooke Ouest, Montreal, QC H4A 1H3', 'Laywer','O-');
insert into Mother(hcardid,mname,memail,mphone,mdob,maddress,mprofession,mbloodtype) values('PSOG82745863','Ashlee Krause','ashleek@gmail.com','514-333-2921','1990-07-08','2788 Rue Levy, Montreal, QC H3C 5K4', 'Teacher','B');
insert into Mother(hcardid,mname,memail,mphone,mdob,maddress,mprofession,mbloodtype) values('ZUCH47080553','Skyler Silva','skylersil@gmail.com','450-794-2730','1990-10-13','4701 Rue Saint-Charles, Longueuil, QC J4H 1M3', 'Architect','AB');
insert into Mother(hcardid,mname,memail,mphone,mdob,maddress,mprofession,mbloodtype) values('LUNR24495581','Victoria Gutierrez','vgutierrez@gmail.com','514-849-8704','1992-07-03','2303 Ste. Catherine Ouest, Montreal, QC H3C 3X6', 'Entrepreneur', 'O-');
insert into Mother(hcardid,mname,memail,mphone,mdob,maddress,mprofession,mbloodtype) values('KBRU71451782','Jenny Choi','jennychoi@gmail.com','438-954-4633','1996-02-20','708 Duke Street, Montreal, QC H3C 5K4', 'Doctor','A');
insert into Mother(hcardid,mname,memail,mphone,mdob,maddress,mprofession,mbloodtype) values('ABCD12345678','Amy Chan','amychan@gmail.com','514-123-4567','1998-09-12','123 Street, Montreal, QC J2H4Q6','Student','AB');
--Parents
insert into Parents(coupleid,hcardid) values(01,'AVUD60421447');
insert into Parents(coupleid,hcardid) values(02,'PSOG82745863');
insert into Parents(coupleid,hcardid) values(03,'ZUCH47080553');
insert into Parents(coupleid,hcardid) values(04,'LUNR24495581');
insert into Parents(coupleid,hcardid) values(05,'KBRU71451782');
insert into Parents(coupleid,hcardid) values(06,'ABCD12345678');
--Father
insert into Father(fname,coupleid,fdob,fphone,fprofession) values('Derick Blake',01,'1982-12-19','202-918-2132','Counselor');
insert into Father(fname,coupleid,fdob,fphone,fprofession) values('Scott Shelton',02,'1983-07-13','403-778-5738','Artist');
insert into Father(fname,coupleid,fdob,fphone,fprofession) values('Issac Smith',03,'1991-02-19','367-310-2701','Professor');
insert into Father(fname,coupleid,fdob,fphone,fprofession) values('Pedro Osborn',04,'1986-05-22','450-414-0756','Dentist');
insert into Father(fname,coupleid,fdob,fphone,fprofession) values('Marcos Vazquez',05,'1992-12-14','450-401-0695','Doctor');
--Pregnancy
insert into Pregnancy(pregnancyid,coupleid,pregnum,expdueym,practitionerid,backupid,numbabies) values(01,01,2,'2022-09-04',01,07,1);
insert into Pregnancy(pregnancyid,coupleid,pregnum,expdueym,practitionerid,backupid,numbabies) values(02,02,1,'2022-07-07',02,03,3);
insert into Pregnancy(pregnancyid,coupleid,pregnum,expdueym,practitionerid,backupid,numbabies) values(03,03,1,'2022-10-29',03,05,2);
insert into Pregnancy(pregnancyid,coupleid,pregnum,expdueym,practitionerid,backupid,numbabies) values(04,04,2,'2022-04-19',04,08,2);
insert into Pregnancy(pregnancyid,coupleid,pregnum,expdueym,practitionerid,backupid,numbabies) values(05,05,2,'2022-06-15',05,06,1);
insert into Pregnancy(pregnancyid,coupleid,pregnum,expdueym,estdued,usounddued,lmpdued,practitionerid,backupid,numbabies) values(06,06,2,'2022-06-07','2022-07-02','2022-06-29','2022-07-01',01,04,2);
--Child
insert into Child(childid,pregnancyid) values(01,01);
insert into Child(childid,pregnancyid) values(02,02);
insert into Child(childid,pregnancyid) values(03,03);
insert into Child(childid,pregnancyid) values(04,04);
insert into Child(childid,pregnancyid) values(05,05);
insert into Child(childid,pregnancyid) values(06,06);


--Appointment
insert into Appointment(aid,practitionerid,pregnancyid,adate,atime) values(01,01,01,'2022-03-23','12:00:00');
insert into Appointment(aid,practitionerid,pregnancyid,adate,atime) values(02,01,02,'2022-03-23','09:15:00');
insert into Appointment(aid,practitionerid,pregnancyid,adate,atime) values(03,03,03,'2022-10-04','16:20:13');
insert into Appointment(aid,practitionerid,pregnancyid,adate,atime) values(04,04,04,'2022-03-12','14:05:30');
insert into Appointment(aid,practitionerid,pregnancyid,adate,atime) values(05,05,05,'2022-01-07','10:30:00');
insert into Appointment(aid,practitionerid,pregnancyid,adate,atime) values(06,01,06,'2022-03-24','11:00:00');
insert into Appointment(aid,practitionerid,pregnancyid,adate,atime) values(07,01,04,'2022-03-24','08:00:00');
--InfoSession
insert into InfoSession(iid,coupleid,idate,itime,language) values(01,01,'2022-01-28','10:00:00','English');
insert into InfoSession(iid,coupleid,idate,itime,language) values(02,02,'2022-01-05','12:30:00','French');
insert into InfoSession(iid,coupleid,idate,itime,language) values(03,03,'2022-02-02','12:15:00','English');
insert into InfoSession(iid,coupleid,idate,itime,language) values(04,04,'2021-12-20','14:45:00','Spanish');
insert into InfoSession(iid,coupleid,idate,itime,language) values(05,05,'2021-12-27','19:00:00','Korean');
insert into InfoSession(iid,coupleid,idate,itime,language) values(06,06,'2022-02-08','11:00:00','Chinese');
--LabTechnician
insert into LabTechnician(tid,tname,tphone) values(01,'Zoey Caldwell','450-585-9906');
insert into LabTechnician(tid,tname,tphone) values(02,'Sofia Chandler','438-847-2282');
insert into LabTechnician(tid,tname,tphone) values(03,'Davis Beck','450-882-2700');
insert into LabTechnician(tid,tname,tphone) values(04,'Warren Vazquez','514-882-2700');
insert into LabTechnician(tid,tname,tphone) values(05,'Lila Kim','438-759-4423');
insert into LabTechnician(tid,tname,tphone) values(06,'Prescribes tests','450-123-4567');

--TestSamples
insert into TestSamples(testid,practitionerid,pregnancyid,tid,testtype,labdate,prescdate,results) values(01,01,01,01,'Blood iron','2022-02-05','2022-02-03','Normal results for mother');
insert into TestSamples(testid,practitionerid,pregnancyid,tid,testtype,labdate,prescdate,results) values(08,01,01,01,'Blood iron','2022-02-05','2022-02-03','Normal results for child');
insert into TestSamples(testid,practitionerid,pregnancyid,childid,tid,testtype,labdate,prescdate,results) values(02,02,02,02,02,'First trimester ultrasound','2022-02-05','2022-01-29','Normal');
insert into TestSamples(testid,practitionerid,pregnancyid,childid,tid,testtype,labdate,prescdate,results) values(03,03,03,03,03,'Amniocentesis','2021-11-01','2021-10-04','Normal');
insert into TestSamples(testid,practitionerid,pregnancyid,childid,tid,testtype,labdate,prescdate,results) values(04,04,04,04,04,'Blood iron','2022-03-14','2022-03-12','Blood test 1');
insert into TestSamples(testid,practitionerid,pregnancyid,childid,tid,testtype,labdate,prescdate,results) values(05,05,04,04,04,'Genetic screening','2022-01-10','2022-01-08','Normal');
insert into TestSamples(testid,practitionerid,pregnancyid,childid,tid,testtype,labdate,prescdate,results) values(06,01,06,06,02,'Blood iron','2022-02-20','2022-02-14','Normal');
insert into TestSamples(testid,practitionerid,pregnancyid,childid,tid,testtype,labdate,prescdate,results) values(07,04,04,04,05,'Blood iron','2022-05-14','2022-05-12','Blood test 2');

--Notes
insert into Notes(aid,noteid,timestmp,text) values('01','01','2022-02-03 12:50:26','notes 1');
insert into Notes(aid,noteid,timestmp,text) values('01','02','2022-02-03 12:50:26','notes 2');
insert into Notes(aid,noteid,timestmp,text) values('02','02','2022-01-29 09:30:14','notes 2');
insert into Notes(aid,noteid,timestmp) values('03','03','2021-10-04 16:29:53');
insert into Notes(aid,noteid,timestmp) values('04','04','2022-03-12 14:10:07');
insert into Notes(aid,noteid,timestmp) values('05','05','2022-01-07 11:16:34');

--sql queries

--select adate,atime from APPOINTMENT where pregnancyid=(select pregnancyid from PREGNANCY where pregnum=2 and coupleid=(select coupleid from PARENTS where hcardid=(
    --select hcardid from mother where mname='Victoria Gutierrez')));


-- select adate,atime,mother.hcardid,mother.mname,mother.mphone from PREGNANCY
--     inner join APPOINTMENT on pregnancy.pregnancyid=appointment.pregnancyid
--     inner join PARENTS on parents.coupleid=pregnancy.coupleid
--     inner join MOTHER on mother.hcardid=parents.hcardid
--     inner join MIDWIFE on midwife.practitionerid=pregnancy.practitionerid where midwife.name='Marion Girard'
--     and adate between '2022-03-21' and '2022-03-25';



-- select mother.hcardid,mother.mname,mother.mphone from mother
-- inner join PARENTS on mother.hcardid=parents.hcardid
-- inner join PREGNANCY on pregnancy.coupleid=parents.coupleid
-- inner join MIDWIFE on midwife.practitionerid=pregnancy.practitionerid
-- where midwife.hid=(select hid from HEALTHCAREINSTITUTION where hname='Lac-Saint-Louis')
-- and pregnancy.expdueym>current date;

-- update pregnancy set estdued='2022-09-01' where pregnancyid=7;


--5e
-- select distinct mother.hcardid,mother.mname from MOTHER
-- inner join PARENTS on mother.hcardid=parents.hcardid
-- inner join PREGNANCY on pregnancy.coupleid=parents.coupleid
-- where pregnancy.numbabies>1;

--view
-- create view midwifeinfo(practitionerid,mname,mphone,memail,hname,haddress) as
--     select midwife.practitionerid,midwife.name,midwife.phone,midwife.email,healthcareinstitution.hname,healthcareinstitution.haddress
--         from midwife,healthcareinstitution where midwife.hid=healthcareinstitution.hid;

-- select testsamples.results from TESTSAMPLES where testsamples.pregnancyid=(select pregnancyid from PREGNANCY
-- where pregnum=2 and coupleid=(select coupleid from PARENTS where hcardid=(
--     select hcardid from mother where mname='Victoria Gutierrez')))
-- and testtype='Blood iron';

--expdueym, estdued, usounddued, lmpdued
-- select healthcareinstitution.hname,count(midwife.hid) from PREGNANCY
--     inner join midwife on pregnancy.practitionerid=midwife.practitionerid
--     inner join HEALTHCAREINSTITUTION on midwife.hid=healthcareinstitution.hid
--     where (estdued is not null and estdued between '2022-07-01' and '2022-07-31') or (expdueym between '2022-07-01' and '2022-07-31')
-- group by midwife.hid,healthcareinstitution.hname

--select mother.mname, mother.hcardid from mother inner join parents on parents.hcardid=mother.hcardid where coupleid in (select coupleid from pregnancy where pregnum>=2);

insert into Child(childid,pregnancyid,cdob) values(11,01,'2022-10-19');
insert into Child(childid,pregnancyid,cdob) values(12,02,'2022-09-16');
insert into Child(childid,pregnancyid,cdob) values(13,03,'2022-09-16');
insert into Child(childid,pregnancyid,cdob) values(14,04,'2022-01-26');
insert into Child(childid,pregnancyid,cdob) values(15,05,'2022-05-07');
insert into Child(childid,pregnancyid,cdob) values(16,06,'2022-05-07');
insert into Child(childid,pregnancyid,cdob) values(17,01,'2022-07-08');
insert into Child(childid,pregnancyid,cdob) values(18,02,'2022-07-29');
insert into Child(childid,pregnancyid,cdob) values(19,03,'2022-05-07');
insert into Child(childid,pregnancyid,cdob) values(20,04,'2022-09-16');
insert into Child(childid,pregnancyid,cdob) values(21,05,'2022-09-16');
insert into Child(childid,pregnancyid,cdob) values(22,06,'2022-10-13');
insert into Child(childid,pregnancyid,cdob) values(23,01,'2022-07-01');
insert into Child(childid,pregnancyid,cdob) values(24,02,'2022-05-30');
insert into Child(childid,pregnancyid,cdob) values(25,03,'2022-05-30');
insert into Child(childid,pregnancyid,cdob) values(26,04,'2022-05-30');
insert into Child(childid,pregnancyid,cdob) values(27,05,'2022-05-30');
insert into Child(childid,pregnancyid,cdob) values(28,06,'2022-07-04');
insert into Child(childid,pregnancyid,cdob) values(29,06,'2022-07-04');
insert into Child(childid,pregnancyid,cdob) values(30,06,'2022-07-04');
insert into Child(childid,pregnancyid,cdob) values(31,06,'2022-07-04');
insert into Child(childid,pregnancyid,cdob) values(32,06,'2022-07-04');
insert into Child(childid,pregnancyid,cdob) values(33,06,'2022-07-04');
insert into Child(childid,pregnancyid,cdob) values(34,05,'2022-09-01');
insert into Child(childid,pregnancyid,cdob) values(35,05,'2022-09-01');
insert into Child(childid,pregnancyid,cdob) values(36,05,'2022-09-01');
insert into Child(childid,pregnancyid,cdob) values(37,05,'2022-09-01');
insert into Child(childid,pregnancyid,cdob) values(38,05,'2022-09-01');
insert into Child(childid,pregnancyid,cdob) values(39,05,'2022-01-01');