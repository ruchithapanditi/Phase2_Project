package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.bean.Teacher;
import com.service.TeacherService;

/**
 * Servlet implementation class TeacherController
 */
@WebServlet("/TeacherController")
public class TeacherController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		TeacherService ts=new TeacherService();
		List<Teacher>listOfTeacher=ts.findAllTeacherDetails();
		HttpSession hs = request.getSession();
		hs.setAttribute("listOfTeacher",listOfTeacher);
		response.setContentType("text/html");
		response.sendRedirect("viewTeacher.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		int teacher_id=Integer.parseInt(request.getParameter("teacher_id"));
		String name=request.getParameter("name");
		Teacher teacher=new Teacher();
		
		teacher.setTeacher_id(teacher_id);
		teacher.setName(name);
		TeacherService ts=new TeacherService();
		String result=ts.StoreTeacherDetails(teacher);
		out.println(result);
		RequestDispatcher rd = request.getRequestDispatcher("storeTeacher.jsp");
		rd.include(request, response);
	}

}
