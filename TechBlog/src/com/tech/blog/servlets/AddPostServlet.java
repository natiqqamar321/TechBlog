package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class AddPostServlet  extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int cid=Integer.parseInt(request.getParameter("cid"));
		String ptitle=request.getParameter("ptitle");
		String pcontent=request.getParameter("pcontent");
		String pcode=request.getParameter("pcode");
		Part part=request.getPart("pic");
		 //getting user from session
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("CurrentUser");
	    
		Post p=new Post(ptitle,pcontent,pcode,part.getSubmittedFileName(),null,cid,user.getId());
		
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p)){
			String path=request.getRealPath("/")+"img"+File.separator+part.getSubmittedFileName();
			Helper.savFile(part.getInputStream(), path);
			//out.println(path);
			out.println("done");
		}
		else{
			out.println("something went wrong");
		}

	}
	}
