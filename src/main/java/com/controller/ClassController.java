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

import com.bean.Classes;
import com.service.ClassService;

/**
 * Servlet implementation class ClassController
 */
@WebServlet("/ClassController")
public class ClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ClassService cs=new ClassService();
		List<Classes> listOfClass=cs.findAllClassDetails();
		HttpSession hs = request.getSession();
		hs.setAttribute("listOfClass",listOfClass);
		response.setContentType("text/html");
		response.sendRedirect("viewClass.jsp");
	
	}

	/**
	 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		int class_id=Integer.parseInt(request.getParameter("class_id"));
		String name=request.getParameter("name");
		Classes cls=new Classes();
		cls.setClass_id(class_id);
		cls.setName(name);
		ClassService cs=new ClassService();
		String result=cs.StoreClassDetails(cls);
		out.println(result);
		RequestDispatcher rd = request.getRequestDispatcher("storeClass.jsp");
		rd.include(request, response);
	}

}
