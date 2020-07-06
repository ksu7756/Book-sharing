<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="freebook_error.jsp" import="jspbook.freebook.*"%>
<jsp:useBean id="fb" scope = "request" class="jspbook.freebook.FreeBook"/>
<jsp:useBean id="ff" scope = "request" class="jspbook.freebook.FreeBean"/>




<%
if(session.getAttribute("id")==null){
	
	response.sendRedirect("../login/login_form.html");

}else{
	
}

%>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function delcheck(){
		result = confirm("정말로 삭제하시겠습니까?");
		
		if(result){
			<%
			
			%>
			
		}else
			return;
		
	}
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
<script type="text/javascript" src="../js/bootstrap.min.js"></script> 
<link type="text/css" rel="stylesheet" href="../css/login.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

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
		document.location.href = "freebook_control.jsp?action=edit&fb_id="
				+ fb_id;
	}
</script>
<script type="text/javascript">
	function delcheck(fb_id){
		result = confirm("정말로 삭제하시겠습니까?");
		
		if(result){
			document.location.href = "freebook_control.jsp?action=delete&fb_id="
				+ fb_id;
			
		}else
			return;
		
	}
	
	
</script>


<title>도서정보</title>



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


	<div class="container">
		<div class="row">
		
			<table class="table table-striped"
			
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">도서정보
						</th>
					</tr>
				</thead>	
				<tbody style="background-color:white">
				
							
					<tr>
						<td rowspan="9" bgcolor="white" style="width: 600px; height: 90px; overflow: hidden"><a href="https://search.kyobobook.co.kr/web/search?vPstrKeyWord=<%=fb.getFb_bookname()%>"><img src="<%=fb.getFb_imageurl()%>" style="width: 400px; height: auto;" ></a></td>
						<td width="100" height="30" >도서명</td>
						<td colspan="2"><%=fb.getFb_bookname()%></td>
					</tr>
					<tr height = "30">
						<td>저자</td>
						<td colspan="2"><%=fb.getFb_writer()%></td>
					</tr>
					<tr height = "30">
						<td>출판사</td>
						<td colspan="2"><%=fb.getFb_publisher()%></td>
					</tr>
					<tr height = "30">
						<td>책 종류</td>
						<td colspan="2"><%=fb.getFb_kindbook()%></td>
					</tr>
					<tr height = "30">
						<td>등록일</td>
						<td colspan="2"><%=fb.getFb_publicationdate()%></td>
					</tr>
					<tr height = "30">
						<td>등록자</td>
						<td colspan="2"><%=fb.getFb_userid()%></td>
					</tr>		
					<tr height = "30">
						<td>이메일</td>
						<td colspan="2"><%=ff.getUserInfo(fb.getFb_userid()).getM_email()%></td>
					</tr>
					<tr height = "30">
						<td>전화번호</td>
						<td colspan="2"><%=ff.getUserInfo(fb.getFb_userid()).getM_tel()%></td>
					</tr>		
					<tr>
						<td>메모</td>
						<td colspan="2" style="height: 1000; text-align: left;"><%=fb.getFb_memo()%></td>
					</tr>
				
				</tbody>
			</table>
			
			<a href="freebook_list.jsp" class="btn btn-primary">목록</a>
			<%
			if (session.getAttribute("id").equals(fb.getFb_userid())) {
			%>
			<a href="javascript:check( <%=fb.getFb_id()%> )" class="btn btn-primary">수정</a>
			 
			 
			<a href="javascript:delcheck( <%=fb.getFb_id()%> )" class="btn btn-primary">삭제</a>
			 
			<%
			}
			%>
			

		</div>

	</div>










</body>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


</html>