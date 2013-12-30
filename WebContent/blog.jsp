<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function adddowncount(id){
		var tempdowncount = parseInt($(".downcount" + id).html());
		var downcount = tempdowncount + 1;
		if(downcount >= 10){
		$(".downlink" + id).css("color","yellow"); 
		$(".downcount" + id).css("color","yellow"); 
		}
		$(".downcount" + id).html(downcount)
		//之后进行存入数据库操作
		var data = "blog_id=" + id + "&downcount=" + downcount;
		send_requestAndNoReturn('Blog!downBlogCount.action', data);
	}
	function addupcount(id){
		var tempupcount = parseInt($(".upcount" + id).html());
		var upcount =  tempupcount + 1;
		if(upcount >= 10){
			$(".uplink" + id).css("color","red"); 
			$(".upcount" + id).css("color","red"); 
		}
		$(".upcount" + id).html(upcount);
		//之后进行存入数据库操作
		var data = "blog_id=" + id + "&upcount=" + upcount;
		send_requestAndNoReturn('Blog!upBlogCount.action', data);
	}
	function publishBlog(){
		var content = $(".weibo").val();
		//alert(content);
		if(content == ""){
			alert("please input something...");
			return;
		}
		var data = "blog_content="+content;
		send_request('Blog!publishBlog.action',data);
	}
	function showcomment(id){
		var flag = $(".blog_comments" + id).css("display");
		//alert(flag);
		if(flag == "none"){
			$(".blog_comments" + id).css("display","block");
		}
		if(flag == "block"){
			$(".blog_comments" + id).css("display","none");
		}
	}
	function replyblog(id){
		var comment = $(".reply"+id).val();
		//alert(comment);
		if(comment == ""){
			alert("Reply should not be nothing...");
			return;
		}
		var data = "comment_content="+comment+"&blog_id="+id;
		send_request('Comment!publishComment.action',data);
	}
	function loginin(){
		var url = "login.jsp";
		get_request(url);
	}
	function fastreply(id){
		var flag = $(".fastreply" + id).css("display");
		if(flag == "none"){
			$(".fastreply" + id).css("display","inline");
		}
		if(flag == "inline"){
			$(".fastreply" + id).css("display","none");
		}
	}
	function deletereplay(id){
		if(confirm("确认删除？")){
			var data = "id=" + id;
			send_request('Comment!deleteComment.action',data);
			return;
		};
	}

	function previouspage(pageid){
		var topage = parseInt(pageid) - 1;
		var data = "pageid=" + topage;
		//alert(data);
		send_request('Resource!splitResource.action',data);
	}
	function nextpage(pageid){
		var topage = parseInt(pageid) + 1;
		var data = "pageid=" + topage;
		//alert(data);
		send_request('Resource!splitResource.action',data);
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
				<h2 class="weibotitle">
					<b><img src="images/send_weibo.png"/></b>
				</h2>
				<!-- <p class="date">
				</p> -->
				<div class="topentry">
				<p>
					<textarea style="height: 75px; width: 560px;" class="weibo"></textarea>
				</p>
				</div>
				<div class="meta">
					<p class="submit" onclick="publishBlog()">
						<a class="up" href="javascript:void(0);">Submit</a>
					</p>
					<p class="links">
						<a href="#" class="more">Add Picture.</a>
						<a href="#" class="more">Add Flash.</a>
					</p>
				</div>
			</div>
		<c:forEach var="blog" begin="${startid }" end="${endid }" items="${newBlogs}">
			<div class="post" id="Message">
				<h2 class="title">
					<b>${blog.blog_user}</b> Says:
				</h2>
				<p class="date">
					${blog.blog_date}
				</p>
				<div class="entry">
					<p>
						${blog.blog_content }
					</p>
				</div>
				<div class="meta">
					<p class="links" onclick="showcomment(${blog.id})">
						<a href="javascript:void(0);" class="more">Reply...</a>
					</p>
					<p class="down" onclick="adddowncount(${blog.id})">
						<a class="downlink${blog.id}" href="javascript:void(0);">Down: </a><a class="downcount${blog.id}">${blog.blog_down_count }</a>
					</p>
					<p class="up" onclick="addupcount(${blog.id})">
						<a class="uplink${blog.id}" href="javascript:void(0);">Up: </a><a class="upcount${blog.id}">${blog.blog_up_count }</a>
					</p>
				</div>
				<div class="blog_comments${blog.id }" style="display: none;">
				<div class="comments">
				<!-- 遍历 -->
				<c:forEach var="tmpcomment" items="${comments}">
					<c:if test="${tmpcomment.blog_id == blog.id }">
						<!--  <span class="comment" onmouseup ="fastreply(${tmpcomment.id})" onmouseout="fastreply(${tmpcomment.id})"><font color="red">${tmpcomment.comment_user }</font> Says:  ${tmpcomment.comment_content }--> 
						<span class="comment"><font color="red">${tmpcomment.comment_user }</font> Says:  ${tmpcomment.comment_content }
						<c:if test="${sessionScope.user == tmpcomment.comment_user}">
						<span style="display: inline; color: yellow;" class="fastreply${ tmpcomment.id }" onclick="deletereplay(${tmpcomment.id});">delete</span>
						</c:if>
						<br>
						</span>
					</c:if>
				</c:forEach>
				</div>
				<textarea rows="1" cols="30" class="reply${blog.id }" style="border: 2px dashed green; width:565px;"></textarea>
				<p class="submitreply" onclick="replyblog(${blog.id})">
						<a href="javascript:void(0);" style="text-decoration: none;color: #FFFFFF;">Submit Reply</a>
				</p>
				</div>
			</div>
			</c:forEach>
		<p class="nextbutton" onclick="nextpage(${currentpage})">
						<a href="javascript:void(0);" style="text-decoration: none;color: #FFFFFF;">Next</a>
		</p>
		<p class="previousbutton" onclick="previouspage(${currentpage})">
						<a href="javascript:void(0);" style="text-decoration: none;color: #FFFFFF;">Previous</a>
		</p>
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
								onfocus="clearText()" /> <input type="submit" id="x"
								value="Search" style="border: 1px solid #0CF;" />
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