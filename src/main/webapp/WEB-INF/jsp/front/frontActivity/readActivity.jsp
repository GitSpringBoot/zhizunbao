<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" >
<head>
    <title>活动阅读</title>
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/book.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/index.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/jquery.slideBox.css">
<<<<<<< .mine
     <link rel="stylesheet" href="<%=basePath %>/styles/personalStyles/js/jquery-1.9.1.min.js">
 	<script>
	      function two_char(n) {
	            return n >= 10 ? n : "0" + n;
	        }
	        function time_fun() {
	            var sec=0;
	            setInterval(function () {
	                sec++;
	                var date = new Date(0, 0)
	                date.setSeconds(sec);
	                var h = date.getHours(), m = date.getMinutes(), s = date.getSeconds();
	                document.getElementById("mytime").innerText = two_char(h) + ":" + two_char(m) + ":" + two_char(s);
	            }, 1000);
	        } 
	    </script> 
||||||| .r299
=======
    
>>>>>>> .r306
</head>
   <style>
        #mytime {
       		 
            text-align: center;
           color:#ff1313;
        }
    </style>
 <body onload="time_fun()"> 
<div class="wrapper" >
    <!--------------------------------------header_user begin------------------------------------->
    <div class="header_user">
        <div class="main_width">
            <span class="tel">客服电话：400-663-6600（周一至周六 9:00-18:00）</span>
            <span class="fr">
                <span class="my_insurance"><a href="<%=basePath%>userInfo/toUserinfoInsure">我的保险</a></span>
                <span class="message"><a href="<%=basePath %>userInfo/toUserinfoMessage">消息<em>${userInfo1.userMsg }</em></a></span>
                <c:if test="${userInfo1!=null }">
						<span><font>欢迎，${userInfo1.userName }</font></span>
							<span><font>登陆时间:${userInfo1.loginTime }</font></span>
						<a href="<%=basePath%>userInfo/userInvalidate?user_id=${userInfo1.userId }">注销登录</a>
				</c:if>
				<c:if test="${userInfo1==null }">
						 <span class="register"><a href="<%=basePath%>userInfo/toUserRegister">注册</a></span>
               			 <span class="fg"><a href="#"> &nbsp;|&nbsp; </a></span>
               			 <span><a href="<%=basePath%>userInfo/toUserLogin">登录</a></span>
				</c:if>
            </span>
        </div>
    </div>
    <div class="header_nav">
        <div class="main_width"  style="position: relative;right: 67px">
            <h1><a href="#" class="logo fl" style="position: relative;right:20px;">至尊宝保险官网-互联网保险服务平台</a></h1>
            <a style="float: right;margin-right: -155px" href="<%=basePath%>userInfo/toUserinfoInsure" class="my_policy fr">我的保单</a>
            <div class="menuBox">
               <ul class="menu">
               		<li>
               			<a href="<%=basePath %>home/page">首页</a>
                    </li>
		           <li class="special">
		               	<a href="<%=basePath %>frontInsure/findAllInsure">保险产品</a>
		           </li>
                    <li>
               			<a href="<%=basePath %>userInfo/userInfoClaims">理赔</a>
                    </li>
                     <li>
               			<a href="<%=basePath %>activit/tofrontActivity">活动</a>
                    </li>
                	 <li>
               			<a href="<%=basePath %>home/toContactUs">联系我们</a>
                    </li>
                </ul>
            </div>
        </div>
          <div style="float:left;margin:-39px 0 0 461px">
    		<div style="position: relative;">
	           <form action="<%=basePath %>frontInsure/findInsureListByName" method="post">
	           		<input value="请输入关键字" onkeydown="if(event &amp;&amp; event.keyCode==13){search();}" onfocus=" if(this.value=='请输入关键字'){this.value=''; this.style.color='#ABA9A9';} " onblur="if(this.value==''|| this.value=='请输入关键字'){this.value='请输入关键字';}"
	           		style="color:#ABA9A9;position:absolute;width: 209px;height:31px;border: 2px solid #ff8712;" type="text" name="chaxun">
	           		<input style="position: absolute;margin-left: 213px"  type="image"  src="<%=basePath%>styles/insurance/logo/sousuo.png"/>
	           	</form>		
           	</div>
        </div>  
        
   
        
     </div>
    <div class="container health_notify">
     <h1 id="mytime" style="font-size:80px; position:relative;left:17px;top:20px;position: fixed;">time_fun()</h1>  
        <h1 style="color: red;">${userRead.readTitle }</h1>
        <div class="procedures">
            <img src="${userRead.readImg }" alt="">
        </div>
        <div class="notify_box" style="width: 1500px">
            <h2 style="color: blue;">${userRead.readTitle }</h2>
            <p style="font-size: 25px; color: #379b29; line-height: 56px">
            	${userRead.readContent }
            </p>
            <div class="health_box">
             <!--  <a  href="javascript:void(0);" id="back_fh()" onclick="back_fh()" class="n">返回</a>   -->
               <a href="<%=basePath %>activit/toSettlement" onclick="fh()" class="n">返回</a>  
            </div>
        </div>
    </div>
    <!--footer begin-->
    <div class="copyright">
        <div class="main_width footer">
            <div class="footer_nav">
                <p>
                    <a href="#">关于京东金融</a>
                    <span class="divider">|</span>
                    <a href="#">关于京东小金库</a>
                    <span class="divider">|</span>
                    <a href="#">关于京东钱包</a>
                    <span class="divider">|</span>
                    <a href="#">关于京东白条</a>
                    <span class="divider">|</span>
                    <a href="#">联系我们</a>
                    <span class="divider">|</span>
                    <a href="#">免责声明</a>
                </p>
                <p>Copyright © 2004-2016 京东JD.com 版权所有<span class="divider">|</span>投资有风险，购买需谨慎</p>
            </div>
            <div class="footer_contact">
                <div class="f_contact_time">
                    联系我们<span>（09:00-22:00）</span>
                </div>
                <div class="f_contact_content">
                    <div class="f_cc_left">
                        <span class="f_cc_item">个人业务：400-098-8511</span>
                        <span class="f_cc_item">企业业务：400-088-8816</span>
                    </div>
                    <div class="f_cc_mid">
                        <a href="#" class="f_cc_link item_JIMI">咨询JIMI</a>
                        <a href="#" class="f_cc_link item_kefu">在线客服</a>
                    </div>
                    <div class="f_cc_right">
                        <a href="#" class="f_cc_link item_mail">客服邮箱</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
</body>
</html>