<%@page import="com.bean.Subject"%>
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
<a href="storeSubject.jsp">Add Subject</a><br>

<h1>The Following Subjects are listed</h1>
<%
Configuration con=new Configuration();
con.configure("hibernate.cfg.xml");
	SessionFactory sf  = con.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Subject> subjects = hibernateSession.createQuery("from Subject").list();
%>
<table border="1">
<tr>
<th>Subject Id</th>
<th>Subject Name </th>
</tr>
	<%		
		for(Subject subject : subjects){
			out.print("<tr>");	
			out.print("<td>" + subject.getSubject_id() + "</td>");
			out.print("<td>" + subject.getName() + "</td>");
			out.print("</tr>");	
		}
	%>
</table>



</body>
</html>