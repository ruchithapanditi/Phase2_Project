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


import com.bean.Subject;

import com.service.SubjectService;

/**
 * Servlet implementation class SubjectController
 */
@WebServlet("/SubjectController")
public class SubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		SubjectService subs=new SubjectService();
		List<Subject> listOfSubject=subs.findAllSubjectDetails();
		HttpSession hs = request.getSession();
		hs.setAttribute("listOfSubject",listOfSubject);
		response.setContentType("text/html");
		response.sendRedirect("viewSubject.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		int subject_id=Integer.parseInt(request.getParameter("subject_id"));
		String name=request.getParameter("name");
		Subject subject=new Subject();
		subject.setSubject_id(subject_id);
		subject.setName(name);
		SubjectService subs=new SubjectService();
		String result=subs.StoreSubjectDetails(subject);
		out.println(result);
		RequestDispatcher rd = request.getRequestDispatcher("storeSubject.jsp");
		rd.include(request, response);
		
		
	}

}
