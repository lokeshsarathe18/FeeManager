
<%
	if (session.getAttribute("name") != null
			&& ((String) session.getAttribute("type")).equalsIgnoreCase("accountant")) {
%>
<!DOCTYPE html>
<%@page import="techsolutions.student.StudentDAO"%>
<%@page import="techsolutions.student.StudentDTO"%>
<%@page import="java.util.ArrayList"%>
<html lang="zxx" class="no-js">

<head>
<title>View Students</title>
<jsp:include page="Main/link.html"></jsp:include>
<link type="text/css" rel="stylesheet" href="Table/style.css">
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
					<h1 class="wow fadeIn" data-wow-duration="4s">View Students</h1>
					<%
						String sid = request.getParameter("sid");
							if (sid != null) {
								new StudentDAO().deleteStudent(Integer.parseInt(sid));
								response.sendRedirect("viewAccountant.jsp");
							} else {
								ArrayList<StudentDTO> al = new StudentDAO().getAllStudents();
								if (al != null) {
					%>
					<table id="table">
						<tr>
							<th>Name</th>
							<th>Eno</th>
							<th>Mobile No</th>
							<th>Gender</th>
							<th>Course</th>
							<th>Fees</th>
							<th>Paid</th>
							<th>Due</th>
							<th>Address</th>
							<th>Options</th>
						</tr>
						<%
							for (StudentDTO dto : al) {
						%>
						<tr>
							<td><%=dto.getName()%></td>
							<td><%=dto.getEno()%></td>
							<td><%=dto.getMno()%></td>
							<td><%=dto.getGender()%></td>
							<td><%=dto.getCourse()%></td>
							<td><%=dto.getFee()%></td>
							<td><%=dto.getPaid()%></td>
							<td><%=dto.getDue()%></td>
							<td><%=dto.getAddress()%></td>
							<td><a href="updateStudent.jsp?sid=<%=dto.getSid()%>">Edit</a>
								<a href="viewStudent.jsp?sid=<%=dto.getSid()%>">Delete</a></td>
						</tr>
						<%
							}
									} else {
						%>
						<tr>
							<th><h1>No Data available to show</h1></th>
						</tr>
						<%
							}
								}
						%>
					</table>
					<br> <br /> <a href="addStudent.jsp">Add Student</a>

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
		response.sendRedirect("loginAccountant.jsp");
	}
%>