--adate='03/23/2022'
--practitionerid='01'
select *
from APPOINTMENT A inner join MIDWIFE M on M.PRACTITIONERID = '01' and A.ADATE='03/23/2022'
inner join PREGNANCY P on A.PREGNANCYID = P.PREGNANCYID;

select MOTHER.MNAME, MOTHER.HCARDID,PREGNANCY.PREGNANCYID from PREGNANCY
    inner join APPOINTMENT on pregnancy.pregnancyid=appointment.pregnancyid
    inner join PARENTS on parents.coupleid=pregnancy.coupleid
    inner join MOTHER on mother.hcardid=parents.hcardid
    inner join MIDWIFE M on M.PRACTITIONERID = APPOINTMENT.PRACTITIONERID
    where (APPOINTMENT.PRACTITIONERID='01' or PREGNANCY.BACKUPID='01') and ADATE='03/23/2022';

select * from NOTES; --aid, noteid, timestmp, text

select * from TESTSAMPLES; --testid, practitionerid, pregnancyid, childid, tid, testtype, labdate, dates

select MOTHER.MNAME, MOTHER.HCARDID,APPOINTMENT.AID from PREGNANCY
inner join APPOINTMENT on pregnancy.pregnancyid=appointment.pregnancyid
inner join PARENTS on parents.coupleid=pregnancy.coupleid
inner join MOTHER on mother.hcardid=parents.hcardid
inner join MIDWIFE M on M.PRACTITIONERID = APPOINTMENT.PRACTITIONERID
inner join NOTES N on APPOINTMENT.AID = N.AID
where APPOINTMENT.AID=1;
-- where (APPOINTMENT.PRACTITIONERID='01' or PREGNANCY.BACKUPID='01') and ADATE='03/23/2022' and APPOINTMENT.AID='01';


select max(NOTEID) from NOTES where aid=1


select APPOINTMENT.AID, APPOINTMENT.ATIME,MOTHER.MNAME, MOTHER.HCARDID,PREGNANCY.PREGNANCYID from PREGNANCY inner join APPOINTMENT on pregnancy.pregnancyid=appointment.pregnancyid inner join PARENTS on parents.coupleid=pregnancy.coupleid inner join MOTHER on mother.hcardid=parents.hcardid
    inner join MIDWIFE M on M.PRACTITIONERID = APPOINTMENT.PRACTITIONERID
where (APPOINTMENT.PRACTITIONERID='1') and ADATE='03/23/2022';

insert into TestSamples(testid,practitionerid,pregnancyid,tid,testtype,labdate,prescdate)
values('9','1','1','06','trisomy 21','2022-03-15','2022-03-15');

select * from parents where hcardid=(select hcardid from mother where mother.mname='Ashlee Krause');

select * from APPOINTMENT;
select PREGNANCY.PREGNUM,P.COUPLEID,N.NOTEID, N.TIMESTMP,substring(N.TEXT,0,50) from pregnancy
    inner join PARENTS P on P.COUPLEID = PREGNANCY.COUPLEID
    inner join APPOINTMENT A on PREGNANCY.PREGNANCYID = A.PREGNANCYID
    inner join NOTES N on A.AID = N.AID
where P.HCARDID=(select HCARDID from MOTHER where MNAME='Jada Miles');

select * from TESTSAMPLES;
select PREGNANCY.PREGNUM,P.COUPLEID,T.TESTID, T.TESTTYPE,substring(T.RESULTS,0,50) from pregnancy
inner join PARENTS P on P.COUPLEID = PREGNANCY.COUPLEID
inner join APPOINTMENT A on PREGNANCY.PREGNANCYID = A.PREGNANCYID
inner join TESTSAMPLES T on PREGNANCY.PREGNANCYID = T.PREGNANCYID
where P.HCARDID=(select HCARDID from MOTHER where MNAME='Jada Miles');

select month(cdob) as month, count(*) as num_birth from CHILD group by month(cdob);