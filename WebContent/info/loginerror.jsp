<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Something Wrong In LoginIn...</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="myjs/myajax.js"></script>
<script src="js/jquery-1.4.2.min.js"></script>
<link href="default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="post" id="Message">
				<h2 class="title">
					<b>Sorry Login Fail...</b>
				</h2>
				<p class="date">
					<font style="font-size: 12px;">Error</font>
				</p>
				<div class="entry">
					<p>
						please check username and password...
					</p>
				</div>
				<div class="meta">
					<p class="links" style="float: right;">
						<a href="javascript:void();" class="more" onclick="loginin()">Retry...</a>
					</p>
					<!-- <p class="down" onclick="adddowncount()">
						<a href="javascript:void(0);">Down: </a><a id="downcount">0</a>
					</p>
					<p class="up" onclick="addupcount()">
						<a href="javascript:void(0);">Up: </a><a id="upcount">0</a>
					</p> -->
				</div>
			</div>
</html>