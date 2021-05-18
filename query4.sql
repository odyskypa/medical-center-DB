SELECT DISTINCT  x.Name FROM medicalequipment AS x WHERE NOT 
EXISTS(SELECT * FROM hospitalsectors AS y WHERE NOT 
EXISTS(SELECT * FROM contains AS z 
    WHERE z.MedicalEquipmentID = x.MedicalEquipmentID 
    AND z.SectorName = y.SectorName ))