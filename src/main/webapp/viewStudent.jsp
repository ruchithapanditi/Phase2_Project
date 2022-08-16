<%@page import="com.bean.Student"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="home.jsp">Back to Main Menu</a><br>
<a href="storeStudent.jsp">Add Student</a><br>
<a href="AssignStudenttoClass.jsp">Assign Student</a>

<h1>The Following Students are listed</h1>
<%
Configuration con=new Configuration();
con.configure("hibernate.cfg.xml");
	SessionFactory sf  = con.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Student> students = hibernateSession.createQuery("from Student").list();
%>
<table border="1">
<tr>
<th>Student Id </th>
<th>Name </th>
<th>Assigned Class Name </th>
</tr>
	<%		
		for(Student student : students){
			out.print("<tr>");	
			out.print("<td>" + student.getStudent_id() + "</td>");
			out.print("<td>" + student.getName() + "</td>");
	
			out.print("<td>" + getClassName(student) + "</td>");
			out.print("</tr>");	
		}
	%>
</table>

<%!
	public String getClassName(Student student){
	if (student.getClasses() == null){
		return "no class assigned";
	}
	else{
		return student.getClasses().getName();
	}
}
%>
</body>
</html>