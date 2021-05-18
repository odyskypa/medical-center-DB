# Create user 'patientuser' that can perform select on staff members's names and on hospital sectors:
CREATE USER 'patientuser'@'localhost' IDENTIFIED BY 'mypassword';
CREATE USER 'patientuser'@'%' IDENTIFIED BY 'mypassword';
GRANT SELECT ON db_team58.staff  TO 'patientuser'@'localhost';
GRANT SELECT ON db_team58.hospitalsectors  TO 'patientuser'@'localhost';
GRANT SELECT ON db_team58.staff  TO 'patientuser'@'%';
GRANT SELECT ON db_team58.hospitalsectors TO 'patientuser'@'%';

# Create user 'Doctor' that can perform select queries about working hours and insert and update patient's 
#treatment plan and disease history only from localhost
CREATE USER 'Doctor'@'localhost' IDENTIFIED BY 'doctorpassword';
CREATE USER 'Doctor'@'%' IDENTIFIED BY 'doctorpassword';
GRANT SELECT  ON db_team58.works TO 'Doctor'@'localhost';
GRANT SELECT  ON db_team58.works TO 'Doctor'@'%';
GRANT SELECT  ON db_team58.patients TO 'Doctor'@'localhost';
GRANT SELECT  ON db_team58.patients TO 'Doctor'@'%';
GRANT SELECT,insert, update  ON db_team58.patients TO 'Doctor'@'localhost';
GRANT SELECT,insert, update  ON db_team58.treatmentplan TO 'Doctor'@'localhost';


#Create User SecrataryUser that can select queries in the DB and insert, update staff 
# and patients information only from localhost:

CREATE USER 'SecretaryUser'@'localhost' IDENTIFIED BY 'Secretarypassword';
CREATE USER 'SecretaryUser'@'%' IDENTIFIED BY 'Secretarypassword';
GRANT SELECT ON db_team58.* TO 'SecretaryUser'@'localhost';
GRANT SELECT ON db_team58.* TO 'SecretaryUser'@'%';
GRANT SELECT,insert, update  ON db_team58.staff TO 'SecretaryUser'@'localhost';
GRANT SELECT,insert, update  ON db_team58.staff TO 'SecretaryUser'@'localhost';

#Create User Admin who has all the privileges and can do everything on the database
# only from localhost:

CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'Superpass';
GRANT ALL PRIVILEGES ON db_team58.* TO 'Admin'@'localhost';



