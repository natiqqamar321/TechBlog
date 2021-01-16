package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection con;
   public LikeDao(Connection con) {
		this.con = con;
	}
   //method for inserting likes 
 public boolean insertLike(int pid,int uid){
	 boolean f=false;
	 try{
		 String q="insert into liked(pid,uid) values(?,?)";
		 PreparedStatement psmt=this.con.prepareStatement(q);
		 //value set
		 psmt.setInt(1,pid);
		 psmt.setInt(2,uid);
		 psmt.executeUpdate();
		 f=true;
	 }catch(Exception e){e.printStackTrace();}
	 return f;
 }
 
 //method for counting likes
 public int countLikesOnPost(int pid){
	 int count=0;
	 try{
		 String q="select count(*) from liked where pid=?";
		 PreparedStatement pm=this.con.prepareStatement(q);
		 pm.setInt(1,pid);
		 ResultSet rs=pm.executeQuery();
		 if(rs.next()){
			 count=rs.getInt("count(*)");
		 }
		 
	 }catch(Exception e){e.printStackTrace();}
	 return count;
 }
 
 //check Already liked post
 public boolean isLikedByUser(int pid,int uid){
	 boolean f=false;
	 try{
		 String q="select *from liked where pid=? and uid=?";
		 PreparedStatement pmt=this.con.prepareStatement(q);
		 pmt.setInt(1,pid);
		 pmt.setInt(2,uid);
		 ResultSet rs=pmt.executeQuery();
		 if(rs.next()){
			 f=true;
		 }
	 }catch(Exception e){e.printStackTrace();}
	 return f;
 }
 
 //delete like
 public boolean deletePost(int pid,int uid){
	 boolean f=false;
	 try{
		 String q="delete from liked where pid=? and uid=?";
		 PreparedStatement pmt=this.con.prepareStatement(q);
		 pmt.setInt(1,pid);
		 pmt.setInt(2,uid);
		 pmt.executeUpdate();
		 
		 f=true;
	 }catch(Exception e){e.printStackTrace();}
	 return f;
 }
 
 

}
