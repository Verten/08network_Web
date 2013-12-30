<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Great Love For 08NetWork</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="myjs/myajax.js"></script>
<script src="js/jquery-1.4.2.min.js"></script>
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript">
	function clearText(){
		document.getElementById("s").value="";
	}
	function adddowncount(){
		var tempdowncount = parseInt($("#downcount").html());
		var downcount = tempdowncount + 1;
		$("#downcount").html(downcount)
		//之后进行存入数据库操作
	}
	function addupcount(){
		var tempupcount = parseInt($("#upcount").html());
		var upcount =  tempupcount + 1;
		$("#upcount").html(upcount);
		//之后进行存入数据库操作
	}
	function loginin(){
		var url = "login.jsp";
		get_request(url);
	}
</script>
<body>
	<!-- start header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- end header -->

	<!-- start page -->
	<div id="page">
		<!-- start content -->
		<div id="content">
			<div class="post" id="Message">
				<h2 class="title">
					<b>Photo </b>Wall
				</h2>
				<p class="date">
					月份<b>日期</b>
				</p>
				<div class="entry">
					<p>
						This is Excess, a free, fully standards-compliant CSS template
						designed byFreeCssTemplates<a
							href="http://www.nodethirtythree.com/"></a> for <a
							href="http://www.freecsstemplates.org/">Free CSS Templates</a>.
						This free template is released under a <a
							href="http://creativecommons.org/licenses/by/2.5/">Creative
							Commons Attributions 2.5</a> 博文内容 :)
					</p>
					<p>Donec a ante. Donec neque purus, adipiscing id, eleifend a,
						cursus vel, odio. Vivamus varius justo sit amet leo. Morbi sed
						libero. Vestibulum blandit augue at mi. Praesent fermentum lectus
						eget diam. Nam cursus, orci sit amet porttitor iaculis, ipsum
						massa aliquet nulla, non elementum mi elit a mauris.</p>
				</div>
				<div class="meta">
					<p class="links">
						<a href="#" class="more">Read full article</a>
					</p>
					<p class="down" onclick="adddowncount()">
						<a href="javascript:void(0);">Down: </a><a id="downcount">0</a>
					</p>
					<p class="up" onclick="addupcount()">
						<a href="javascript:void(0);">Up: </a><a id="upcount">0</a>
					</p>
				</div>
			</div>
			<div class="post">
				<h2 class="title">
					<b>Lorem Ipsum</b> Dolor Volutpat
				</h2>
				<p class="date">
					Feb<b>09</b>
				</p>
				<div class="entry">
					<p class="links">
						<a href="#" class="more">Read full article</a>
					</p>
				</div>
				<div class="meta">
					<p class="links">
						<a href="#" class="more">Read full article</a>
					</p>
				</div>
			</div>
			<div class="post">
				<h2 class="title">
					<b>Lorem Ipsum</b> Dolor Volutpat
				</h2>
				<p class="date">
					Feb<b>05</b>
				</p>
				<div class="entry">
					<p>Curabitur tellus. Phasellus tellus turpis, iaculis in,
						faucibus lobortis, posuere in, lorem. Donec a ante. Donec neque
						purus, adipiscing id, eleifend a, cursus vel, odio. Vivamus varius
						justo sit amet leo. Morbi sed libero. Vestibulum blandit augue at
						mi. Praesent fermentum lectus eget diam. Nam cursus, orci sit amet
						porttitor iaculis, ipsum massa aliquet nulla, non elementum mi
						elit a mauris. In hac habitasse platea. Nam cursus, orci sit amet
						porttitor iaculis, ipsum massa aliquet nulla, non mi elit a
						mauris.</p>
				</div>
				<div class="meta">
					<p class="links">
						<a href="#" class="more">Read full article</a>
					</p>
				</div>
			</div>
		</div>
		<!-- end content -->
		<!-- start sidebar -->
		<div id="sidebar">
			<ul>
				<li id="search">
					<h2>
						<b class="text1">Search</b>
					</h2>
					<form method="get" action="" style="border: 1px solid #0CF;">
						<fieldset>
							<input type="text" id="s" name="s" value="请输入需要查找的内容"
								onfocus="clearText()" style="margin-top: 0px;" /> <input
								type="submit" id="x" value="Search"
								style="border: 1px solid #0CF;" />
						</fieldset>
					</form>
				</li>
				<li>
					<h2>
						<strong>The </strong>Announcement
					</h2>
					<ul>
						<li><a href="#">Fusce dui neque fringilla</a></li>
						<li><a href="#">Eget tempor eget nonummy</a></li>
						<li><a href="#">Magna lacus bibendum mauris</a></li>
						<li><a href="#">Nec metus sed donec</a></li>
						<li><a href="#">Magna lacus bibendum mauris</a></li>
						<li><a href="#">Velit semper nisi molestie</a></li>
						<li><a href="#">Eget tempor eget nonummy</a></li>
					</ul>
				</li>
				<li>
					<h2>
						<b>What a</b> Fucking<b> Day</b>
					</h2>
					<ul>
						<li><a href="#">Nec metus sed donec</a></li>
						<li><a href="#">Magna lacus bibendum mauris</a></li>
						<li><a href="#">Velit semper nisi molestie</a></li>
						<li><a href="#">Eget tempor eget nonummy</a></li>
						<li><a href="#">Nec metus sed donec</a></li>
						<li><a href="#">Magna lacus bibendum mauris</a></li>
						<li><a href="#">Velit semper nisi molestie</a></li>
					</ul>
				</li>
				<li>
					<h2>
						<b>Friendship </b> Connection
					</h2>
					<ul>
						<li><a href="#">Nec metus sed donec</a></li>
						<li><a href="#">Magna lacus bibendum mauris</a></li>
						<li><a href="#">Velit semper nisi molestie</a></li>
						<li><a href="#">Eget tempor eget nonummy</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- end sidebar -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
	<!-- start footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- end footer -->
</body>
</html>