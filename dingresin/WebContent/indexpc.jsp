<!DOCTYPE html>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;charset=utf-8">
<meta charset="gbk">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<link type="text/css" rel="stylesheet" href="stylesheets/style.css" />
    <style>
        body {
            background-color: white;
        }
        *{
		padding: 0;
		margin: 0;
		}
		ul {
			list-style: none
		}
		li{
			height: 20px;
			padding: 10px;
			border-bottom: 1px solid #ccc;
			vertical-align: middle;
		}
        
        .icon img {
		height: 15px;
		width: 15px;
		}
		.icon {
			display: inline-block;
			vertical-align: middle;
			/*border: 1px solid #00ff00;*/
		}
		.text {
		margin-left: 10px;
		width: calc(100% - 50px);
		display: inline-block;
		text-align: left;
		line-height: 40px;
		vertical-align: middle;
		} 
    </style>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

<title>盘古系统门户</title>
<script type="text/javascript">

//在此拿到权限验证配置所需要的信息
var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;

</script>
<script type="text/javascript" src="javascripts/zepto.min.js"></script>
<script type="text/javascript" src="https://g.alicdn.com/dingding/dingtalk-pc-api/2.7.0/index.js">
</script>
<script type="text/javascript" src="javascripts/logger.js">
</script>
<script type="text/javascript" src="javascripts/demopc.js">
 
</script>
<script>
function openLink(url){
	DingTalkPC.biz.util.openLink({
		url:url,
	    onSuccess : function(result) {
	    },
	    onFail : function(err) {
	    	alert(JSON.stringify(err));
	    }
	});
}

</script>

</head>

<body >
	<!-- <div align="center">
		<img id ="userImg" alt="头像" src="./nav/default.png">
	</div>
	<div align="center">
		<span>UserName:</span>
		<div id="userName" style="display:inline-block"></div>
	</div >
	<div align="center">
		<span>UserId:</span>
		<div id="userId" style="display:inline-block"></div>
	</div> -->
	<br>
	<div style="padding-left:10px;">&nbsp;&nbsp;&nbsp;&nbsp;欢迎您：<div id="userName" style="display:inline-block;font-weight:bold"></div>&nbsp;成为盘古的一份子，您当前在钉钉的<code>userId</code>为：
		<div id="userId" style="display:inline-block;font-weight:bold"></div> 。</div>
	<br>
 <ul>
<li>
	<div class="icon"><img src="list/num11.png" style="width: 15px; height: 15px"></div>
	<div class="text">NC系统</div>
</li>
<li>
	<div class="icon"><img src="list/num2.png" style="width: 15px; height: 15px"></div>
	<div class="text">OA系统</div>
</li>
<li>
	<div class="icon"><img src="list/num3.png"  style="width: 15px; height: 15px"></div>
	<div class="text">BOH系统</div>
</li> 
<li>
	<div class="icon"><img src="list/num4.png" style="width: 15px; height: 15px"></div>
	<div class="text">EHR系统</div>
</li>
<li>
	<div class="icon"><img src="list/num5.png" style="width: 15px; height: 15px"></div>
	<div class="text">邮件系统</div>
</li>
<li>
	<div class="icon"><img src="list/num6.png" style="width: 15px; height: 15px"></div>
    <div class="text">E-learning</div>
</li>
<li>
	<div class="icon"><img src="list/num7.png" style="width: 15px; height: 15px"></div>
    <div class="text">团购券</div>
</li>
<li>
  <div class="icon"><img src="list/num8.png" style="width: 15px; height: 15px"></div>
  <div class="text">视频会议</div>
</li>
<li>
  <div class="icon"><img src="list/num9.png" style="width: 15px; height: 15px"></div>
  <div class="text">钉钉下载</div>
</li>
<li>
  <div class="icon">10</div>
  <div class="text">OMSP</div>
</li>
</ul>
 <script type="text/javascript">
window.addEventListener('load', function() {
	setTimeout(function(){
	}, 500);
});

	var items = document.querySelectorAll('li');
	var i = 0;
	items[0].addEventListener('click',function(){
 		/* window.location='http://ddtalk.github.io/dingTalkDoc/#企业接入指南'; */
 		openLink('http://nc.pankoo.com.cn:9898');
	});
	items[1].addEventListener('click',function(){
		openLink('http://oa.pankoo.com.cn:10631');
	});
	items[2].addEventListener('click',function(){
		openLink('http://boh.pankoo.com.cn:9005/RSC');
	});
	
	
	items[3].addEventListener('click', function(){
		openLink('http://ehr.pankoo.com.cn:9090');
	});
	
	items[4].addEventListener('click',function(){
		openLink('http://mail.pankoo.com.cn');
	});
	items[5].addEventListener('click',function(){
		openLink('http://cloud.pingnanlearning.com/pankoo/login/index.php');
	});
	items[6].addEventListener('click',function(){
		openLink('http://t.pankoo.com.cn');
	});	
	items[7].addEventListener('click',function(){
		openLink('http://pankoo.webex.com.cn/'); 
	});	
	items[8].addEventListener('click',function(){
		openLink('https://tms.dingtalk.com/markets/dingtalk/download'); 
	});	
	items[9].addEventListener('click',function(){
		openLink('http://omsp.pankoo.com.cn:8080/omsp'); 
	});	
</script>
 
</body>

</html>
