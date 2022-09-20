<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="designweb/login.css">
<!-- <script src="javascript/validate.js"></script>
<script src="designweb/loginjs.js"></script> -->
<script src="javascript/validate.js"></script>
<!-- Bootstrap CSS v5.2.0-beta1 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">


</head>

<body class="container">
	<header>
		<!-- place navbar here -->

	</header>
	<main>
		<!-- Form-->
		<%
	    Cookie[] cookies=request.getCookies();
	    String userName = "", password = "",rememberVal="";
	    if (cookies != null) {
	         for (Cookie cookie : cookies) {
	           if(cookie.getName().equals("cookuser")) {
	             userName = cookie.getValue();
	           }
	           if(cookie.getName().equals("cookpass")){
	             password = cookie.getValue();
	           }
	           if(cookie.getName().equals("cookrem")){
	             rememberVal = cookie.getValue();
	           }
	        }
	    }
	%>
		
		<div class="form">
			<div class="form-toggle"></div>
			<div class="form-panel one">
				<div class="form-header">
					<h1>Account Login</h1>
				</div>
				<div class="form-content">
				   
					<form onsubmit="return validate();"
						action="${pageContext.request.contextPath}/login" method="post">
						<div class="form-group">
							
							<label for="username">Email</label> <input type="text"
								id="username" name="username" value="<%=userName%>"/> <span id="error-name"></span>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								id="password" name="password" value="<%=password%>" /> <span id="error-pass"></span>
						</div>
						<div class="form-group">
							<label class="form-remember"> <input type="checkbox"
								name="remember" id="" value="1"
								  <%= "1".equals(rememberVal.trim()) ? "checked=\"checked\"" : "" %> />Remember Me
							</label><a class="form-recovery" href="#">Forgot Password?</a>
						</div>
						<div class="form-group">
							<button type="submit">Log In</button>
						</div>
						<div class="text-danger font-italic text-center font-weight-bold"
							id="error-text">
							<span style="color: red;"> 
							<%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""%>
							<%
 String error = (String) session.getAttribute("error");
 if (error != null) {
 	out.println(error);
 }
 %></span>
						</div>
					</form>
				</div>
			</div>
			<div class="form-panel two">
				<div class="form-header">
					<h1>Register Account</h1>
				</div>
				<div class="form-content">
					<form>
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								id="username" name="username" required="required" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								id="password" name="password" required="required" />
						</div>
						<div class="form-group">
							<label for="cpassword">Confirm Password</label> <input
								type="password" id="cpassword" name="cpassword"
								required="required" />
						</div>
						<div class="form-group">
							<label for="email">Email Address</label> <input type="email"
								id="email" name="email" required="required" />
						</div>
						<div class="form-group">
							<button type="submit">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="pen-footer">
			<a
				href="https://www.behance.net/gallery/30478397/Login-Form-UI-Library"
				target="_blank"><i class="material-icons">arrow_backward</i>View
				on Behance</a><a
				href="https://github.com/andyhqtran/UI-Library/tree/master/Login%20Form"
				target="_blank">View on Github<i class="material-icons">arrow_forward</i></a>
		</div>
	</main>
	<footer>
		<!-- place footer here -->
	</footer>
	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
		integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
		crossorigin="anonymous">
		
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"
		integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK"
		crossorigin="anonymous">
		
	</script>




</body>

</html>