<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="myjs/myajax.js"></script>
<title>Insert title here</title>
</head>

<body>
		<%
			out.println("<script type='text/javascript'>");
			out
					.println(" alert('You are no login...'); ");
			out.println("get_request('login.jsp');");
			out.println("</script>");
		%>
</body>
</html>