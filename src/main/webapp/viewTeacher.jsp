<%@page import="com.bean.Subject"%>
<%@page import="com.bean.Teacher"%>
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
<a href="storeTeacher.jsp">Add Teacher</a><br>
<a href="AddTeachertoSubject.jsp">Assign Teacher to Subject</a><br>

<h1>The Following Teachers are listed</h1>
<%
Configuration con=new Configuration();
con.configure("hibernate.cfg.xml");
	SessionFactory sf  = con.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Teacher> teachers = hibernateSession.createQuery("from Teacher").list();
%>
<table border="1">
<tr>
<th>Teacher Name </th>

<th>Assigned Subject</th>
</tr>
	<%		
		for(Teacher teacher : teachers){
			out.print("<tr>");	
			out.print("<td>" + teacher.getName() + "</td>");
		StringBuffer buf = new StringBuffer();
		boolean first = true;
			for (Subject subject : teacher.getSubjects()){
				if(first== true){
					buf.append("<td>" + subject.getName() + "</td>");
					buf.append("</tr>");
					first = false;
				}else{
					buf.append("<tr><td></td><td></td>");
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