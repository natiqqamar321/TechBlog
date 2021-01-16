<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.User"%>
<%@ page errorPage="Error_page.jsp" %>
<%
User user=(User)session.getAttribute("CurrentUser");
if(user==null){
	response.sendRedirect("Login.jsp");
}
%>
<%
int postid=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(ConnectionProvider.getConnection());
Post p=d.getPostByPostid(postid);
%>

<html>
<head>
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/TechBlog/css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 96%, 65% 90%, 31% 100%, 0 92%, 0 0);
}
.post-title{
   font-weight: 100;
   font-size: 30px;
   
  }
  .post-content{
   font-weight: 100;
   font-size: 30px;
   
  }
  .post-code{
   font-weight: 100;
   font-size: 30px;
   
  }
  .post-userinfo{
  font-size: 20px;
  font-weight: 150;
  }
  .post-date{
  font-style: italic;
  
  }
  
  body{
  background: url(pics/techblog.jpg);
  background-size: cover;
  background-attachment: fixed;
  }
  
</style>
 <!--CSS end  -->
 
 <!--facebook plugin  -->
 <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0" nonce="fq731Fwo"></script>
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=p.getPtitle() %>||TechBlog by Natiq Qamar</title>
</head>
<body>
<!-- Nav bar -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-laptop"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Profile.jsp"><span class="fa fa-graduation-cap"></span>Share Skills <span class="sr-only">(current)</span></a>
      </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-language"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">All About Computer Latest Technologies</a>
         
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> <span class="fa fa-linkedin-square"></span>Developer</a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="fa fa-asterisk"></span>Do Post</a>
      </li>
         </ul>
          
         <ul class="navbar-nav mr-right">
         
          <li class="nav-item">
          <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-model"> <span class="fa fa-user-o "></span><%=user.getName()%></a>
          </li>
         
          <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-circle"></span>Logout</a>
          </li>
         </ul>
         </div>
         </nav>
         <!-- end of navbar -->
         
         <!--main content of body  -->
         <div class="container">
         <div class="row my-3">
         <div class="col-md-8 offset-md-2">
         <div class="card">
         <div class="card-header sec-background text-white">
         <h4 class="post-title"><%=p.getPtitle() %></h4>
         </div>
         <div class="card-body">
          <img class="card-img-top" src="img/<%=p.getPpic() %>" alt="Card image cap">
          <div class="row my-3">
          <div class="col-md-8">
          <%UserDao ud=new UserDao(ConnectionProvider.getConnection()); %>
          <p class="post-userinfo"><a href="#!"><%=ud.getUserbyUserid(p.getUserid()).getName() %></a> has posted:</p>
          </div>
          <div class="col-md-4">
          <p class="post-date"><%=DateFormat.getDateTimeInstance().format(p.getPdate())%></p>
          </div>
          </div>
         <p class="post-content"><%=p.getPcontent() %></p>
         <br>
         <br>
         <div class="post-code">
         <pre><%=p.getPcode() %></pre>
         </div>
         </div>
          <div class="card-footer text-center primary-background">
          <%LikeDao ld=new LikeDao(ConnectionProvider.getConnection()); %>
        <a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId()%>)" class="btn btn-info"> <i class="fa fa-thumbs-o-up"><span class="like-counter"><%=ld.countLikesOnPost(p.getPid()) %></span></i></a>
        <a href="#!" class="btn btn-info "> <i class="fa fa-commenting-o"><span></span></i></a>
         </div>
           <div class="card-footer">
           <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_full.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="20"></div>
           </div>
         
         </div>
         </div>
         </div>
         </div>
         <!-- end of main content of body -->
                  
  
         
         <!--profile model  -->
<!-- Modal -->
<div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="container text-center">
            <h5 class="modal-title" id="exampleModalLabel"><%=user.getName() %></h5>
            <!-- table start-->
            
      <div id="profile-detail">     
            <table class="table">
  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td><%=user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%=user.getEmail() %></td>
     
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%=user.getGender() %></td>
    </tr>
      <tr>
      <th scope="row">Status</th>
      <td><%=user.getAbout() %></td>
    </tr>
    <tr>
      <th scope="row">Registered data</th>
      <td><%=user.getDateTime().toLocalDateTime() %></td>
    </tr>
  </tbody>
