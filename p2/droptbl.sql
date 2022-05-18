-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.
drop table Midwife;
drop table Mother;
drop table Father;
drop table Child;
drop table Appointment;
drop table InfoSession;
drop table LabTechnician;
drop table Parents;
drop table Pregnancy;
drop table HealthcareInstitution;
drop table BirthingCenter;
drop table CommunityClinic;
drop table TestSamples;
drop table Notes;
