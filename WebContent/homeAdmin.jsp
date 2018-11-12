
<%
	if (session.getAttribute("name") != null
			&& ((String) session.getAttribute("type")).equalsIgnoreCase("admin")) {
%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<title>Home Admin</title>
<jsp:include page="Main/link.html"></jsp:include>
</head>

<body>

	<jsp:include page="headerAdmin.html"></jsp:include>
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
					<br> <br>

					<div class="input-wrap">
						<form action="" class="form-box d-flex justify-content-between">
							<input type="text" placeholder="Search Courses"
								class="form-control" name="username">
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
		response.sendRedirect("loginAdmin.jsp");
	}
%>