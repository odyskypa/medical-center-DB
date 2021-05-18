#Find all the Staff names, identities and the working days:

Select staff.name, staff.Identity, works.WorkingDays
from staff left join works on staff.Identity= works.Identity