<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="myjs/myajax.js"></script>
<script src="js/jquery-1.4.2.min.js"></script>
<link href="default.css" rel="stylesheet" type="text/css" />
<title></title>
</head>
<script type="text/javascript">
function loginout(){
	if(confirm("Are you sure to login out?")){
		window.location.href="Login!loginOut.action";
		//send_request("Login!loginOut.action", "loginout");
	}
}
</script>
<body>
	<div id="logindiv">
	<c:if test="${sessionScope.user != null }">
		<span>Welcome back ${sessionScope.user }, </span> <a href="javascript:void(0);" onclick="loginout()">Login Out</a>
	</c:if>
	<c:if test="${sessionScope.user == null }">
		<a href="javascript:void(0);" onclick="loginin()">Login In</a>
	</c:if>
	</div>
	<div id="header">
		<div id="logo">
			<h1>
				<a href="#">08NetWork<sup></sup></a>
			</h1>
			<h2>Edited by 08NetWork</h2>
		</div>
		<div id="menu">
			<ul>
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="blog.jsp">Our Blog</a></li>
				<li><a href="photo.jsp">Photo Show</a></li>
				<li><a href="board.jsp">Fucking Board</a></li>
				<li><a href="introduction.jsp">Personal Introduction</a></li>
				<li><a href="contact.jsp">Contact Us</a></li>
			</ul>
		</div>
	</div>
</body>
</html>