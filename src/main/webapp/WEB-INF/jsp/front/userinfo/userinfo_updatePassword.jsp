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
    <title>账户密码修改</title>
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/index.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/jquery.slideBox.css">
    <link rel="stylesheet" href="<%=basePath %>/styles/insurance/css/center.css">
    
    <script src="<%=basePath %>/styles/insurance/laydate/laydate.js"></script>
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
    </div>
    <!----------------------------------------header_nav end-------------------------------------->
    <!--container-->
    <div class="container">
        <div class="main_width fix mycenter_box mycenter_contact">
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
                            <li ><a href="<%=basePath %>userInfo/userInfoClaims">我的理赔</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <h3 class="per list_til">个人信息</h3>
                    <div>
                        <ul>
                            <li><a href="<%=basePath %>userInfo/toUserinfoUpdate">个人信息修改</a></li>
                            <li   class="active"><a href="<%=basePath %>userInfo/toUpdateUserPassword">账户及密码</a></li>
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
            <!--账户及密码-->
            <div class="mycenter_right fix">
                <div class="safety_note">
                    <p>自动注册账户的密码请在手机短信中查找修改</p>
                </div>
               <form id="Form">
                    <input style="border: none; margin-left: 50px; height: 20px; font-size: 20px;" type="hidden" name="userId" value="${sessionScope.userInfo1.userId }">
                    <ul class="safety_con">
                    <li class="s_mobile">
                        <label>账&ensp;户&ensp;号</label>
                        <input style="border: none; margin-left: 50px; height: 20px; font-size: 20px; background-color: white;" name="userName" disabled="disabled" value="${sessionScope.userInfo1.userName }">
                    </li>
                    <li class="s_psd">
                        <label>密&emsp;&emsp;码</label>
                       <a><input type="button" id="sub" style="border: none; background-color: white; cursor: pointer; margin-top: 30px;" value="修&emsp;改"></a>
                       <input placeholder="请输入新密码" type="password" class="password" style="border: none; margin-left: 50px; height: 20px; font-size: 17px;" name="userPassword" >
                    </li>
                </ul>
               </form>
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
</body>
<script src="<%=basePath %>styles/insurance/js/jquery-1.12.3.min.js"></script>
<script src="<%=basePath %>styles/insurance/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript">
		(function(){
		    var sub = document.getElementById("sub");
		    if(sub.addEventListener){
		        sub.addEventListener("click", test);  
		    }else if(sub.attachEvent){
		        sub.attachEvent("onClick", test);
		    }
		})();
		
		//密码不能为空
		function test() {
			if($(".password").val()==null||$(".password").val()==""){
			  layer.alert('密码不能为空哦！', {
			    skin: 'layui-layer-lan'
			    ,closeBtn: 0
			    ,anim: 4 //动画类型
			  });
			}else{
				var pwd = $(".password").val();
				$.post(
					"<%=basePath %>userInfo/updateUserPassword",
					{"userPassword":pwd},
					function(msg){
						if(msg){
							layer.confirm('密码修改成功！', {
								  btn: ['确定'] //按钮
								}, function(){
									location="<%=basePath %>userInfo/userInvalidate";
								});
						}else{
							layer.msg('密码修改失败！');
						}
						
					},"json"
				);
			}
			};
			

</script>
</html>