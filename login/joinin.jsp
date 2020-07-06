<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>



<jsp:useBean id="loginbean" scope="page" class="login.LoginBean" />
<jsp:useBean id="membership" scope="page" class="login.Membership" />
<jsp:setProperty property="*" name="membership" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
<script type="text/javascript" src="../js/bootstrap.min.js"></script> 
<link type="text/css" rel="stylesheet" href="../css/login.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title>회원가입 결과</title>
</head>
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="../freebook/freebook_main.jsp">도서 나눔 사이트</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="../freebook/freebook_main.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="joinin_form.html">회원가입</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login_form.html">로그인</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>




	<div class="card align-middle" style="width:35rem; border-radius:20px;">
	
		<%if(loginbean.insertDB(membership)){
			
			
		
		%>
		<div class="card-title" style="margin-top:30px;">
		<h2 class="card-title text-center" style="color:#113366;">회원가입이 완료되었습니다.</h2>
		</div>
		
		<div class="card-body" align="center"> 
        <h5 class="form-signin-heading"><%=membership.getM_id()%>님 환영합니다! 로그인 후 이용해주세요.</h5>
		<br>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" onclick="location.href='login_form.html'"type="submit">로그인 창으로</button>
       
 
		</div>
		
		<%}
		else{%>
			
		<div class="card-title" style="margin-top:30px;">
		<h2 class="card-title text-center" style="color:#113366;">가입 실패</h2>
		</div>
		
		<div class="card-body" align="center"> 
        <h5 class="form-signin-heading">필수 입력란 미입력 및 아이디 중복으로 인해 가입이 실패하였습니다.</h5>
		<br>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" onclick="location.href='login_form.html'"type="submit">로그인 창으로</button>

		</div>
			
		<%
		}
		%>
		
		
	</div>

</body>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


</html>