</table>
     </div>
<!--table end  -->

 <!-- edit details -->
<div id="profile-edit" style="display:none;">
   <h3 class="mt-2">Please Edit carefully</h3>
   <form action="EditServlet" method="post">
   <table class="table">
    <tr>
      <td>ID</td>
      <td><%=user.getId()%></td>
    </tr>
     <tr>
      <td>Name</td>
      <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
    </tr>
    <tr>
      <td>Password</td>
      <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
    </tr>
     <tr>
      <td>Gender</td>
      <td><%=user.getGender()%></td>
    </tr>
     <tr>
      <td>About</td>
     <td> <textarea rows="3" class="form-control" name="user_about"><%=user.getAbout() %>
      </textarea></td>
    </tr>
   </table>
     <div class="container">
    <button type="submit" class="btn btn-outline-success">Save</button>
     </div>
   </form>
</div>
<!-- end edit details -->
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
         <!--end of profile model  -->
         
         <!--addpost modal  -->

  <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form  id="add-post-form" action="AddPostServlet" method="post">
        
          <div class="form-group">
            <select class="form-control" name="cid">
            <option selected disabled>---Select Category---</option>
            
            <%
            PostDao postd=new PostDao(ConnectionProvider.getConnection());
            ArrayList<Categories> list=postd.getAllCategories();
            for(Categories c:list){
             %>
             <option value="<%=c.getCid() %>"><%=c.getName() %></option>
            <%
             }
            %>
            
              </select>
          </div>
        
          <div class="form-group">
           <input type="text" name="ptitle" placeholder="Enter post title" class="form-control"/>
          </div>
        
            <div class="form-group">
           <textarea name="pcontent" placeholder="Enter post content" style="height:150px;" class="form-control"></textarea>
          </div>
          
          <div class="form-group">
           <textarea name="pcode" placeholder="Enter post code(if any)" style="height:150px;" class="form-control"></textarea>
          </div>
          
          <div class="form-group">
           <label>Select your pic.</label>
           <input type="file" name="pic"  class="form-control"/>
          </div>
        
          <div class="container text-center">
            <button type="submit" class="btn btn-outline-success">Post</button>
          </div>
          
        </form>
      </div>
    </div>
  </div>
</div>
         
         
         <!--end addpost modal  -->

<!--JavaScript  -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" ></script>
<script src="/TechBlog/js/myjs.js" type="text/javascript"></script>

<script>
 $(document).ready(function(){
	 let editstatus=false;
	$('#edit-profile-btn').click(function(){
		    if(editstatus==false){
		 $('#profile-detail').hide();
		 $('#profile-edit').show();
		 editstatus=true;
		 $(this).text("Back");
		}else{
			 $('#profile-detail').show();
			 $('#profile-edit').hide();
			 editstatus=false;
			 $(this).text("Edit");
		}
	}) 
 })
</script>

     <!--now add post  -->
<script >
$(document).ready(function(){
	$("#add-post-form").on("submit",function(event){
		event.preventDefault();
		console.log("you have clicked on sumbit button");
		let form=new FormData(this);
		/* to send form data sending to server */
		$.ajax({
			url:"AddPostServlet",
			type:'POST',
			data:form,
			success:function(data,textStatus,jqXHR){
				console.log(data);
				if(data.trim()=='done'){
					swal("Good job!", "Your post saved successfully!", "success");
				}
				else{
					swal("Error!", "Something Went Wrong,try again!", "error");
				}
			},
			error:function(jqXHR,textStatus,errorThrown){
				swal("Error!", "Something Went Wrong,try again!", "error");
			},
			processData:false,
			contentType:false
		})
	})
})
</script>
       
</body>
</html>