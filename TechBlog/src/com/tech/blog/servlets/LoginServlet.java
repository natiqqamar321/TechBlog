package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter(); 
		
		//fetch UserEmail and UserPassword from request
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User u=dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(u==null){
			//out.println("invalid details");
		Message msg=new Message("Invalid Details !try with another","error","alert-danger");
		HttpSession s=request.getSession();
		s.setAttribute("msg",msg);
		response.sendRedirect("Login_page.jsp");
		}
		else{
			HttpSession s=request.getSession();
			s.setAttribute("CurrentUser",u);
			response.sendRedirect("Profile.jsp");
		}

}
}