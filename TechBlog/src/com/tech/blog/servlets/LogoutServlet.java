package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

public class LogoutServlet extends HttpServlet{
	public void doGet(HttpServletRequest request , HttpServletResponse response) throws IOException , ServletException
	{
		// response.setContentType("text/html");
		//PrintWriter out=response.getWriter(); 
		HttpSession s=request.getSession();
		s.removeAttribute("CurrentUser");
		Message m=new Message("Logout Successfully","success","alert-success");
		s.setAttribute("msg",m);
		response.sendRedirect("Login_page.jsp");
	}}
