<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!----------------start CSS -------------->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/TechBlog/css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.bgpic{
  background: url(pics/techblog.jpg);
  background-size: cover;
  background-attachment: fixed;
  }

</style>
<!---------------end CSS--------->

<title>Register page</title>

</head>
<body>
<!------------ navbar ------------------>
	<%@include file="normal_navbar.jsp"%>
<!-------------navbar ------------------->
	
	

 <!--------main start from here-------------->
 
	<main class="bgpic p-4" style="padding-bottom:60px;">
	<div class="container-fluid">
		<div class="col-md-5 offset-md-3">
			<div class="card">
				<div class="card-header text-center sec-background text-white">
					<h3>
						<span class="fa fa-user-circle fa-3x"></span> <br>Register
						here
					</h3>
				</div>
				<div class="card-body">

					<form id="reg-form" action="RegisterServlet" method="POST">

						<div class="form-group">
							<label for="user_name">User name</label> <input name="user_name"
								type="text" class="form-control" id="user_name"
								aria-describedby="emailHelp" placeholder="User name">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								name="user_email" type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="Enter email"> <small id="emailHelp"
								class="form-text text-muted">We'll never share your
								email with anyone else.</small>
						</div>

						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								name="user_password" type="password" class="form-control"
								id="exampleInputPassword1" placeholder="Password">
						</div>

						<div class="form-group">
							<label for="gender">Select Gender</label> <br> <input
								type="radio" id="gender" name="gender" value="male">Male
							<input type="radio" id="gender" name="gender" value="female">Female
						</div>

						<div class="form-group">
							<textarea name="about" class="form-control" rows="5"
								placeholder="Enter about yourself"></textarea>
						</div>


						<div class="form-check">
							<input name="check" type="checkbox" class="form-check-input"
								id="exampleCheck1"> <label class="form-check-label"
								for="exampleCheck1">Agree terms and conditions</label>
						</div>

						<br>
						<div class="container text-center" id="loader" style="display:none;">
					     <span class="fa fa-refresh fa-spin fa-2x"></span>
					     <h3>please wait...</h3>
						</div>
						<button id="submit-btn" type="submit" class="btn btn-info">Submit</button>
					</form>

				</div>

			</div>
		</div>
	</main>
<!------------------------main end here ----------->



<!---------java Script -------------->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="/TechBlog/js/myjs.js" type="text/javascript"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

			<script>
			$(document).ready(function() {console.log("page is ready");
				$("#reg-form").on('submit',function(event) {
					event.preventDefault();
													//var f = $(this).serialize();
					let f = new FormData(this);
					console.log(f);
					
					$("#submit-btn").hide();
					$("#loader").show();

					$.ajax({ //for sent data to the Register servlet without reloading the page
					url : "RegisterServlet",
					data : f,
					type : 'POST',
					success : function(data,textStatus,jqXHR) {
							console.log(data);
							$("#submit-btn").show();
							$("#loader").hide();
							if(data.trim()==='savedtodatabase'){
							 swal("Registered Successfully!..We redirecting to login page")
							.then((value) => {
								 window.location="Login_page.jsp";
							});
							}
							
							else{
								swal(data);
							}
				    	},
					error : function(jqXHR,textStatus,errorThrown) {
							console.log(data);
							console.log("error...");
							$("#submit-btn").show();
							$("#loader").hide();
							swal("Something went wrong!");
																	
						},
						    processData : false,
							contentType : false

						})
					});
			});
		</script>
		<!-------------end JavaScript ------------------->

</body>
</html>