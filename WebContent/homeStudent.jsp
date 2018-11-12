
<%
	if (session.getAttribute("name") != null
			&& ((String) session.getAttribute("type")).equalsIgnoreCase("student")) {
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Student</title>
<jsp:include page="Main/link.html"></jsp:include>
</head>
<body>

	<jsp:include page="headerStudent.html"></jsp:include>
	<!-- End Header Area -->


	<!-- Start Banner Area -->
	<section class="home-banner-area relative">
		<div class="container">
			<div
				class="row fullscreen d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-8 col-md-12">
					<h1 class="wow fadeIn" data-wow-duration="4s">
						Welcome
						<%=session.getAttribute("name")%></h1>
					<br>
					<br>

					<div class="input-wrap">
						<form action="searchStudent.jsp"
							class="form-box d-flex justify-content-between" method="post">
							<input type="text" placeholder="Search Student by Eno"
								class="form-control" name="eno">
							<button type="submit" class="btn search-btn">Search</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="rocket-img">
			<img src="Main/img/rocket.png" alt="">
		</div>
	</section>
	<!-- End Banner Area -->


	<jsp:include page="footer.html"></jsp:include>
	<jsp:include page="Main/script.html"></jsp:include>

</body>
</html>
<%
	} else {
		response.sendRedirect("loginStudent.jsp");
	}
%>