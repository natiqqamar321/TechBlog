package com.tech.blog.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
@MultipartConfig
public class RegisterServlet  extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String check=request.getParameter("check");
		if(check==null)
			out.println("Box not checked");
		else{
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String gender=request.getParameter("gender");
			String about=request.getParameter("about");
			
			//create object of User to set all data 
			User user=new User(name,email,password,about,gender);
			
			//create object of UserDao to send data into database
			
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user)){
				out.println("savedtodatabase");
			}
			else{
				out.println("error");
			}
		}
		
	}

}

