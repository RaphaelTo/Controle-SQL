select AVG(a.grade) as moyenne,
Case 
    when AVG(a.grade) >= 15  or AVG(a.grade) <= 20 then 'A'
    when AVG(a.grade) >= 10  or AVG(a.grade) < 15 then 'B'
    when AVG(a.grade) >= 5   or AVG(a.grade) < 10 then 'C'
    when AVG(a.grade) >= 0   or AVG(a.grade) < 5 then 'D'
END
, s.firstname, s.lastname 
from assessment a 
left JOIN student s on a.idstudent = s.idstudent
group by s.idstudent
Order by moyenne desc , s.lastname asc