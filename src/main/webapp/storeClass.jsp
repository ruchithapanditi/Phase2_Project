<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">Add Class Details</h2>
<form action="ClassController" method="post" align="center" >
<label align="center">Enter Class Id</label>
<input type="text" name="class_id" align="center"><br/>
<label align="center">Enter Class Name</label>
<input type="text" name="name" align="center"><br/>
<input type="submit" value="StoreClassDetails">
<input type="reset" value="reset">
</form>
<a href="home.jsp">Main Page</a>
</body>
</html>