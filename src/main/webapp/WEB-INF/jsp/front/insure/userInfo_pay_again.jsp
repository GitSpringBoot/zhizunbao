<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>         
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>用户重新支付</title>
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>styles/insurance/css/book.css">
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
    	<div style="float:left;margin:-38px 0 0 423px">
    		<div style="position: relative; margin-left: 17px">
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
     <div class="paybox_main">
        <div class="titlebox">
            <span class="fr">支付金额：<em>${insure.insurePrice }元</em></span>
            <h2>产品名称：${insure.insureName }</h2>
        </div>
        <ul class="tabbox" id="tabbox">
            <li class="on">银行卡</li>
        </ul>
        <div class="conbox" id="payConbox">
            <!--储蓄卡-->
            <div class="con  active">
                <ul class="paylist fix">
                	<li class="banks BOCB2C"><input type="hidden" name="pd_FrpId" value="BOC-NET-B2C"></li>
                	<li class="banks POSTGC"><input type="hidden" name="pd_FrpId" value="POST-NET-B2C"></li>
                    <li class="banks CMB"><input type="hidden" name="pd_FrpId" value="CCB-NET"></li>
                    <li class="banks ICBCB2C"><input type="hidden" name="pd_FrpId" value="ICBC-NET"></li>
                    <li class="banks CCB"><input type="hidden" name="pd_FrpId" value="CMBCHINA-NET"></li>
                    <li class="banks ABC"><input type="hidden" name="pd_FrpId" value="ABC-NET"></li>
                    <li class="banks COMM"><input type="hidden" name="pd_FrpId" value="BOCO-NET"></li>
                    <li class="banks SPDB"><input type="hidden" name="pd_FrpId" value="SPDB-NET"></li>
                	<li class="banks CMBC"><input type="hidden" name="pd_FrpId" value="CMBC-NET-B2C"></li>
                </ul>
            </div>
        </div>
        <!--button-->
        <div class="paybtn fix" id="paybtn">
            <a href="javascript:;" onclick="Buy();" class="btn">立即支付</a>
            <span class="error"></span>
        </div>
        <!--常见问题-->
        <div class="ansBox">
            <h4><a href="#" target="_blank">咨询客服</a>常见问题</h4>
            <ol>
                <li>
                    <p>什么时候可以使用信用卡分期付款？</p>
                    当需支付金额满500元时，您可以选择信用卡分期付款，小于500元的不可使用。
                </li>
                <li>
                    <p>信用卡分期付相比其他支付方式有什么优点？</p>
                    无论您选择分3期、6期、还是12期，所支付的总额都是应付款金额，不需要支付手续费。
                </li>
                <li>
                    <p>信用卡分期付款支持哪些银行？</p>
                    暂时仅支持中国建设银行，其他银行的信用卡分期付也在积极对接中，为用户提供更多优惠和便利。敬请期待！
                </li>
                <li>
                    <p>我使用了信用卡分期支付，为什么一次性扣除了所有的费用？</p>
                    采用信用卡分期支付，会根据订单金额一次性扣除您信用卡中的信用额度，根据您的还款期数分期恢复相应还款金额的信用额度。
                </li>
                <li>
                    <p>购买不同的保险可以合并订单进行分期付款吗？</p>
                    不可以。分期付款只对应一张订单中的一份保险。
                </li>
                <li>
                    <p>使用信用卡分期付款后申请退保，资金退还到哪里？多久能退还？</p>
                    申请退保后的资金仍按原渠道退还到您的信用卡中，在您提交退保要求后，我们会在1个工作日内处理完成（节假日顺延）并提交给银行，一般情况下会在5个工作日内到账，但由于退款交易中涉及商户、银行以及信用卡组织处理环节较多，各环节的处理速度都会对到账时间造成影响，请您谅解。

                </li>
            </ol>
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
</div>
</body>
<script src="<%=basePath %>styles/insurance/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">
$(function(){
    var $tabBox=$("#tabbox");
    var $payBox=$("#payConbox");
    var $payList=$payBox.find("ul.paylist");
    $tabBox.find("li").click(function(){
        index=$(this).index();
        $(this).addClass("on").siblings().removeClass("on");
        $payBox.find("div.con").eq(index).addClass("active").siblings().removeClass("active");
    });
    $payList.find("li").click(function(){
        $(this).addClass("on").siblings().removeClass("on");
    });
});
function Buy(){
	//alert(1);
/* 	var i =$("li[class$='on']").map(function(){
		
		return this.value;
	}).get().join();
	//alert(i);
	//i=i.substring(2);
	alert(i); */
	var payType = $("li[class$='on']>input").val();
	var insureId=${insure.insureId};
	var money=${insure.insurePrice};
	var status = ${userInsure.insureStatus};
	var id=${userInsure.id};
	//alert(typeof(id));
	if(payType==null || payType==""){
		$("span[class='error']").text("选择支付银行");
		return false;
	}else{
		$("span[class='error']").empty();
		//alert(payType+"  "+insureId+" "+money);
		if(status==null || status==""){
			location = "<%=basePath%>frontBuy/pay?pd_FrpId="+payType+"&insureId="+insureId+"&insurePrice="+money;
		}else{
			if(status==1){
			location = "<%=basePath%>frontBuy/payAgain?pd_FrpId="+payType+"&insureId="+insureId+"&insurePrice="+money+"&id="+id;
			}if(status==2){
				alert("订单已经支付，不能重复支付！！");
				return false;
				<%--  location = "<%=basePath%>home/page"; --%>
			}else{
				return false;
				<%-- location = "<%=basePath%>home/page"; --%>
			}
		}
	}
}
</script>
</html>