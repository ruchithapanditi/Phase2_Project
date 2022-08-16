<%@page import="com.bean.Subject"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.bean.Classes"%>
<%@page import="java.util.List"%>
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
<a href="storeClass.jsp">Add Class</a><br>
<a href="AssignSubjecttoClass.jsp">Assign Subject to Class</a><br>

<h1>The Following Classes are listed</h1>
<%
Configuration con=new Configuration();
con.configure("hibernate.cfg.xml");
	SessionFactory sf  = con.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Classes> classes = hibernateSession.createQuery("from Classes").list();
%>
<table border="1">
<tr>
<th>Class Name </th>
<th>Subject Name</th>
</tr>	
	<%		
		for(Classes clas : classes){
			out.print("<tr>");	
			out.print("<td>" + clas.getName() + "</td>");
						
			StringBuffer buf = new StringBuffer();
			boolean first = true;
			for (Subject subject : clas.getSubjects()){
				if(first== true){
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
					first = false;
				}else{
					buf.append("<tr><td></td>");
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
				}
				
			}
			out.print(buf.toString());
		}
	%>
</table>
</body>
</html>