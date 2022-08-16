<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">Add StudentDetails</h2>
<form action="TeacherController" method="post" align="center" >
<label align="center">Enter Teacher Id</label>
<input type="text" name="teacher_id" align="center"><br/>
<label align="center">Enter Teacher Name</label>
<input type="text" name="name" align="center"><br/>
<input type="submit" value="StoreTeacherDetails">
<input type="reset" value="reset">
</form>
<a href="home.jsp">Main Page</a>
</body>
</body>
</html>