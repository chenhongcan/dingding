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
			height: 70px;
			padding: 10px;
			border-bottom: 1px solid #ccc;
			vertical-align: middle;
		}
        
        .icon img {
		height: 70px;
		width: 70px;
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
		line-height: 70px;
		vertical-align: middle;
		} 
    </style>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

<title>��ҵ��������ҳ</title>
<script type="text/javascript">

//�ڴ��õ�Ȩ����֤��������Ҫ����Ϣ
var _config = <%= com.alibaba.dingtalk.openapi.demo.auth.AuthHelper.getConfig(request) %>;

</script>
<script type="text/javascript" src="javascripts/zepto.min.js"></script>
<script type="text/javascript" src="http://g.alicdn.com/ilw/ding/0.7.3/scripts/dingtalk.js">
</script>
<script type="text/javascript" src="javascripts/logger.js">
</script>
<script type="text/javascript" src="javascripts/demo.js">
 
</script>
<script>
function openLink(url){
	dd.biz.util.openLink({
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
		<img id ="userImg" alt="ͷ��" src="./nav/default.png">
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
	<div style="padding-left:10px;">&nbsp;&nbsp;&nbsp;&nbsp;��ӭ����<div id="userName" style="display:inline-block;font-weight:bold"></div>&nbsp;��Ϊ���������ߣ�����ǰ�ڶ�����<code>userId</code>Ϊ��
		<div id="userId" style="display:inline-block;font-weight:bold"></div> ��</div>
	<div style="padding-left:10px;">&nbsp;&nbsp;&nbsp;&nbsp;����Ϊ���ṩ���ĵ���<code>api</code>���������ٵĿ���΢Ӧ�ò����붤����</div>
	<br>
 <ul>
<li>
	<div class="icon"><img src="list/num11.png" style="width: 25px; height: 25px"></div>
	<div class="text">��ҵ����ָ��</div>
</li>
<!-- <li>
	<div class="icon"><img src="list/heart2.png"></div>
	<div class="text">��ҵ��Ȩ</div>
</li>
<li>
	<div class="icon"><img src="list/heart3.png"></div>
	<div class="text">��ҵ����Ȩ</div>
</li> -->
<li>
	<div class="icon"><img src="list/num2.png" style="width: 25px; height: 25px"></div>
	<div class="text">ʹ��JSAPI</div>
</li>
<li>
	<div class="icon"><img src="list/num33.png" style="width: 25px; height: 25px"></div>
	<div class="text">�������</div>
</li>
<li>
	<div class="icon"><img src="list/num4.png" style="width: 25px; height: 25px"></div>
    <div class="text">Listչʾ����ǰ��֧��Android��</div>
</li>
<li>
	<div class="icon"><img src="list/num5.png" style="width: 25px; height: 25px"></div>
    <div class="text">����չ�֣���ǰ��֧��Android��</div>
</li>
<li>
  <div class="icon"><img src="list/num6.png" style="width: 25px; height: 25px"></div>
  <div class="text">Tabҳ�棨��ǰ��֧��Android��</div>
</li>
<li>
  <div class="icon"><img src="list/num7.png" style="width: 25px; height: 25px"></div>
  <div class="text">��ҵͨѶ¼</div>
</li>
<li>
  <div class="icon"><img src="list/num7.png" style="width: 25px; height: 25px"></div>
  <div class="text">OA system</div>
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
 		/* window.location='http://ddtalk.github.io/dingTalkDoc/#��ҵ����ָ��'; */
 		openLink('http://ddtalk.github.io/dingTalkDoc/#��ҵ����ָ��');
	});
	items[1].addEventListener('click',function(){
		openLink('http://h5.m.laiwang.com/home/ding.html');
	});
	items[2].addEventListener('click',function(){
		 window.location='./nav/1.html';
	});
	
	
	items[3].addEventListener('click', function(){
 		window.location = './list/list.html'; 
	});
	
	items[4].addEventListener('click',function(){
 	 	window.location='./drawer/index.html'; 
	});
	items[5].addEventListener('click',function(){
 		 window.location='./tab/index.html'; 
	});
	items[6].addEventListener('click',function(){
 		 window.location='./contacts.jsp?corpid='+_config.corpId; 
	});	
	items[7].addEventListener('click',function(){
		openLink('http://oa.pankoo.com.cn:10631'); 
	});	
	
</script>
 
</body>

</html>
