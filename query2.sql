#Find the names of the staff Names and Identities who works on Monday or Tuesday from 08:00 to 16:00

SELECT staff.Name, staff.Identity
FROM staff JOIN works ON staff.Identity=works.Identity
WHERE (works.WorkingDays= "Mon" or works.WorkingDays= "Tue") and FromHour= "08:00" and ToHour="16:00"