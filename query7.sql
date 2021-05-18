select  contains.MedicalEquipmentID , medicalequipment.Name
from medicalequipment join contains on medicalequipment.MedicalEquipmentID =contains.MedicalEquipmentID
where contains.SectorName ="Surgery"

and  contains.MedicalEquipmentID 
NOT IN

(select  contains.MedicalEquipmentID
from medicalequipment join contains on medicalequipment.MedicalEquipmentID =contains.MedicalEquipmentID
where contains.SectorName ="Cardiological");
