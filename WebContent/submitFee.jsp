<%@page import="techsolutions.student.StudentDAO"%>
<%@page import="techsolutions.student.StudentDTO"%>
<%
	if (request.getMethod().equalsIgnoreCase("post")) {
		StudentDAO dao = new StudentDAO();
		StudentDTO dto = new StudentDTO();
		dto.setSid(Integer.parseInt(request.getParameter("sid")));
		dto.setFee(Float.parseFloat(request.getParameter("fee")));
		dto.setPaid(Float.parseFloat(request.getParameter("paid")));
		dto.setDue(Float.parseFloat(request.getParameter("due")));
		if (dao.payFee(dto)) {
			response.sendRedirect("viewDues.jsp");
		} else {
			out.print("failed to pay fee for the Student " + dto.getSid());
		}
	} else {
		if (session.getAttribute("name") != null
				&& ((String) session.getAttribute("type")).equalsIgnoreCase("accountant")) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Submit Fee</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Login/link.html"></jsp:include>
<jsp:include page="Main/link.html"></jsp:include>
</head>
<body>

	<jsp:include page="headerAccountant.html"></jsp:include>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="home-banner-area relative">
		<div class="container">
			<div
				class="row fullscreen d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-8 col-md-12">
					<div class="input-wrap">
						<form action="submitFee.jsp"
							class="form-box d-flex justify-content-between" method="get">
							<input type="text" placeholder="Enter enrollment number"
								class="form-control" name="eno">
							<button type="submit" class="btn search-btn">Search</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<%
		String eno = request.getParameter("eno");
				StudentDTO dto = new StudentDAO().getStudentByEno(eno);
				if (dto != null) {
	%>
	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('Main/img/header-bg.png');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="submitFee.jsp"
					method="post">

					<span class="login100-form-title p-b-34 p-t-27"> Submit fee
					</span> <input type="hidden" name="sid" value="<%=dto.getSid()%>">

					<div class="wrap-input100 validate-input"
						data-validate="Enter enrollment no">
						<input class="input100" type="text" name="eno"
							value="<%=dto.getEno()%>" placeholder="Enter enrollment no">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="name"
							value="<%=dto.getName()%>" placeholder="Enter name"> <span
							class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter semester">
						<input class="input100" type="number" name="sem"
							value="<%=dto.getSem()%>" placeholder="Enter smester"> <span
							class="focus-input100" data-placeholder="&#xf207;"></span>
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

					<div>
					<label style="color: white;">Total fee :</label>
						<input class="input100" type="number" name="fee"
							value="<%=dto.getFee()%>" placeholder="Enter fee"> <span
							class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div>
					<label style="color: white;">fee Paid :</label>
						<input class="input100" type="number" name="paid"
							value="<%=dto.getPaid()%>" placeholder="Enter fee paid">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div>
					<label style="color: white;">fee Due :</label>
						<input class="input100" type="number" name="due"
							value="<%=dto.getDue()%>" placeholder="Enter fee due"> <span
							class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>
					<br> <br>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Submit fee</button>
					</div>

					<br> <br>
				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
	<%
		}
	%>

	<jsp:include page="Main/script.html"></jsp:include>

</body>
</html>
<%
	} else {
			response.sendRedirect("loginAccountant.jsp");
		}
	}
%>
