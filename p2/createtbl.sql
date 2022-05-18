-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
-- CREATE TABLE MYTEST01
-- (
--   id INTEGER NOT NULL
--  ,value INTEGER
--  ,PRIMARY KEY(id)
-- );
create table HealthcareInstitution
(
    hid integer not null,
    hname char(50) not null ,
    hemail varchar(30) not null,
    website varchar(50),
    haddress varchar(100) not null,
    hphone char(20) not null,
    primary key(hid)
);
create table BirthingCenter
(
    hid integer not null,
    primary key (hid),
    foreign key(hid) references HealthcareInstitution(hid)
);
create table CommunityClinic
(
    hid integer not null,
    primary key (hid),
    foreign key(hid) references HealthcareInstitution(hid)
);
create table Midwife
(
    practitionerid integer not null,
    name char(30) not null,
    email varchar(30) not null,
    phone varchar(20) not null,
    hid integer not null,
    primary key(practitionerid),
    foreign key(hid) references HealthcareInstitution
);

create table Mother
(
    hcardid varchar(12) not null,
    mname char(30) not null,
    memail varchar(30) not null,
    mphone char(20) not null,
    mdob DATE not null,
    maddress varchar(100) not null,
    mprofession char(20) not null,
    mbloodtype char(3) not null,
    primary key(hcardid)
);
create table Parents
(
    coupleid integer not null,
    hcardid varchar(12) not null,
    primary key(coupleid),
    foreign key(hcardid) references Mother
);
create table Father
(
    fname char(20) not null, --set partial key
    coupleid integer not null,
    fdob DATE not null,
    fphone char(20) not null,
    fprofession char(20) not null,
    faddress varchar(100),
    femail varchar(30),
    fblootype varchar(3),
    fcardid varchar(12),
    primary key(fname, coupleid),
    foreign key (coupleid) references Parents(coupleid)
);

create table Pregnancy
(
    pregnancyid integer not null,
    pregnum integer not null,
    expdueym DATE not null,
    estdued DATE,
    usounddued DATE,
    lmpdued DATE,
--     childid varchar(20) not null,
    coupleid integer not null,
    practitionerid integer not null,
    backupid integer not null,
    homebirth int default 0,
    numbabies int default 1,
--     foreign key(childid) references Child(childid),
    foreign key(coupleid) references Parents(coupleid),
    foreign key(practitionerid) references Midwife(practitionerid),
    foreign key(backupid) references Midwife(practitionerid),
    primary key(pregnancyid)
);
create table Child
(
    childid varchar(20) not null,
    pregnancyid integer not null,
    cname char(30),--optional
    cdob DATE,
    cgender char(15),
    cbloodtype char(3),
    primary key(childid),
    foreign key(pregnancyid) references Pregnancy(pregnancyid)
);
create table Appointment
(
    aid integer not null,
    practitionerid integer not null,
    pregnancyid integer not null,
    adate DATE not null,
    atime TIME not null,
    primary key(aid),
    foreign key (practitionerid) references Midwife,
    foreign key(pregnancyid) references Pregnancy
);
create table InfoSession
(
    iid integer not null,
    coupleid integer not null,
    idate DATE not null,
    itime TIME not null,
    language char(20) not null,
    attended int default 1,
    primary key(iid),
    foreign key(coupleid) references Parents(coupleid)
);
create table LabTechnician
(
    tid integer not null,
    tname char(30) not null,
    tphone char(20) not null,
    primary key (tid)
);


create table TestSamples(
    testid integer not null,
    practitionerid integer not null, --Midwife
    pregnancyid integer, -- either pregnancyid or childid can be null
    childid varchar (20),
    tid integer not null,
    testtype varchar(30) not null,
    labdate DATE not null,
    prescdate DATE not null,
    sampdate DATE, --optional
    results varchar(150),
    primary key(testid),
    foreign key(practitionerid) references Midwife(practitionerid), --delete this
    foreign key(childid) references Child(childid),
    foreign key (pregnancyid) references Pregnancy(pregnancyid),
    foreign key(tid) references LabTechnician
);
create table Notes
(
    aid integer not null ,
    noteid varchar (20) not null,
    timestmp timestamp not null,
    text varchar (200),
    primary key(aid, noteid),
    foreign key (aid) references Appointment
);


