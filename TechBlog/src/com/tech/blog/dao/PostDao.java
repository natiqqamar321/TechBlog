package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;


public class PostDao {
	Connection con;
	
	public PostDao(Connection con){
		this.con=con;
	}
	
 public ArrayList<Categories> getAllCategories(){
	 ArrayList<Categories> list=new ArrayList<>();
	 try{
		 
		 String q="select *from categories";
		 Statement st=this.con.createStatement();
		 ResultSet rs=st.executeQuery(q);
		 while(rs.next()){
			 int cid=rs.getInt("cid");
			 String name=rs.getString("name");
			 String description=rs.getString("description");
			 Categories c=new Categories(cid,name,description);
			 list.add(c);
		 }
		 
		 
	 }catch(Exception e){e.printStackTrace();}
	 

	 return list;
 }
 
 public boolean savePost(Post p){
	 boolean f=false;
	 try{
		 String q="insert into posts(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
		 PreparedStatement psmt=con.prepareStatement(q);
		 psmt.setString(1,p.getPtitle());
		 psmt.setString(2,p.getPcontent());
		 psmt.setString(3,p.getPcode());
		 psmt.setString(4,p.getPpic());
		 psmt.setInt(5,p.getCatid());
		 psmt.setInt(6,p.getUserid());
		 
		 psmt.executeUpdate();
		 f=true;
		 
	 }catch(Exception e){e.printStackTrace();}
	 return f;

 }
 
 //get All Posts
 public List<Post> getAllPosts(){
	 List<Post> list=new ArrayList<>();
	 try{
		 PreparedStatement p=con.prepareStatement("select * from posts");
		 ResultSet rs=p.executeQuery();
		 while(rs.next()){
			 int pid=rs.getInt("pid");
			 String ptitle=rs.getString("ptitle");
			 String pcontent=rs.getString("pcontent");
			 String pcode=rs.getString("pcode");
			 String ppic=rs.getString("ppic");
			 Timestamp pdate=rs.getTimestamp("pdate");
			 int catid=rs.getInt("catid");
			 int userid=rs.getInt("userid");
			 
			 Post post=new Post(pid, ptitle, pcontent, pcode, ppic, pdate, catid, userid);
			 list.add(post);
		 }
		 
		 
	 }catch(Exception e){e.printStackTrace();}
	 
	 return list;
 }
 
 
 //get Posts by catid
    public List<Post> getPostsByCatid(int catid){
	 List<Post> list=new ArrayList<>();

	 try{
		 PreparedStatement p=con.prepareStatement("select * from posts where catid=?");
		 p.setInt(1,catid);
		 ResultSet rs=p.executeQuery();
		 while(rs.next()){
			 int pid=rs.getInt("pid");
			 String ptitle=rs.getString("ptitle");
			 String pcontent=rs.getString("pcontent");
			 String pcode=rs.getString("pcode");
			 String ppic=rs.getString("ppic");
			 Timestamp pdate=rs.getTimestamp("pdate");
			 int userid=rs.getInt("userid");
			 
			 Post post=new Post(pid, ptitle, pcontent, pcode, ppic, pdate, catid, userid);
			 list.add(post);
		 }
		 
		 
	 }catch(Exception e){e.printStackTrace();}
	 
	 return list;
 }
 
  //get post by post id
    public Post getPostByPostid(int postid){
    	Post post=null;
    	String q="select * from posts where pid=?";
    	try{
    		PreparedStatement p=this.con.prepareStatement(q);
    		p.setInt(1, postid);
    		ResultSet rs=p.executeQuery();
    		if(rs.next()){
    			 int pid=rs.getInt("pid");
    			 String ptitle=rs.getString("ptitle");
    			 String pcontent=rs.getString("pcontent");
    			 String pcode=rs.getString("pcode");
    			 String ppic=rs.getString("ppic");
    			 Timestamp pdate=rs.getTimestamp("pdate");
    			 int catid=rs.getInt("catid");
    			 int userid=rs.getInt("userid");
    			 
    			 post=new Post(pid, ptitle, pcontent, pcode, ppic, pdate, catid, userid);
    		}
    		
    	}catch(Exception e){e.printStackTrace();}
    	return post;
    }
    
    
    
    
    
    
    
    
    
    
    
}
