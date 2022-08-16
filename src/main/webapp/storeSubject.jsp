<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">Add Subject Details</h2>
<form action="SubjectController" method="post" align="center" >
<label align="center">Enter Subject Id</label>
<input type="text" name="subject_id" align="center"><br/>
<label align="center">Enter Subject Name</label>
<input type="text" name="name" align="center"><br/>
<input type="submit" value="StoreSubjectDetails">
<input type="reset" value="reset">
</form>
<a href="home.jsp">Main Page</a>
</body>
</body>
</html>