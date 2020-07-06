<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="freebook_error.jsp"
	import="java.util.*, jspbook.freebook.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	if (session.getAttribute("id") == null) {

	response.sendRedirect("../login/login_form.html");

} else {

}
%>

<!DOCTYPE html>
<html lang="utf-8">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<script type="text/javascript">
	function outcheck() {
		result = confirm("정말로 로그아웃 하시겠습니까?");
		if (result) {
			alert("로그아웃 되었습니다.");
			location.href = "../login/logout.jsp";
		} else {
			return;
		}
	}
</script>

<script type="text/javascript">
	function check(fb_id) {
		document.location.href = "freebook_control.jsp?action=view&fb_id="
				+ fb_id;
	}
</script>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>도서나눔게시판</title>

<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../css/login.css" />

<style>
.booktitle{
	font-weight: bold;
	font-size: 18pt;
	color:#000080;
}

.booktext{
	font-weight: bold;

}

</style>




</head>

<body id="page-top">



	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="freebook_main.jsp">도서 나눔 사이트</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="freebook_main.jsp">Home <span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item"><a class="nav-link"
						href="freebook_list.jsp">도서 게시판</a></li>
						
          		  <li class="nav-item">
          			  <a class="nav-link" href="freebook_chart.jsp">나눔 현황판</a>
          			</li>

					<%
						if (session.getAttribute("id") == null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="../login/login_form.html">로그인</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="outcheck()">로그아웃</a></li>

					<%
						}
					;
					%>



				</ul>
			</div>
		</div>
	</nav>



	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" style="margin-top:15pt">도서 나눔 게시판</h1>
					<p class="mb-4"><%=session.getAttribute("id")%>님 환영합니다! 나눔 혹은 교환할 책을 등록해주세요.</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">

								<a href="freebook_form.jsp" class="btn btn-primary btn-lg">도서
									등록하기</a>

							</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th width="60pt">번 호</th>
											<th width="150pt">이미지</th>
											<th width="200pt">도서정보</th>
											<th width="70pt">등록자</th>
											<th>메모</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>번 호</th>
											<th>이미지</th>
											<th>도서정보</th>
											<th>등록자</th>
											<th>메모</th>
										</tr>
									</tfoot>
									<tbody>

										<%
											FreeBean ff = new FreeBean();
										datas = ff.getDBList();
										for (FreeBook fb : (ArrayList<FreeBook>) datas) {
										%>
										<tr>
											<%
												if (session.getAttribute("id").equals(fb.getFb_userid())) {
											%>
											<td><p class=booktitle><a href="javascript:check( <%=fb.getFb_id()%> )" style="color:#FF4500"><%=fb.getFb_id()%></a></p></td>
											<%
												} else {
											%>
											<td><p class=booktitle><a href="javascript:check( <%=fb.getFb_id()%> )"><%=fb.getFb_id()%></a></p></td>
											<%
												}
										
											%>

											<td><img src="<%=fb.getFb_imageurl()%>"
												style="width: 150pt; height: 150pt;"></td>
												
											<%
												if (session.getAttribute("id").equals(fb.getFb_userid())) {
											%>
											<td><p class=booktitle><a href="javascript:check( <%=fb.getFb_id()%> )" style="color:#FF4500"><%=fb.getFb_bookname()%></a></p>
											<%
												} else {
											%>
											<td><p class=booktitle><a href="javascript:check( <%=fb.getFb_id()%> )"><%=fb.getFb_bookname()%></a></p>
											
											<%
												}
											%>
											
											<p class=booktext>
											<br><%=fb.getFb_writer()%>
											<br><%=fb.getFb_publisher()%>
											<br>등록일: <%=fb.getFb_publicationdate()%>
											</p>
											</td>
											
											<td><p class=booktext><%=fb.getFb_userid()%></p></td>
											<td><%=fb.getFb_memo()%></td>
										</tr>
										<%
											}
										;
										%>




									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->

			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->


	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>



	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../js/demo/datatables-demo.js"></script>

</body>

</html>
