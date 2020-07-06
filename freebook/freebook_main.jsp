<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="freebook_error.jsp" import="java.util.*, jspbook.freebook.*"%>

<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
<script type="text/javascript" src="../js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link type="text/css" rel="stylesheet" href="../css/login.css" />

<script type="text/javascript">
	function outcheck(){
		result = confirm("정말로 로그아웃 하시겠습니까?");
		if(result){	
			alert("로그아웃 되었습니다.");
			location.href="../login/logout.jsp";
		}else{
			
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


<title>도서 나눔 사이트</title>
</head>
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="freebook_main.jsp">도서 나눔 사이트</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="freebook_main.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="freebook_list.jsp">도서 게시판</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="freebook_chart.jsp">나눔 현황판</a>
          </li>
         
          
          	<%
          		if(session.getAttribute("id") == null){
          	%>
          <li class="nav-item">
            <a class="nav-link" href="../login/joinin_form.html">회원가입</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="../login/login_form.html">로그인</a>
          </li>
          	<% 
          		}else {	
          	%>		
           <li class="nav-item">
            <a class="nav-link"  href="#" onclick="outcheck()">로그아웃</a>
          </li>
          			
          	<%
          		};
          	%>
          			
          			
          	
        </ul>
      </div>
    </div>
  </nav>

	<%
	
		//상위 DB 1.2.3.4번 책 정보 가져오기
		FreeBean ff = new FreeBean(); 
		FreeBook fb1 = ff.getDBRow(1);  
		FreeBook fb2 = ff.getDBRow(2);
		FreeBook fb3 = ff.getDBRow(3);
		FreeBook fb4 = ff.getDBRow(4);
		
	%>

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4" style="background-image:url('https://cdn2.vectorstock.com/i/1000x1000/41/16/open-book-isolated-on-white-background-vector-2824116.jpg');" >
      <h1 class="display-3">책을 버리지마세요!</h1>
      
      <%if(session.getAttribute("id")== null){ %>
      
      <p class="lead">가입 후 이용하실 수 있습니다.</p>
      
      <%
      }else{
      %>
      <p class="lead"><%=session.getAttribute("id")%>님 환영합니다!</p>
      <%
      };
      %>
      
      <a href="freebook_list.jsp" class="btn btn-primary btn-lg">도서 나눔 게시판으로!</a>
    </header>

    <!-- Page Features -->
    <div class="row text-center">

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="<%=fb1.getFb_imageurl()%>" alt="no image">
          <div class="card-body">
            <h4 class="card-title"><%=fb1.getFb_bookname()%></h4>
            <p class="card-text"><%=fb1.getFb_memo()%></p>
          </div>
          <div class="card-footer">
            <a href="javascript:check(<%=fb1.getFb_id()%>)" class="btn btn-primary">도서 정보</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="<%=fb2.getFb_imageurl()%>" alt="no image">
          <div class="card-body">
            <h4 class="card-title"><%=fb2.getFb_bookname()%></h4>
            <p class="card-text"><%=fb2.getFb_memo()%></p>
          </div>
          <div class="card-footer">
            <a href="javascript:check(<%=fb2.getFb_id()%>)" class="btn btn-primary">도서 정보</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="<%=fb3.getFb_imageurl()%>" alt="no image">
          <div class="card-body">
            <h4 class="card-title"><%=fb3.getFb_bookname()%></h4>
            <p class="card-text"><%=fb3.getFb_memo()%></p>
          </div>
          <div class="card-footer">
            <a href="javascript:check(<%=fb3.getFb_id()%>)" class="btn btn-primary">도서 정보</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="<%=fb4.getFb_imageurl()%>" alt="no image">
          <div class="card-body">
            <h4 class="card-title"><%=fb4.getFb_bookname()%></h4>
            <p class="card-text"><%=fb4.getFb_memo()%></p>
          </div>
          <div class="card-footer">
            <a href="javascript:check(<%=fb4.getFb_id()%>)" class="btn btn-primary">도서 정보</a>
          </div>
        </div>
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 2020 KSU ALL RIGHTS RESERVED.</p>
    </div>
    <!-- /.container -->
  </footer>

</body>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>



</html>