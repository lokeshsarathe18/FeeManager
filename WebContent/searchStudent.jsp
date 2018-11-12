
<%
	if (session.getAttribute("name") != null
			&& ((String) session.getAttribute("type")).equalsIgnoreCase("accountant")) {
%>
<!DOCTYPE html>
<%@page import="techsolutions.student.StudentDAO"%>
<%@page import="techsolutions.student.StudentDTO"%>
<html lang="en">
<head>
<title>Search Student</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Login/link.html"></jsp:include>
<jsp:include page="Main/link.html"></jsp:include>
</head>
<body>
	<%
		String eno = request.getParameter("eno");
			StudentDTO dto = new StudentDAO().getStudentByEno(eno);
	%>
	<jsp:include page="headerAccountant.html"></jsp:include>
	<!-- End Header Area -->

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('Main/img/header-bg.png');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="updateStudent.jsp"
					method="post">

					<span class="login100-form-title p-b-34 p-t-27"> Search
						Student </span> <input type="hidden" name="sid" value="<%=dto.getSid()%>">

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
						data-validate="Enter enrollment no">
						<input class="input100" type="text" name="eno"
							value="<%=dto.getEno()%>" placeholder="Enter enrollment no">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter semester">
						<input class="input100" type="number" name="sem"
							value="<%=dto.getSem()%>" placeholder="Enter smester"> <span
							class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>


					<div>
						<input class="input100" type="radio" name="gender" value="m">Male
						<input class="input100" type="radio" name="gender" value="f">Female
					</div>

					<div class="wrap-input100 validate-input">
						<select name="course">
							<option value="BE">B.E.</option>
							<option value="BTech">B.Tech</option>
							<option value="MTech">M.Tech</option>
							<option value="BPham">B.Pharma</option>
							<option value="MBA">MBA</option>
							<option value="MCA">MCA</option>
						</select>
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
		response.sendRedirect("loginAccountant.jsp");
	}
%>