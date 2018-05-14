<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>个人理赔</title>
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/index.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/jquery.slideBox.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/center.css">
</head>
<body>
<div class="wrapper">
    <!--------------------------------------header_user begin------------------------------------->
    <div class="header_user">
        <div class="main_width">
            <span class="tel">客服电话：185-1566-9606（周一至周六 9:00-18:00）</span>
            <span class="fr">
                <span class="my_insurance"><a href="<%=basePath%>userInfo/toUserinfoInsure">我的保险</a></span>
                <span class="message"><a href="<%=basePath%>userInfo/toUserinfoMessage">消息<em>${userInfo1.userMsg }</em></a></span>
                <c:if test="${userInfo1!=null }">
						<span><font>欢迎，${userInfo1.userName }</font></span>
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
    <!---------------------------------------header_user end-------------------------------------->
    <!---------------------------------------header_nav begin------------------------------------->
    <div class="header_nav">
        <div class="main_width"  style="position: relative;right: 67px">
            <h1><a href="#" class="logo fl" style="position: relative;right:20px;">大特保保险官网-互联网保险服务平台</a></h1>
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
         <!--------------------------------- form section ---------------------->
    	<div style="float:left;margin:-38px 0 0 461px">
    		<div style="position: relative;">
	           <form id="myForm" action="<%=basePath %>frontInsure/findInsureListByName" method="post">
	           		<input value="请输入关键字" onkeydown="if(event &amp; &amp; event.keyCode==13){search();}" onfocus=" if(this.value=='请输入关键字'){this.value=''; this.style.color='#ABA9A9';} " onblur="if(this.value==''|| this.value=='请输入关键字'){this.value='请输入关键字';}"
	           		style="color:#ABA9A9;position:absolute;width: 209px;height:31px;border: 2px solid #ff8712;" type="text" name="chaxun">
	           		<input style="position: absolute;margin-left: 213px"  type="image"  src="<%=basePath%>styles/insurance/logo/sousuo.png"/>
	           	</form>		
           	</div>
        </div>        	
    </div>
	<!------------------------------------- end form section ---------------------->	
    <!----------------------------------------header_nav end-------------------------------------->
    <!--container-->
    <div class="container">
      <div class="main_width fix mycenter_box">
        <!--2016/5/25修改-->
             <div class="list_left" id="list_left">
            <ul>
                <li class="head">
                    <img src="<%=basePath %>styles/insurance/images/center/side-head.png" alt="">
                </li>
                <li>
                    <h3 class="order list_til">我的订单</h3>
                    <div>
                        <ul>
                            <li ><a href="<%=basePath %>userInfo/toUserinfoInsure">我的保险</a></li>
                            <li class="active"><a href="<%=basePath %>userInfo/userInfoClaims">我的理赔</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <h3 class="per list_til">个人信息</h3>
                    <div>
                        <ul>
                            <li><a href="<%=basePath %>userInfo/toUserinfoUpdate">个人信息修改</a></li>
                            <li><a href="<%=basePath %>userInfo/toUpdateUserPassword">账户及密码</a></li>
                            <li><a href="<%=basePath %>userInfo/toUserinfoMessage">消息中心</a></li>
                            <li><a href="<%=basePath %>userInfo/userCollectList">个人收藏</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                        <h3 class="wallet list_til">我的钱包</h3>
                        <div>
                            <ul>
                                <li><a href="<%=basePath %>userInfo/toUserDiscounts">优惠券</a></li>
                            </ul>
                        </div>
                    </li>
            </ul>
        </div>
            <div class="mycenter_right">
                <!--tab title-->
                <div class="mypolicy_tab" id="mypolicyTab">
                    <ul class="tab_box">
                        <li class="active"><a href="javascript:">保障中</a></li>
                    </ul>
                </div>
                <!--保障中-->
                <div class="mypolicy_con mc">
                
                            <ul class="mypolicy_title fix">
                            <li class="myProduct">保险产品</li>
                            <li class="myName">被保险人</li>
                            <li class="myPrice">实付款（元）</li>
                            <li class="myStutas">保单状态</li>
                            <li class="myStutas">审核状态</li>
                            
                           </ul>
                                
                  <c:forEach items="${userInsure }" var="w" varStatus="q" >
                       <c:if test="${w.insureStatus==2 }">
                            <div class="mypolicy_lists">
                            <div class="list">
                                <div class="tit">
                                    <c:if test="${w.applyStatus==null}">
                                    <a href="<%=basePath %>userInfo/toAddUserInfoClaims?id=${w.id}" target="_blank">
                                                                             申请理赔
                                     </a>
                                     </c:if>
                                     <c:if test="${w.applyStatus!=null }">
                                     <a target="_blank">
                                                                             理赔中
                                     </a>
                                     </c:if>
                                    <span>投保时间：${w.buyTime }</span>
                                    <span>保单金额：<em><i>￥</i>${w.buyMoney }</em></span>
                                </div>
                                <ul class="con fix">
                                    <li class="myProduct">
                                        <h2><a href="#" target="_blank" class="t">${w.insureName }</a></h2>
                                        
                                    </li>
                                    <li class="myName">
                                        <p>${w.realName }</p>
                                    </li>
                                    <li class="myPrice">
                                        <p><i>￥</i>${w.buyMoney }</p>
                                    </li>
                                    <li class="myStutas">
                                        <p>
                                           <c:if test="${w.insureStatus==2 }">
                                                                                             保障中
                                           </c:if>
                                        </p>
                                    </li>

                                    <li class="myOpreat">
                                           <c:if test="${w.applyStatus==0 }">
                                                                                             审核中
                                           </c:if>
                                    </li>
                                </ul>
                            </div>
                        </div></c:if>
                       
                  </c:forEach>  
                </div>
            </div>
        </div>
	<!--footer begin-->
	    <div class="copyright">
	        <div class="main_width footer">
	            <div class="footer_nav">
	                <p>
	                    <a href="#">关于至尊保金融</a>
	                    <span class="divider">|</span>
	                    <a href="#">关于至尊保小金库</a>
	                    <span class="divider">|</span>
	                    <a href="#">关于至尊保钱包</a>
	                    <span class="divider">|</span>
	                    <a href="#">关于至尊保白条</a>
	                    <span class="divider">|</span>
	                    <a href="<%=basePath %>home/toContactUs">联系我们</a>
	                    <span class="divider">|</span>
	                    <a href="#">免责声明</a>
	                </p>
	                <p>Copyright © 2012-2024 至尊保bao.com 版权所有<span class="divider">|</span>投资有风险，购买需谨慎</p>
	            </div>
	            <div class="footer_contact">
	                <div class="f_contact_time">
	                    联系我们<span>（09:00-22:00）</span>
	                </div>
	                <div class="f_contact_content">
	                    <div class="f_cc_left">
	                        <span class="f_cc_item">个人业务：185-1566-9606</span>
	                        <span class="f_cc_item">企业业务：185-1566-9606</span>
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
	    <!--footer end-->
        <div class="sideBar">
        <a href="#" class="slider_block app"><i></i></a>
        <a href="#" class="slider_block jimi"><i></i></a>
        <a href="#" class="slider_block feedback"><i></i></a>
        <a href="javascript:" class="slider_block backtop" id="backtop"><i></i></a>
    </div>
    </div>
</div>
<script src="<%=basePath %>/styles/insurance/js/jquery-1.12.3.min.js"></script>
<script>
    $(function(){
    	$(".mc").show();
        $("#mypolicyTab").find("ul").find("li").click(function () {
            index=$(this).index();
            $(this).addClass("active").siblings().removeClass("active");
            $(".mycenter_right").find("div.mypolicy_con").eq(index).show().siblings("div.mypolicy_con").hide();
        });
    });
    function findOne(id) {
		location.href="<%=basePath %>userInfo/insureDetails?id="+id;
	}
</script>
</body>
</html>