<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<link rel="stylesheet" href="${basePath}styles/behind/css/style.css" />
	<link href="${basePath}styles/behind/assets/css/codemirror.css"
		rel="stylesheet">
	<link rel="stylesheet"
		href="${basePath}styles/behind/assets/css/ace.min.css" />
	<link rel="stylesheet"
		href="${basePath}styles/behind/font/css/font-awesome.min.css" />
	<!--[if lte IE 8]>
			  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
			<![endif]-->
    <link rel="stylesheet" href="${basePath}styles/insurance/css/common.css">
    <link rel="stylesheet" href="${basePath}styles/insurance/css/detail.css">
</head>
<body  style="font-size: 67px;" >
<div class="wrapper">
    <!--------------------------------------header_user begin------------------------------------->
    <div class="header_user">
        <div class="main_width">
            <span class="tel">客服电话：400-663-6600（周一至周六 9:00-18:00）</span>
            <span class="fr">
                <#if userInfo1?? >
                <span class="my_insurance"><a href="${basePath}userInfo/toUserinfoInsure">我的保险</a></span>
                <span class="message"><a href="#">消息<em>${userInfo1.userMsg!''}</em></a></span>
						<span><font>欢迎，${userInfo1.userName }</font></span>
						<a href="${basePath}userInfo/userInvalidate?user_id=${userInfo1.userId }">注销登录</a>
				
				<#else>
						 <span class="register"><a href="${basePath}userInfo/toUserRegister">注册</a></span>
               			 <span class="fg"><a href="#"> &nbsp;|&nbsp; </a></span>
               			 <span><a href="${basePath}userInfo/toUserLogin">登录</a></span>
				</#if>
            </span>
        </div>
    </div>
    <!---------------------------------------header_user end-------------------------------------->
    <!---------------------------------------header_nav begin------------------------------------->
    <div class="header_nav">
        <div class="main_width"  style="position: relative;right: 67px">
            <h1><a href="#" class="logo fl" style="position: relative;right:20px;">大特保保险官网-互联网保险服务平台</a></h1>
            <a style="float: right;margin-right: -155px" href="${basePath}userInfo/toUserinfoInsure" class="my_policy fr">我的保单</a>
            <div class="menuBox">
               <ul class="menu">
               		<li>
               			<a href="${basePath}home/page">首页</a>
                    </li>
		           <li class="special">
		               	<a href="${basePath}frontInsure/findAllInsure">保险产品</a>
		           </li>
                    <li>
               			<a href="${basePath}userInfo/userInfoClaims">理赔</a>
                    </li>
                     <li>
               			<a href="${basePath}activit/tofrontActivity">活动</a>
                    </li>
                	 <li>
               			<a href="${basePath}home/toContactUs">联系我们</a>
                    </li>
                </ul>
            </div>
        </div>
         <!--------------------------------- form section ---------------------->
    	<div style="float:left;margin:-38px 0 0 461px">
    		<div style="position: relative;">
	           <form id="myForm" action="${basePath}frontInsure/findInsureListByName" method="post">
	           		<input value="请输入关键字" onkeydown="if(event &amp;&amp; event.keyCode==13){search();}" onfocus=" if(this.value=='请输入关键字'){this.value=''; this.style.color='#ABA9A9';} " onblur="if(this.value==''|| this.value=='请输入关键字'){this.value='请输入关键字';}"
	           		style="color:#ABA9A9;position:absolute;width: 192px;height:23px;border: 2px solid #ff8712;" type="text" name="chaxun">
	           		<input style="position: absolute;margin-left: 213px"  type="image"  src="${basePath}styles/insurance/logo/sousuo.png"/>
	           	</form>		
           	</div>
        </div>        	
    </div>
    <div class="container health_notify">
        <h1 style="color: red;"></h1>
        <div class="procedures">
            <img src="" alt="">
        </div>
        <div class="notify_box" style="width: 968px;margin-left: 576px" >
            <p style="font-size: 44px; color: #379b29; line-height: 95px;l">
            	${ob!''}
            	${obc!''}
            </p>
            <div class="health_box">
                <a href="${basePath}activit/tofrontActivity" class="n"><h3>返回</h3></a>
            </div>
        </div>
    </div>
    </div>
  </div>
</body>
</html>