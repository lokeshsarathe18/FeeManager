
<%
	if (session.getAttribute("name") != null
			&& ((String) session.getAttribute("type")).equalsIgnoreCase("admin")) {
%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="techsolutions.accountant.AccountantDAO"%>
<%@page import="techsolutions.accountant.AccountantDTO"%>
<html lang="zxx" class="no-js">

<head>
<title>View Accountants</title>
<jsp:include page="Main/link.html"></jsp:include>
<link type="text/css" rel="stylesheet" href="Table/style.css">
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
					<h2 class="wow fadeIn" data-wow-duration="4s">View Accountants</h2>
					<%
						String aid = request.getParameter("aid");
							if (aid != null) {
								new AccountantDAO().deleteAccountant(Integer.parseInt(aid));
								response.sendRedirect("viewAccountant.jsp");
							} else {
								ArrayList<AccountantDTO> al = new AccountantDAO().getAllAccountant();
								if (al != null) {
					%>
					<table id="table">
						<tr>
							<th>Name</th>
							<th>Email</th>
							<th>Mobile No</th>
							<th>Address</th>
							<th>Options</th>
						</tr>
						<%
							for (AccountantDTO dto : al) {
						%>
						<tr>
							<td><%=dto.getName()%></td>
							<td><%=dto.getEmail()%></td>
							<td><%=dto.getMno()%></td>
							<td><%=dto.getAddress()%></td>
							<td><a href="updateAccountant.jsp?aid=<%=dto.getAid()%>">Edit</a>
								<a href="viewAccountant.jsp?aid=<%=dto.getAid()%>">Delete</a></td>
						</tr>
						<%
							}
									} else {
						%>
						<tr>
							<th>
								<h1>No Data available to show</h1>
							</th>
						</tr>
						<%
							}
								}
						%>
					</table>
					<br> <br /> <a href="addAccountant.jsp">Add Accountant</a>

				</div>
			</div>
		</div>
		<div class="rocket-img">
			<img src="Main/img/rocket.png" alt="">
		</div>
	</section>
	<!-- End Banner Area -->

	<jsp:include page="Main/script.html"></jsp:include>

</body>
</html>
<%
	} else {
		response.sendRedirect("loginAdmin.jsp");
	}
%>