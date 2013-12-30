<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
		<%
			out.println("<script type='text/javascript'>");
			out
					.println("alert(' 已经是最后一页!')");
			out
					.println("	window.location='blog.jsp'; ");
			out.println("</script>");
		%>
</html>