package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class EditServlet extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter(); 
		 //fetch the updated values from the form
		 String userName=request.getParameter("user_name");
		 String userEmail=request.getParameter("user_email");
		 String userPassword=request.getParameter("user_password");
		 String userAbout=request.getParameter("user_about");
		 
		 //get the user object from the current session and update it
		 HttpSession s=request.getSession();
		 User user=(User) s.getAttribute("CurrentUser");
		 user.setName(userName);
		 user.setEmail(userEmail);
		 user.setPassword(userPassword);
		 user.setAbout(userAbout);
		 
		 //update DataBase
		 UserDao userdao=new UserDao(ConnectionProvider.getConnection());
		 boolean ans= userdao.updateUser(user);
		 if(ans){
			 out.println("<h1> User Updated</h1");
			 out.println("<a href='Profile.jsp'>Back to Profile page...</a>");
			
		 }
		 else{
			 out.println("<h2>Not updated...</h2");
		 }
		 
		 
		 
		 
		 
		 
		 
		 
}}