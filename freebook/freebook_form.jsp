<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="freebook_error.jsp"%>

<%
if(session.getAttribute("id")==null){
	
	response.sendRedirect("../login/login_form.html");

}else{
	
}

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
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



<title>책 등록</title>



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

<div class="card align-middle" style="width:40rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">도서 등록</h2>
		</div>
		<div class="card-body">
      	<form name=form1 method=post action=freebook_control.jsp>
		<input type=hidden name="action" value="insert">
        <h5 class="form-signin-heading">도서 정보를 등록하세요</h5>
        <label for="inputbook" class="sr-only">도서명</label>
        <input type="text" id="inputbook" name="fb_bookname" class="form-control" placeholder="도서명(필수)" required autofocus><BR>
        <label for="inputwriter" class="sr-only">저자</label>
        <input type="text" id="inputwriter" name="fb_writer" class="form-control" placeholder="저자" required><br>
        <label for="inputpublisher" class="sr-only">출판사</label>
        <input type="text" id="inputpublisher" name="fb_publisher" class="form-control" placeholder="출판사" required autofocus><BR>
        <label for="kindbook" class="sr-only">asd</label>
        <select name="fb_kindbook" id="kindbook" class="form-control">
        <option value="일반" selected>책 종류 선택</option>
 		<option value="일반">일반</option>
 		<option value="소설">소설</option>
 		<option value="만화">만화</option>
 		<option value="참고서 & 대학교재">참고서 & 대학교재</option>        
        </select><br>
        <label for="inputurl" class="sr-only">이미지 URL</label>
        <input type="text" id="inputurl" name="fb_imageurl" class="form-control" placeholder="이미지 주소를 복사해 넣어주세요" required autofocus><BR>
        <label for="inputmemo" class="sr-only">메모</label>
        <input type="text" style="width: max; height:200px;" id="inputmemo" name="fb_memo" class="form-control" placeholder="메모를 입력하세요" required autofocus><BR>
        <input type="hidden" name="fb_userid" value="<%=session.getAttribute("id")%>">
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">등록</button>
       <div align ="center">[<a href="freebook_list.jsp">취소</a>] </div>
       
      </form>
      
		</div>
	</div>
	<div class="modal">
	</div>



</body>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</html>