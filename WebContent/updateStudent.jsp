<%@page import="techsolutions.student.StudentDAO"%>
<%@page import="techsolutions.student.StudentDTO"%>
<%
	if (request.getMethod().equalsIgnoreCase("post")) {
		StudentDAO dao = new StudentDAO();
		StudentDTO dto = new StudentDTO();
		dto.setAddress(request.getParameter("address"));
		dto.setCourse(request.getParameter("course"));
		dto.setEno(request.getParameter("eno"));
		dto.setGender(request.getParameter("gender"));
		dto.setMno(request.getParameter("mno"));
		dto.setName(request.getParameter("name"));
		dto.setPwd(request.getParameter("pwd"));
		dto.setSem(Integer.parseInt(request.getParameter("sem")));
		dto.setSid(Integer.parseInt(request.getParameter("sid")));
		if (dao.updateStudent(dto)) {
			response.sendRedirect("viewStudent.jsp");
		} else {
			out.print("failed to update new Student");
		}
	} else {
		if (session.getAttribute("name") != null
				&& ((String) session.getAttribute("type")).equalsIgnoreCase("accountant")) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Student</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Login/link.html"></jsp:include>
<jsp:include page="Main/link.html"></jsp:include>
</head>
<body>
	<%
		int sid = Integer.parseInt(request.getParameter("sid"));
				StudentDTO dto = new StudentDAO().getStudent(sid);
	%>
	<jsp:include page="headerAccountant.html"></jsp:include>
	<!-- End Header Area -->

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('Main/img/header-bg.png');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="updateStudent.jsp"
					method="post">

					<span class="login100-form-title p-b-34 p-t-27"> Update
						Student </span>
					<input type="hidden" name="sid" value="<%=dto.getSid()%>">

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
						<input class="input100" type="text" name="address"
							value="<%=dto.getAddress()%>" placeholder="Enter address">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<br> <br>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Update Student</button>
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
	}
%>