<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>联系我们</title>
<link rel="stylesheet" href="<%=basePath%>styles/insurance/css/common.css">
<link rel="stylesheet" href="<%=basePath%>styles/insurance/css/book.css">
<link rel="shortcut icon" href="favicon.ico">

<!-- include main css -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>styles/map/css/slick.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>styles/map/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>styles/map/css/jquery.mmenu.all.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>styles/map/css/style.css" />
<link rel="stylesheet" href="<%=basePath%>styles/map/css/animates.css" />
</head>
<body>
<div class="wrapper">
    <!--------------------------------------header_user begin------------------------------------->
    <div class="header_user">
        <div class="main_width">
            <font class="tel">客服电话：185-1566-9606（周一至周六 9:00-18:00）</font>
            <font class="fr">
                <c:if test="${userInfo1!=null }">
	                <font class="my_insurance" style="padding:4px 24px 2px 18px">
	                	<a href="<%=basePath%>userInfo/toUserinfoInsure">我的保险</a>
	                </font>
	                <font class="message" style="padding:4px 24px 2px 18px">
	                	<a href="<%=basePath%>userInfo/toUserinfoMessage">消息<em style="color: #fea526;font-weight: bold;margin: 0 3px;font-family: '宋体',sans-serif;">${userInfo1.userMsg }</em></a>
	                </font>
					<font>欢迎，${userInfo1.userName }</font>
					<a href="<%=basePath%>userInfo/userInvalidate?user_id=${userInfo1.userId }">注销登录</a>
				</c:if>
				<c:if test="${userInfo1==null }">
						 <font class="register" style="padding:4px 0 2px 18px"><a href="<%=basePath%>userInfo/toUserRegister">注册</a></font>
               			 <font class="fg"><a href="#"> &nbsp;|&nbsp; </a></font>
               			 <font><a href="<%=basePath%>userInfo/toUserLogin">登录</a></font>
				</c:if>
            </font>
        </div>
    </div>
    <!---------------------------------------header_user end-------------------------------------->
    <!---------------------------------------header_nav begin------------------------------------->
    <div class="header_nav">
        <div class="main_width"  style="position: relative;right: 67px">
            <h1><a href="#" class="logo fl" style="position: relative;right:20px;">大特保保险官网-互联网保险服务平台</a></h1>
            <a style="float: right;margin-right: -136px;width:117px; " href="<%=basePath%>userInfo/toUserinfoInsure" class="my_policy fr">我的保单</a>
            <div class="menuBox" style="overflow: inherit;">
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
    		<div style="position: relative;margin:34px 0 0 0;">
	           <form id="myForm" action="<%=basePath %>frontInsure/findInsureListByName" method="post">
	           		<input type="hidden" name="currentPage" id="cur">
	           		<input value="请输入关键字" onkeydown="if(event &amp;&amp; event.keyCode==13){search();}" onfocus=" if(this.value=='请输入关键字'){this.value=''; this.style.color='#ABA9A9';} " onblur="if(this.value==''|| this.value=='请输入关键字'){this.value='请输入关键字';}"
	           		style="color:#ABA9A9;position:absolute;width: 209px;height:37px;border: 2px solid #ff8712;" type="text" name="chaxun">
	           		<input style="position: absolute;margin-left: 209px"  type="image"  src="<%=basePath%>styles/insurance/logo/sousuo.png"/>
	           	</form>		
           	</div>
        </div>        	
    </div>
	<!------------------------------------- end form section ---------------------->	
    <!----------------------------------------header_nav end-------------------------------------->
		<!--banner-->
	<section class="banner">
	   <img src="<%=basePath %>styles/behind/images/contactbanner.jpg" alt="" />
	</section>
	
	<!--内页面包屑-->
	
		<div class="container">
			您当前的位置：
			<a href="<%=basePath %>index.jsp">首页</a> > 
			<span>联系我们</span>
		</div>
	
		
		<div class="container health_notify">
			<div class="contacttit">
				<span>联系我们</span>
			</div>
			<!-- 地图  -->
			<div class="contacttxt">
				<p style="text-indent: 25px;">在保险行业领域，至尊保集团分别与阿里巴巴、京东、百度等知名公司达成战略伙伴关系，
				分别成立了中国人寿、泰康人寿、平安保险等不同领域的保险扩展平台。2015年6月，
				至尊保在美国硅谷成立投保中心，开拓海外保险业务；自成立至今至尊保集团已取得600多万个保险
				及客户，理赔客户高达500万人；同时，经过多年在保险领域的不要脸探索与积累，至尊保集团目前已获得
				海淀区保险小巨人企业、投保最信任企业、联合国认证企业、经济专家工作站、北京名牌企业等
				多项荣誉资质称号。</p>
			</div>
			<div>
				<ul class="contact_us clearfix">
					<li><b>电话</b> <a href="tel:021-12345678">(86)021-12345678</a>
					</li>
					<li><b>邮箱</b> <a href="mailto:1182944385@qq.com">1182944385@qq.com</a>
					</li>
					<li><b>地址</b> 北京市海淀区唐家岭东路北京八维研修学院</li>
					<li><b>手机</b> <a href="tel:182 2293 9560">(86)182 2293
							9560</a></li>
					<li><b>邮编</b> 034560</li>
				</ul>
			</div>
			<h2 align="center"
				style="font-family: 宋体; font-size: 40px; letter-spacing: 30px; margin-top: 10px;">
				<b>我们的位置</b>
			</h2>
			<div style="margin-top: 10px; width: 1190px; margin-left: -10px"
				id="map"></div>
		</div>
	<!--footer begin-->
	    <div class="copyright" style="padding-top:0;">
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
<script src="<%=basePath%>styles/insurance/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=6d88e38ab7f507ee19cec46443691d95"></script>
<!--Include Js-->
<script src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>

<!--移动端导航-->
<script src="<%=basePath%>styles/map/js/jquery.mmenu.all.min.js"
	type="text/javascript" charset="utf-8"></script>

<script src="<%=basePath%>styles/map/js/public.js"
	type="text/javascript" charset="utf-8"></script>

<!--slick-->
<script src="<%=basePath%>styles/map/js/slick.min.js"
	type="text/javascript" charset="utf-8"></script>

<!--placeholder-->
<script src="<%=basePath%>styles/map/js/jquery.placeholder.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){ $('input, textarea').placeholder(); });
</script>
<script type="text/javascript">

    // 百度地图API功能
    var map = new BMap.Map("map");    // 创建Map实例
    var point = new BMap.Point(116.306294,40.04698);   //坐标拾取网址：http://api.map.baidu.com/lbsapi/getpoint/index.html
    
    var marker = new BMap.Marker(point);  // 创建标注
    
    
    
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    
    marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    map.centerAndZoom(point, 18);  // 初始化地图,设置中心点坐标和地图级别
    map.addOverlay(marker);               // 将标注添加到地图中
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.setCurrentCity("上海");          // 设置地图显示的城市 此项是必须设置的
    
    
    
    window.onresize = function(){
        
        map.centerAndZoom(point, 15);  // 重置窗口的时候 重新获取中心点坐标的位置
        
    }
    
    /*
     * 若要开启全景模式，解注
     */
    
   var stCtrl = new BMap.PanoramaControl(); //构造全景控件
    map.addTileLayer(new BMap.PanoramaCoverageLayer());
    stCtrl.setOffset(new BMap.Size(20, 20));
    map.addControl(stCtrl);//添加全景控件
    

	
    
    //添加缩放控件
    map.addControl(top_left_control);        
    map.addControl(top_left_navigation);     
    /*map.addControl(top_right_navigation);  */  
	
	

</script>
</html>