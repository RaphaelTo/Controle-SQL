select AVG(a.grade) as moyenne, s.firstname, s.lastname 
from assessment a 
left JOIN student s on a.idstudent = s.idstudent
Where a.idmodule = 3 Or a.idmodule = 4
group by s.idstudent