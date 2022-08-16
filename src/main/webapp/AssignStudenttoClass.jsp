<%@page import="com.bean.Classes"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="home.html">Back to Main Menu</a><br>

<h1>Assign a Student to a Class</h1>
<%
    Configuration con=new Configuration();
    con.configure("hibernate.cfg.xml");
	SessionFactory sf  = con.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Student> students = hibernateSession.createQuery("from Student").list();
	List<Classes> classes = hibernateSession.createQuery("from Classes").list();
%>
<form action="AssignStudents" method="post">
<table>
<tr>
<th>Student Name </th>
<th>Class Name </th>
</tr>
<tr>
<td>
<select name="name">
<%
	for (Student student : students){
	out.print("<option>" + student.getName() );
	out.print("</option>");
	}
%>
</select>
</td>

<td>
<select name="class">
<%
	for (Classes clas : classes){
	out.print("<option>" + clas.getName());
	out.print("</option>");
	}
%>
</select>
</td>
</tr>
</table>
<input type="submit" value="Submit">
</form>

</body>
</html>