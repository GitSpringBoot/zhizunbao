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
    <title>个人信息修改</title>
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
    <!---------------------------------------header_nav begin------------------------------------->
     <div class="header_nav">
        <div class="main_width"  style="position: relative;right: 67px">
            <h1><a href="#" class="logo fl" style="position: relative;right:20px;"></a></h1>
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
	           		<input value="请输入关键字" onkeydown="if(event &amp;&amp; event.keyCode==13){search();}" onfocus=" if(this.value=='请输入关键字'){this.value=''; this.style.color='#ABA9A9';} " onblur="if(this.value==''|| this.value=='请输入关键字'){this.value='请输入关键字';}"
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
                            <li><a href="<%=basePath %>userInfo/toUserinfoInsure">我的保险</a></li>
                            <li ><a href="<%=basePath %>userInfo/userInfoClaims">我的理赔</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <h3 class="per list_til">个人信息</h3>
                    <div>
                        <ul>
                            <li class="active"><a href="<%=basePath %>userInfo/toUserinfoUpdate">个人信息修改</a></li>
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
            <div class="mycenter_right fix">
                <div class="contact_add">
                    <h2 class="tit">个人信息修改</h2>
                    <form id="updateUserInfo" action="<%=basePath %>userInfo/updateUserInfo" method="post">
                    <!--姓名-->
                    <input type="hidden" name="userId" value="${userInfo.userId }">
                       <div class="i_box fix">
                        <label for="familyName"><i class="mandatory">*</i>姓&emsp;&emsp;名</label>
                        <input type="text" required="required" title="请填写姓名"  value="${userInfo.realName }" name="realName" style="margin-right: 28px; width: 350px;" class="f_input" id="familyName">
                    </div>
                    <!--证件类型-->
                    <div class="i_box fix">
                        <label for="idType"><i class="mandatory">*</i>出生日期</label>
                            <input title="请选择出生日期" value="${userInfo.userBirthday }"  id="birthDate" onclick="laydate();" class="f_input laydate-icon" style="margin-right: 28px; width: 350px;">
                    </div>
                    <!--证件类型-->
                    <div class="i_box fix">
                        <label for="idType"><i class="mandatory">*</i>身&ensp;份&ensp;证</label>
                        <input title="请填写身份证号" maxlength="18" id="userCard" disabled="disabled" value="${userInfo.userCard }" name="userCard" class="f_input" style="margin-right: 28px; width: 350px;">
                    	<span id="cardP"></span>
                    </div>
                    <!--性别-->
                    <div class="i_box fix">
                        <label for="sexBox"><i class="mandatory">*</i>性&emsp;&emsp;别</label>
                        <div class="fl" id="sexBox">
                            <label><input name="userSex" type="radio" value="0" class="ace" <c:if test="${userInfo.userSex==0}"> checked="checked"</c:if>><span class="lbl">男</span></label>&nbsp;&nbsp;
                            <label><input name="userSex" type="radio" value="1" class="ace" <c:if test="${userInfo.userSex==1}">checked="checked"</c:if>><span class="lbl">女</span></label>
                        </div>
                    </div>
                    <!--手机号-->
                    <div class="i_box fix">
                        <label for="mobile"><i class="mandatory">*</i>手&ensp;机&ensp;号</label>
                        <input type="text" title="请填写手机号"  value="${userInfo.userTel }" name="userTel" style="margin-right: 28px; width: 350px;" class="f_input" id="phone" maxlength="11">
                    	<span id="phoneP"></span>
                    </div>
                    <div class="btns_box">
                        <button type="button" onclick="modify();"  style="background-color: white; border: none; cursor: pointer;"> <a style="cursor: pointer;" class="submit_btn">修&emsp;改</a></button>
                    </div>
                    </form>
                </div>
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
<script src="<%=basePath %>/styles/insurance/js/jquery-1.12.3.min.js"></script>
<script src="<%=basePath %>styles/insurance/layer/layer.js" type="text/javascript"></script>
<script src="<%=basePath %>/styles/insurance/laydate/laydate.js"></script>
<script>
/*     $(function(){
        $("#idType").click(function(){
            $(this).toggleClass("cur","");
            $(this).find(".select_list").toggle();
        });
    }); */
   //修改信息
    function modify(){
    	var flag = testPhone();
    	if(flag){
    		/* var ca = testCard();
    		if(ca){ */
    			layer.confirm('确认修改信息？', {
					  btn: ['确定'] //按钮
					}, function(){
						$("#updateUserInfo").submit();
					});
    	/* 	}else{
    			return false;
    		} */
    	}else{
    	return false;
    	 }
	   };
    //验证身份证   
    function testCard(){
    var card = $("#userCard").val();  
    var flag = false;  
    var message = "";  
    var myreg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;         
    if(card == ''){  
      message = "身份证号不能为空！";  
    }else if(card.length !=18){  
      message = "请输入有效的身份证号！";  
    }else if(!myreg.test(card)){  
      message = "请输入有效的身份证号！";  
    }else{  
        flag = true;  
    }  
    if(!flag){  
    	  //提示错误效果  
      $("#cardP").empty();
      layer.tips(''+message+'', '#userCard'); 
      $("#userCard").focus();  
    }else{  
      //提示正确效果   
      $("#cardP").html("<font size='4px' color='green'>身份证验证通过</font>"); 
    }  
    return flag;
    }	
    
  //验证手机号
    function testPhone(){
    var phone = $("#phone").val();  
    var flag = false;  
    var message = "";  
    var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;         
    if(phone == ''){  
      message = "手机号码不能为空！";  
    }else if(phone.length !=11){  
      message = "请输入有效的手机号码！";  
    }else if(!myreg.test(phone)){  
      message = "请输入有效的手机号码！";  
    }else{  
        flag = true;  
    }  
    if(!flag){  
    	  //提示错误效果  
      $("#phoneP").empty();	  
      layer.tips(''+message+'', '#phone'); 
      $("#phone").focus();  
    }else{  
      //提示正确效果   
    	$("#phoneP").html("<font size='4px' color='green'>该手机号码可用</font>");
    }  
    return flag;
    }	
	</script>
</body>
</html>