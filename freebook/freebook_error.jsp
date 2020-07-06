<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div align="center">
		<h2>에러</h2>
		<table cellpadding=5 width=400>
			<tr width=100% bgcolor="pink">
				<td>시스템 처리중 에러가 발생했습니다. <br> 빠른시일내 복구하겠습니다.
					<hr> 에러 내용 : <%=exception%>
					<hr>

				</td>
		</table>


	</div>



</body>
</html>