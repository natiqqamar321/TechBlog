package com.tech.blog.dao;
import com.sun.org.apache.bcel.internal.generic.Select;
import com.tech.blog.entities.*;
import java.sql.*;
public class UserDao {
private Connection con;
public UserDao(Connection con){
	this.con=con;
}
//method to insert user to data
public boolean saveUser(User user){
	boolean f=false;
	try{
		//user to database
		String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
	    PreparedStatement psmt=this.con.prepareStatement(query);
	    psmt.setString(1,user.getName());
	    psmt.setString(2, user.getEmail());
	    psmt.setString(3,user.getPassword());
	    psmt.setString(4,user.getGender());
	    psmt.setString(5,user.getAbout());
	    
	    psmt.executeUpdate();
	    f=true;
		
	}catch(Exception e){e.printStackTrace();}
	
	return f;
}

public User getUserByEmailAndPassword(String email,String password){
	User user=null;
	try{
		String query="select * from user where email=? and password=?";
	PreparedStatement psmt=con.prepareStatement(query);
	psmt.setString(1, email);
	psmt.setString(2,password);
	
	ResultSet rs=psmt.executeQuery();
	if(rs.next()){
		user=new User();
		//data from db
		String name=rs.getString("name");
		user.setName(name);
		user.setId(rs.getInt("id"));
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		user.setGender(rs.getString("gender"));
		user.setAbout(rs.getString("about"));
		user.setDateTime(rs.getTimestamp("regdate"));
		user.setProfile(rs.getString("profile"));
	}
		
	}catch(Exception e){e.printStackTrace();}
	return user;
}
 
public boolean updateUser(User user){
	boolean f=false;
	try{
		String query="update user set name=?,email=?,password=?,gender=?,about=? where id=?";
		PreparedStatement p=con.prepareStatement(query);
		p.setString(1,user.getName());
		p.setString(2, user.getEmail());
		p.setString(3,user.getPassword());
		p.setString(4, user.getGender());
		p.setString(5,user.getAbout());
		p.setInt(6,user.getId());
		
		p.executeUpdate();
		f=true;
		
	}catch(Exception e){e.printStackTrace();}
	return f;
}

public User getUserbyUserid(int userid){
	User us=null;
	try{
		String q="select * from user where id=?";
		PreparedStatement p=con.prepareStatement(q);
		p.setInt(1,userid);
		ResultSet set=p.executeQuery();
		if(set.next()){
			us=new User();
			//data from db
			String name=set.getString("name");
			us.setName(name);
			us.setId(set.getInt("id"));
			us.setEmail(set.getString("email"));
			us.setPassword(set.getString("password"));
			us.setGender(set.getString("gender"));
			us.setAbout(set.getString("about"));
			us.setDateTime(set.getTimestamp("regdate"));
			us.setProfile(set.getString("profile"));
		}
		
	}catch(Exception e){e.printStackTrace();}
	return us;
}
}
