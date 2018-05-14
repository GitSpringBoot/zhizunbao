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
    <title>健康告知</title>
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
<%--     <div class="header_nav">
        <div class="main_width"  style="position: relative;right: 67px">
            <h1><a href="#" class="logo fl" style="position: relative;right:20px;">大特保保险官网-互联网保险服务平台</a></h1>
            <a style="float: right;margin-right: -155px" href="#" class="my_policy fr">我的保单</a>
            <div class="menuBox">
               <ul class="menu">
                <c:forEach items="${list }" var="nav">
                	<c:choose>
	                	<c:when test="${nav.navId==2}">
		                	<li class="special">
		               			<a href="<%=basePath %>${nav.navAdress }">${nav.navName }</a>
		                	</li>
	                	</c:when>
                	<c:otherwise>
                		<li>
               				<a href="<%=basePath %>${nav.navAdress }">${nav.navName }</a>
                		</li>
                	</c:otherwise>
                	</c:choose> 
                </c:forEach>
                </ul>
            </div>
        </div> --%>
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
    <div class="container health_notify">
        <h1>${insure.insureName }</h1>
        <div class="procedures">
            <img src="<%=basePath %>styles/insurance/images/book/roll01.jpg" alt="图片消失了">
        </div>
        <!--告知说明-->
        <div class="notify_box">
            <!--健康告知-->
            <h2>健康告知</h2>
            <p>
                1.您过去1年内是否发现健康检查异常（如血液、超声、影像检查、内镜、病理检查等）,过去2年内是否连续服药、住院或被要求进一步检查、手术或住院治疗?
            </p>
            <p>
                2.您过去两年内投保人身保险或健康保险时，是否被保险公司拒保、延期、加费或者附加相关条件承保?
            </p>
            <p>
                3.您目前或过往是否患有下列疾病：良、恶性肿瘤，白血病，2级或以上高血压（收缩压大于160mmHg，舒张压大于100mmHg），冠心病，心肌梗死，脑梗死，脑出血，风湿性心脏病，心功能不全二级以上，肾功能不全，肝炎，肝硬化，重型再障性贫血，系统性红斑狼疮，类风湿性关节炎，糖尿病，帕金森氏病，癫痫，精神病，先天性疾病，传染病，慢性阻塞性肺病、瘫痪?
            </p>
            <p>
                4.过去1年内您是否有下列症状：反复头痛、晕厥、胸痛、气急、紫绀、持续反复发热、抽搐、不明原因皮下出血点、咯血、反复呕吐、进食梗噎感或吞咽困难、呕血、浮肿、腹痛、黄疸、便血、血尿、蛋白尿、肿块、消瘦（体重减轻5公斤以上）
            </p>
            <p>
                5.您目前是否从事高危职业? 是否有参加飞行、潜水、滑水、漂流、跳伞、武术比赛、拳击比赛、赛车、蹦极、特技表演等危险运动的爱好？是否正计划到有战乱的国家工作或居住？
            </p>
            <p>
                6.您是否有智能障碍、躯体畸形或功能障碍？是否有言语、咀嚼、视力、听力等机能障碍？是否有酒精、药物滥用成瘾史以及使用毒品、镇静剂及其它违禁药物?
            </p>
            <p>
                7.2周岁以下儿童补充告知如下两点:
            </p>
            <p>
                &emsp;(a)您是否有出生孕周小于37周或出生体重低于2500g?
            </p>
            <p>
                &emsp;(b)您出生时是否有难产、呼吸窘迫、青紫婴儿、智能低下、唐氏综合症或其他先天性或遗传性疾病？
            </p>
            <p>
                8.您目前是否怀孕?（被保人为14周岁以上（含）女性时填写）
            </p>
            <p></p>
            <p class="special">请确认被保险人是否存在上述问题：</p>
            <div class="health_box">
                <a href="<%=basePath %>frontBuy/toBuyTwo?insureId=${insure.insureId }&insureName=${insure.insureName}" class="n">没问题</a>
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
</div>
</body>
<script src="<%=basePath %>styles/insurance/js/jquery-1.12.3.min.js"></script>
</html>