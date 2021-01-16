<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page errorPage="Error_page.jsp" %>
<%@page import="com.tech.blog.entities.User" %>

<%
User user=(User)session.getAttribute("CurrentUser");
if(user==null){
	response.sendRedirect("Login.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<!-------------- CSS --------------->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/TechBlog/css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body{
  background: url(pics/techblog.jpg);
  background-size: cover;
  background-attachment: fixed;
  }
 
.list-group-item.active {
    z-index: 2;
    color: #fff;
    background-color:#32b8e6;
    border-color: #32b8e6;
}

</style>
 <!-----------------CSS end------------------->
 
 
 <title>Profile page</title>

</head>
<body>

<!---------------- Nav bar --------------------->

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-laptop"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="	fa fa-graduation-cap"></span>Share Skills <span class="sr-only">(current)</span></a>
      </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class="fa fa-language"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">All computer Latest Technologies</a>
          
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="https://www.linkedin.com/in/natiq-qamar-b51a88189/"> <span class="fa fa-linkedin-square"></span>Developer</a>
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
 <!--------------------- end of navbar ---------------------------->
         
         
         
 <!-------------------main body start  --------------------->
        <main>
         <div class="container">
         
         <!--row start from margin top=4 --------------------->
          <div class="row mt-4">
           <div class="col-md-4">
         <div class="list-group">
          <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active"> All Posts
          </a>
           <!---------- fetch the categories --------->
           <%
           PostDao d=new PostDao(ConnectionProvider.getConnection());
           ArrayList<Categories> list1= d.getAllCategories();
           for(Categories cc:list1){
        	%>   
        	<a href="#" onclick="getPosts(<%=cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>
           <% 	
           }
           %>
            </div>
              </div>
              
         <!-----end categories list group on left side  -->
         
         <div class="col-md-8">
           <!-- posts -->
           <div class="container text-center mt-4 text-muted" id="loader">
           <i class="fa fa-refresh fa-3x fa-spin"></i>
           <h3 class="mt-2  text-muted">Loading...</h3>
           </div>
           <div class="container-fluid" id="post-container">
           </div>
         </div>
         </div>
           <!----------------------------------- row end--------------------->
           
         
          </div>
         </main>
        <!----------------main body end  ------------->
        
         
         
 <!----------------profile model ------------->
        
<!-- Modal -->
<div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
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
<!----------------table end ------------------>



<!---------------- edit details ------------->
<div id="profile-edit" style="display:none;">
   <h3 class="mt-2">Please Edit carefully</h3>
   <form id="edit-user-detail" action="EditServlet" method="post">
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
    <button type="submit" class="btn btn btn-info">Save</button>
     </div>
   </form>
</div>
<!------------- end edit details --------------->

       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
        <button id="edit-profile-btn" type="button" class="btn btn-info">Edit</button>
      </div>
    </div>
  </div>
</div>
 <!----------------end of profile model  -->
  
  
         
 <!---------------Post modal ----------------->
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
           <label>Select your post pic</label>
           <input type="file" name="pic"  class="form-control"/>
          </div>
        
          <div class="container text-center">
            <button type="submit" class="btn btn btn-info">Post</button>
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

<!--edit form  -->
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
 
 <!--user edit  -->

 
 

<!----------now add post ---------->
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


<!-- loading post using ajax -->
<script>
function getPosts(catid,temp){
	$("#loader").show();
	$("#post-container").hide();
	
	$(".c-link").removeClass('active');
	$.ajax({
		url:"load_posts.jsp",
		data:{cid:catid},
		success:function(data,textStatus,jqXHR){
			console.log(data);
			$("#loader").hide();
			$("#post-container").show();
			$("#post-container").html(data);
			
			$(temp).addClass('active');
		}
	})
}
$(document).ready(function(e){
	let allpostsref=$('.c-link')[0];
	getPosts(0,allpostsref)
})
</script>



</body>
</html>