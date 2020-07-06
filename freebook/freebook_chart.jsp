<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="freebook_error.jsp"
	import="java.util.*, jspbook.freebook.*, login.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>


<%
	if (session.getAttribute("id") == null) {

	response.sendRedirect("../login/login_form.html");

} else {

}
%>

<jsp:useBean id="fb" scope="page" class="jspbook.freebook.FreeBean"/>
 


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

<title>나눔 현황 차트</title>

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


<%
LoginBean ff = new LoginBean();
datas = ff.getMDBList();
%>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
    	  <%
    	  for (Membership mm : (ArrayList<Membership>) datas) {
    		  %>
    		  ['<%=mm.getM_id()%>', <%=mm.getM_count()%>],

    		  <%
    	  };
    		  %>
			
        ]);

        var options = {
          title: '이용자별 도서 등록 현황'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
   </script>
   
  
   
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['일반',     <%=fb.kindbook("일반")%>],
          ['소설',      <%=fb.kindbook("소설")%>],
          ['만화',  <%=fb.kindbook("만화")%>],
          ['참고서 & 대학교재', <%=fb.kindbook("참고서 & 대학교재")%>]
          
    
        ]);

        var options = {
          title: '등록 도서 종류 현황',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
   
   




</head>
<body>

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
		<!-- --nav end -->
		
		
		<div id="piechart" style="width: max; height: 500px; "></div>
		<div id="donutchart" style="width: max; height: 500px;"></div>































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