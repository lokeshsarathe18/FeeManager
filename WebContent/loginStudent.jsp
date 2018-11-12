<%@page import="techsolutions.util.Password"%>
<%@page import="techsolutions.student.StudentDAO"%>
<%
if(request.getMethod().equalsIgnoreCase("post")){
	String eno = request.getParameter("eno");
	String pwd = Password.encrypt(request.getParameter("pwd"));
	String name = new StudentDAO().checkStudent(eno, pwd);
	if(name!=null){
		session.setAttribute("name", name);
		session.setAttribute("type", "student");
		response.sendRedirect("homeStudent.jsp");
	}else{
		out.print("Enter valid email and password....");
	}
}else{
	%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Student Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="Login/link.html"></jsp:include>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('Login/images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="loginStudent.jsp" method="post">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Student Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="eno" placeholder="Enter enrollment no">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="pwd" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<br><br>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

					<br><br><br><br>
					
				</form>
			</div>
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
	<jsp:include page="Login/script.html"></jsp:include>
</body>
</html>
	<%
}
%>