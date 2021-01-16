package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
	private static Connection con;
	public static Connection getConnection(){
		try{
			if(con==null){
				//driver class load
				Class.forName("com.mysql.jdbc.Driver");
				//create connection to database
				con=DriverManager.getConnection("jdbc:mysql://localhost/ techblog","root","natiq");
			}
			
		}catch(Exception e){ e.printStackTrace();}
		
		return con;
	}

}
