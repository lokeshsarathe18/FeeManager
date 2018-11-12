<%@page import="techsolutions.accountant.AccountantDAO"%>
<%@page import="techsolutions.accountant.AccountantDTO"%>
<%
	if (request.getMethod().equalsIgnoreCase("post")) {
%>
<jsp:useBean id="dto" class="techsolutions.accountant.AccountantDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="dao" class="techsolutions.accountant.AccountantDAO"></jsp:useBean>
<%
	if (dao.updateAccountant(dto)) {
			response.sendRedirect("viewAccountant.jsp");
		} else {
			out.print("Failed to update Accountant");
		}
	} else {
		if (session.getAttribute("name") != null
				&& ((String) session.getAttribute("type")).equalsIgnoreCase("admin")) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Accountant</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Login/link.html"></jsp:include>
<jsp:include page="Main/link.html"></jsp:include>
</head>
<body>

	<jsp:include page="headerAdmin.html"></jsp:include>
	<!-- End Header Area -->

	<%
		int aid = Integer.parseInt(request.getParameter("aid"));
				AccountantDTO dto = new AccountantDAO().getAccountant(aid);
	%>
	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('Main/img/header-bg.png');">
			<div class="wrap-login100">
				<form class="login100-form validate-form"
					action="updateAccountant.jsp" method="post">

					<span class="login100-form-title p-b-34 p-t-27"> Update
						Accountant </span> <input type="hidden" name="aid"
						value="<%=dto.getAid()%>">

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="name"
							value="<%=dto.getName()%>" placeholder="Enter name"> <span
							class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<input class="input100" type="password" name="pwd"
							value="<%=dto.getPwd()%>" placeholder="Password"> <span
							class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="email" name="email"
							value="<%=dto.getEmail()%>" placeholder="Enter email"> <span
							class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="mno"
							value="<%=dto.getMno()%>" placeholder="Enter mobile no">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="textarea" name="address"
							value="<%=dto.getAddress()%>" placeholder="Enter address">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<br> <br>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Update Accountant</button>
					</div>

					<br> <br>

				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>

	<jsp:include page="Main/script.html"></jsp:include>

</body>
</html>
<%
	} else {
		response.sendRedirect("loginAdmin.jsp");
		}
	}
%>