<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>查询保险</title>
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/list.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/mystyles.css">
</head>
<body>
<div class="wrapper">
    <!--------------------------------------header_user begin------------------------------------->
    <div class="header_user">
        <div class="main_width">
            <span class="tel">客服电话：185-1566-9606（周一至周六 9:00-18:00）</span>
            <span class="fr">
                <c:if test="${userInfo1!=null }">
	                <span class="my_insurance"><a href="<%=basePath%>userInfo/toUserinfoInsure">我的保险</a></span>
	                <span class="message"><a href="<%=basePath%>userInfo/toUserinfoMessage">消息<em>${userInfo1.userMsg }</em></a></span>
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
	           		<input type="hidden" name="currentPage" id="cur">
	           		<input value="${insure.insureName }" onkeydown="if(event &amp;&amp; event.keyCode==13){search();}" onfocus=" if(this.value=='请输入关键字'){this.value=''; this.style.color='#ABA9A9';} " onblur="if(this.value==''|| this.value=='请输入关键字'){this.value='请输入关键字';}"
	           		style="color:#ABA9A9;position:absolute;width: 209px;height:31px;border: 2px solid #ff8712;" type="text" name="chaxun">
	           		<input style="position: absolute;margin-left: 213px"  type="image"  src="<%=basePath%>styles/insurance/logo/sousuo.png"/>
	           	</form>		
           	</div>
        </div>        	
    </div>
	<!------------------------------------- end form section ---------------------->	
    <!----------------------------------------header_nav end-------------------------------------->
    <table height="30px"></table>
    <!--container begin-->
    <div class="container">
        <div class="main_width list_new">
            <div class="list_con fix">
                <!--list-->
                <c:forEach items="${findInsureList }" var="ins">
	                <div class="list list_s" style="position:relative">
		            <img style="position:absolute; left:74%; top:27%;" src="<%=basePath%>${ins.imgSrc}" alt="暂无图片">
	                    <!--<input type="hidden" class="imgurl">-->
	                    <h2>
	                        <a href="<%=basePath %>frontInsure/findInsureByInsureId?insureId=${ins.insureId}">&nbsp;&nbsp;${ins.insureName }</a>
	                    	<p class="n">&nbsp;保障期限${ins.insureTimelimit }天</p>
	                    </h2>
	                    <div class="s_box">
	                        <p class="p1">保单形式:${ins.insureShape }</p>
	                        <p class="p2" style="width: 70%">${ins.insureContent }</p>
	                    </div>
	                     <div class="s_box_hover">
	                        <p style="width: 70%">${ins.insureContent }</p>
	                    </div>
	                    <p class="price">
	                        <em>￥</em>
	                        ${ins.insurePrice }
	                        <em>元起</em>
	                       
	                    </p>
	                    <p>
	                        <a href="<%=basePath %>frontInsure/findInsureByInsureId?insureId=${ins.insureId}" class="custom">评价：${ins.commentCount }条</a>
	                        <span class="saled">售出：${ins.insureNumber }份</span>
	                    </p>
	                    <a href="<%=basePath %>frontInsure/findInsureByInsureId?insureId=${ins.insureId}" class="btn">查看详情</a>
	                    <a href="<%=basePath %>frontInsure/findInsureByInsureId?insureId=${ins.insureId}" class="a_link"></a>
	                </div>
                </c:forEach>
           	 </div>
           	 <div class="custom_page" id="custom_page">
	           	 <c:if test="${page.currentPage!=1 }">
	                  <a class="prev" onclick="fenye(${page.prevPage});">上一页</a>
	             </c:if>
	             <c:if test="${page.lastPage!=1 }">   
                  <c:forEach begin="1" end="${page.lastPage }" varStatus="n">
	                  <c:choose>
		                  <c:when test="${page.currentPage == n.count }">
		                  	<a class="current" href="javascript:;" onclick="fenye(${n.count});">${n.count }</a>
		                  </c:when>
		                  <c:otherwise>
		                  	<a href="javascript:;" onclick="fenye(${n.count});">${n.count }</a>
		                  </c:otherwise>
	                  </c:choose>
                  </c:forEach>
                  </c:if>  
                  <c:if test="${page.currentPage!=page.lastPage }">		
                  <a href="javascript:;" onclick="fenye(${page.nextPage});" class="next">下一页</a>
                  </c:if>
             </div>
          </div>
    <!---container end--->
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
        <a href="#" class="slider_block backtop" id="backtop"><i></i></a>
    </div>
</div>
</div>
<script src="<%=basePath %>styles/insurance/js/jquery-1.12.3.min.js"></script>
<script src="<%=basePath %>styles/insurance/js/detail.js"></script>
<script src="<%=basePath %>styles/insurance/js/list.js"></script>
<script type="text/javascript">
	function fenye(page){
		$("#cur").val(page);
		$("#myForm").submit(); 
		
	}
</script>
</body>
</html>