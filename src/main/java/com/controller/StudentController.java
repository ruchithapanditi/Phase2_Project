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

import com.bean.Student;
import com.bean.Subject;
import com.service.StudentService;
import com.service.SubjectService;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		StudentService ss=new StudentService();
		List<Student> listOfStudent=ss.findAllStudentDetails();
		HttpSession hs = request.getSession();
		hs.setAttribute("listOfStudent",listOfStudent);
		response.setContentType("text/html");
		response.sendRedirect("viewStudent.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		int student_id=Integer.parseInt(request.getParameter("student_id"));
		String name=request.getParameter("name");
		Student student=new Student();
		student.setName(name);
		student.setStudent_id(student_id);
		StudentService ss=new StudentService();
		String result=ss.StoreSubjectDetails(student);
		out.println(result);
		RequestDispatcher rd = request.getRequestDispatcher("storeStudent.jsp");
		rd.include(request, response);
	}

}
