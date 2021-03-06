<%@page import="techsolutions.accountant.AccountantDAO"%>
<%
if(request.getMethod().equalsIgnoreCase("post")){
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	int aid = new AccountantDAO().checkAccountant(email, pwd);
	if(aid > 0){
		session.setAttribute("name", request.getParameter("email"));
		session.setAttribute("type", "accountant");
		response.sendRedirect("homeAccountant.jsp");
	}else{
		out.print("Enter valid email and password....");
	}
}else{
	%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Accountant Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="Login/link.html"></jsp:include>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('Login/images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="loginAccountant.jsp" method="post">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						Accountant Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="email" name="email" placeholder="Enter email">
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