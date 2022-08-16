<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Welcome to Home Page ${sessionScope.obj} </h2>
<h3>Enter Details Here</h3>
<a href="storeClass.jsp">Enter Class Details</a><br>
<a href="storeSubject.jsp">Enter Subject Details</a><br>
<a href="storeStudent.jsp">Enter Student Details</a> <br>
<a href="storeTeacher.jsp">Enter Teacher Details</a> <br>
<h3>View Details Here</h3>
<a href="ClassController">View Class Details</a> <br>
<a href="SubjectController">View Subject Details</a><br>
<a href="StudentController">View StudentDetails</a><br>
<a href="TeacherController">View Teacher Details</a> <br>
<h3>Assign Details Here</h3>
<a href="AssignSubjecttoClass.jsp">Assign subjects to class</a><br>
<a href="AddTeachertoSubject.jsp">Assign Teacher to Subject</a><br>
<a href="AssignStudenttoClass.jsp">Assign Student to Class</a><br>

</body>
</html>