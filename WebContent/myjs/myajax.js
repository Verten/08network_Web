//以下是Ajax
//var http_request = false;
function send_request(url,mydata) {//初始化、指定处理函数、发送请求的函数
 //alert("22222");
	http_request = false;
//开始初始化XMLHttpRequest 对象
	if(window.XMLHttpRequest) { //Mozilla 浏览器
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {//设置MiME 类别
		//alert("3333");
			http_request.overrideMimeType("text/xml");
		//alert("44444444");
		}
	}
	else if (window.ActiveXObject) { // IE 浏览器
		try{
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try{
				http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {}
		}
	}
	if (!http_request) { // 异常，创建对象实例失败
		window.alert("不能创建XMLHttpRequest 对象实例.");
		return false;
	}
	http_request.onreadystatechange = processRequest;
	// 确定发送请求的方式和URL 以及是否同步执行下段代码
	http_request.open("POST", url, true);
	//alert("AJAX已经发送Open POST请求");
	http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	http_request.send(mydata);
}
function get_request(url) {//初始化、指定处理函数、发送请求的函数
	 //alert("22222");
		http_request = false;
	//开始初始化XMLHttpRequest 对象
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {//设置MiME 类别
			//alert("3333");
				http_request.overrideMimeType("text/xml");
		//alert("44444444");
			}
		}
		else if (window.ActiveXObject) { // IE 浏览器
			try{
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try{
						http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request) { // 异常，创建对象实例失败
			window.alert("不能创建XMLHttpRequest 对象实例.");
			return false;
		}
		http_request.onreadystatechange = processRequest;
		// 确定发送请求的方式和URL 以及是否同步执行下段代码
		http_request.open("GET", url, true);
		//alert("AJAX已经发送Open Get请求");
			//http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		http_request.send(null);
}
function send_requestAndNoReturn(url,mydata) {//初始化、指定处理函数、发送请求的函数
		http_request = false;
	//开始初始化XMLHttpRequest 对象
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {//设置MiME 类别
				http_request.overrideMimeType("text/xml");
			}
		}
		else if (window.ActiveXObject) { // IE 浏览器
			try{
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try{
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request) { // 异常，创建对象实例失败
			window.alert("不能创建XMLHttpRequest 对象实例.");
			return false;
		}
		http_request.onreadystatechange = processRequest1;
		// 确定发送请求的方式和URL 以及是否同步执行下段代码
		http_request.open("POST", url, true);
		http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		http_request.send(mydata);
	}
// 处理返回信息的函数
function processRequest() {
	if(http_request.readyState == 3){//互交中
		$("#Message").html("<font color=red>正在为您提交信息</font>");
		$("#passwordMessage").html("<font color=red>正在为您提交信息</font>");
	}
	if (http_request.readyState == 4) { // 已完成
		$("#Message").html("");
		$("#passwordMessage").html("");
		if (http_request.status == 200) { // 信息已经成功返回，开始处理信息
			//alert(http_request.responseText);
			$("#Message").html(http_request.responseText);
		} else { //页面不正常
		//alert(http_request.responseText);
			alert("您所请求的页面有异常。");
		}
	}
}

function processRequest1() {
	if (http_request.readyState == 4) { // 已完成
		if (http_request.status == 200) { // 信息已经成功返回，开始处理信息
			//alert(http_request.responseText);
			//$("#Message").html(http_request.responseText);
		} else { //页面不正常
		//alert(http_request.responseText);
			alert("您所请求的页面有异常。");
		}
	}
}

