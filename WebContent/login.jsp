<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="myjs/myajax.js"></script>
<script src="js/jquery-1.4.2.min.js"></script>
<link href="default.css" rel="stylesheet" type="text/css" />
<title>Login In</title>
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
	function myloginin(form){
		var username = $.trim($("#usernametext").val());
		var password = $.trim($("#passwordtext").val());
		var codetext = $.trim($("#codetext").val());
		var autologin = $("#autologin").is(':checked');
		//alert(autologin);
		if(username.length == 0){
			$("#usernameMessage").html("username should not be empty!");
			return false;
		}else{
			$("#usernameMessage").html("");
		}
		if(password.length == 0){
			$("#passwordMessage").html("password should not be empty!");
			return false;
		}else{
			$("#passwordMessage").html("");
		}
		if(codetext.length == 0){
			alert("Verification Code should not be empty!");
			return false;
		}
		if(username.length != 0 && password.length != 0){
			//$("#loginInForm").submit();
			alert("<%=session.getAttribute("mycode")%>");
			if(codetext == "<%=session.getAttribute("mycode")%>"){
				var mydata = "usernametext="+username+"&passwordtext="+password+"&autologin="+autologin;
				send_request("Login!loginIn.action",mydata);
			}else{
				alert("Verification Code is invalid");
				return false;
			}
		}
	}
	function reloadcode(){
		$("#codeMessage").attr("src","test.jsp");
		//alert("1");
	}
	function resettext(){
		$("#usernametext").val("");
		$("#passwordtext").val("");
	}
</script>
<body>
	<div class="post">
		<h1 class="title">Login In</h1>
		<form action="Login!loginIn.action" name="loginInForm" method="post"
			id="loginInForm">
			<table>
				<tr>
					<td>用户名：</td>
					<td colspan="2"><input type="text" id="usernametext" value=""
						name="usernametext" /><span class="logininfo" id="usernameMessage"></span></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td colspan="2"><input type="password" id="passwordtext"
						name="passwordtext" /><span class="logininfo" id="passwordMessage"></span></td>
				</tr>
				<tr>
					<td>验证码：</td>
					<td><input type="text" id="codetext"
						name="codetext" /><span class="logininfo"></span></td>
					<td colspan="1"><span><img id="codeMessage" onclick="reloadcode()" src="test.jsp"/></span></td>
				</tr>
				<tr>
					<td colspan="3" style="font-weight: normal;color: #0094E0;">
						<input type="checkbox" name="autologin" id="autologin" value="autologin"/>    Remember ME
					</td>
				</tr>
			</table>
		</form>
		<div class="meta">
			<p class="links" style="float: right;">
				<a href="javascript:void(0);" class="more"
					onclick="myloginin(loginInForm)">Login In</a>
			</p>
			<p class="links" style="float: right;">
				<a href="javascript:void(0);" class="more"
					onclick="resettext(loginInForm)">Reset</a>
			</p>
		</div>
	</div>
</body>
</html>