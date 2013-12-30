<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-1.4.2.min.js"></script>
<title>Login In Success...</title>
</head>
<body>
		<%
			out.print("登录成功，即将为您跳转！");
			out.println("<script type='text/javascript'>");
			out
					.println("	window.location='index.jsp'; ");
			out.println("</script>");
		%>
</body>
</html>