#Find Patient's name and AMKA and doctor's name and Identity
# whopatients will make an appointment on 18/11/2019 

select patients.AMKA , patients.Name as PatientsName,  staff.Name as DoctorsName, doctor.Identity 
FROM has_appointment_with  JOIN patients ON has_appointment_with.AMKA = patients.AMKA
JOIN doctor on doctor.Identity = has_appointment_with.Identity 
JOIN staff on staff.Identity = doctor.Identity
WHERE has_appointment_with.Date ="2019-12-15"
