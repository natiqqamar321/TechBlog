<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <!--------------- CSS -------------->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/TechBlog/css/mystyle.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style >
.banner-background{
  clip-path: polygon(50% 0%, 100% 0, 100% 96%, 65% 90%, 31% 100%, 0 92%, 0 0);
}
</style>
<!-----------end CSS-------------------->

<title>project index page</title>
</head>
<body>

<!---- import Navbar---->
<%@include file="normal_navbar.jsp" %>
<!------end Navbar --->

<!----banner ------->
<div class="container-fluid p-0 m-0">
<div class="jumbotron primary-background text-white banner-background">
<div class="container">
<h2 class="display-3">Welcome to Tech Blog</h2>
<p>Welcome to technical blog, World of technology,A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
<b class="font-italic">Get the Knowledge and Share your Knowledge</b><br><br>
<a href="register_page.jsp" class="btn btn btn-info btn-lg"><span class="fa fa-sign-in"></span> start! its free</a>
<a href="Login_page.jsp" class="btn btn btn-info btn-lg"><span class="fa fa-user-circle-o"></span> Login</a>
</div>
</div>
</div>
<!-----end banner -------->


<!-------container------------>
<!-------1 row------------>
<div class="container">
<div class="row mb-2">
<div class="col-md-4">
<div class="card" >
  <div class="card-body">
    <h5 class="card-title">Block Chain</h5>
     <img class="card-img-top" src="img/Blockchain.jpg" alt="Card image cap">
    <p class="card-text"></p>
    <a href="#" class="btn primary-background text-white">Login for read...</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card" >
    <div class="card-body">
    <h5 class="card-title">JavaScript</h5>
    <img class="card-img-top" src="img/js.jpg" alt="Card image cap">
    <p class="card-text"></p>
    <a href="#" class="btn primary-background text-white">Login for read...</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card" >
    <div class="card-body">
    <h5 class="card-title">Database Programming</h5>
     <img class="card-img-top" src="img/databasepic.png" alt="Card image cap">
    <p class="card-text"></p>
    <a href="#" class="btn primary-background text-white">Login for read...</a>
  </div>
</div>
</div>
</div>
<!--------1st Row End here ---------->

<!---------2nd row start------------->
<div class="row">
<div class="col-md-4">
<div class="card" >
    <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
     <img class="card-img-top" src="img/javaimage.jpg" alt="Card image cap">
    <p class="card-text"></p>
    <a href="#" class="btn primary-background text-white">Login for read...</a>
  </div> 
</div>
</div>
<div class="col-md-4">
<div class="card" >
    <div class="card-body">
    <h5 class="card-title">Edge Computing</h5>
     <img class="card-img-top" src="img/edge.png" alt="Card image cap">
    <p class="card-text"></p>
    <a href="#" class="btn primary-background text-white">Login for read...</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card" >
    <div class="card-body">
    <h5 class="card-title">Artificial Intelligence</h5>
      <img class="card-img-top" src="img/AI.jpg" alt="Card image cap">
    <p class="card-text"></p>
    <a href="#" class="btn primary-background text-white">Login for read...</a>
  </div>
</div>
</div>
</div>
<!----------------------2nd Row end here ----------->
</div>
<!------------- container end here ------------------->


<!------------JavaScript start  --------------------->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="/TechBlog/js/myjs.js" type="text/javascript"></script>
<!------------JavaScript end here ------------------>



</body>
</html>