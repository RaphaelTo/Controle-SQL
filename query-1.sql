select s.firstname, s.lastname, e.to
from student s
left join enrolment e on s.idstudent = e.student_idstudent