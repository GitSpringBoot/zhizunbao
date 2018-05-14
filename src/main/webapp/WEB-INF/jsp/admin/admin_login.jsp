<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Head -->
<head>
	<title>登录表单</title>
	<!-- Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<link rel="stylesheet" href="<%=basePath%>styles/behind/css/style1.css" type="text/css" media="all"> 
		
</head>


<body>
	<h1>至尊保后台管理系统</h1>
	<div class="container w3layouts agileits">
	<div class="login w3layouts agileits" style="padding-left: 230px;">
	<h2>登 录</h2>
	
	
	
    <form  action="<%=basePath%>adminLogin/login" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="username" name="username" type="text" value="${man.username }" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      
      
      
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      
      
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" name="key" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src="<%=basePath%>code.jsp" id="imgg" onclick="getCode()"> <a id="kanbuq" href="javascript:;" onclick="getCode()">看不清，换一张</a>
        </div>
      </div>
      
      
     <div class="social-icons w3layouts agileits"> 
	  <ul class="tick w3layouts agileits" >
				<li>
					<input type="checkbox"  name="online" id="remember" value="">
					<label for="brand1">记住密码</label><br>
					<span style="color: red;">${error}</span>
				</li>
			</ul>
	  </div> 
    </div> 
      
      
      <div class="row cl">
        <div class="send-button w3layouts agileits">
          <input  type="submit" class="btn btn-success radius size-L" value="登&nbsp;&nbsp;&nbsp;&nbsp;录">
           
           
        </div>
      </div>
  	  <div class="row cl">
        <div class="send-bu w3layouts agileits">
          <input  type="reset"  class="btn btn-success radius size-L" value="取&nbsp;&nbsp;&nbsp;&nbsp;消">
        </div>
      </div> 
    </form>
    
			<!-- <div class="social-icons w3layouts agileits">
				<p>- 其他方式登录 -</p>
				<ul>
					<li class="qq"><a href="#">
					<span class="icons w3layouts agileits"></span>
					<span class="text w3layouts agileits">QQ</span></a></li>
					<li class="weixin w3ls"><a href="#">
					<span class="icons w3layouts"></span>
					<span class="text w3layouts agileits">微信</span></a></li>
					<li class="weibo aits"><a href="#">
					<span class="icons agileits"></span>
					<span class="text w3layouts agileits">微博</span></a></li>
					<div class="clear"></div>
				</ul>
			</div> -->
			<div class="clear"></div>
		</div><div class="copyrights"></div>
		<div class="clear"></div>
	</div>
</body>
<%@include file="/styles/common/behind/jsStyle.jsp" %>
<script type="text/javascript">
// 得到Cookie
// name：username、password
function getCookie(name) {
	// 浏览器username=admin; password=admin
    var strCookie=document.cookie;
    // 数组
    // [0]  username=admin	
    // [1]  password=admin
    var arrCookie=strCookie.split("; ");
    
    for(var i=0;i<arrCookie.length;i++) {
    	// username=admin
        var arr=arrCookie[i].split("=");
    	// arr[0]=username
        if(arr[0]==name)
        	// arr[1]=admin
            return arr[1];
    }
    return "";
}

// 设置Cookie
// name:username,value:admin
// name:password,value:admin
function setCookie(name,value) {
    var Days = 30;
    var exp = new Date();
    // 时间戳  exp.getTime()    ：           1970-1-1  至今的时间  毫秒数
    // 设置有效时间
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    // username=admin;
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

// 加载页面  
$(function() {
	var usernameStr = "username";
    var passwordStr = "password";
	// 判断cookie是否存在用户名密码
    if((getCookie(usernameStr)!=null&&getCookie(usernameStr)!="")&&getCookie(passwordStr)!=null&&getCookie(passwordStr)!=""){
    	$("#remember").attr("checked","checked");
        $("#username").val(getCookie(usernameStr));
        $("#password").val(getCookie(passwordStr));
       
    }
	
	 // 加载页面，给复选框一个点击事件
    $("#remember").click(function(){
        var ischeck=$(this).is(":checked"); 
        var loginVal = "";
        var passwordVal = "";
        // 判断是否选中
        if(ischeck){
            loginVal = $("#username").val();
            passwordVal = $("#password").val();
        }
        // 设置cookie
        setCookie(usernameStr,loginVal);
        setCookie(passwordStr,passwordVal);
    });
});
</script>	
<script type="text/javascript">
	//获取验证码
	function getCode(){
		  var url = '<%=basePath%>code.jsp?tm='+Math.random();
		  $("#imgg").attr("src",url);
	}
</script>
</html>>