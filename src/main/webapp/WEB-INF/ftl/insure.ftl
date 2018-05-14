<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${insure.insureName }</title>
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
    <link rel="stylesheet" href="${basePath}styles/insurance/css/common.css">
    <link rel="stylesheet" href="${basePath}styles/insurance/css/detail.css">
</head>
<body>
<div class="wrapper">
    <!--------------------------------------header_user begin------------------------------------->
    <div class="header_user">
        <div class="main_width">
            <span class="tel">客服电话：400-663-6600（周一至周六 9:00-18:00）</span>
            <span class="fr">
                <#if userInfo1?? >
                	<span class="my_insurance"><a href="${basePath}userInfo/toUserinfoInsure">我的保险</a></span>
                	<span class="message"><a href="${basePath}userInfo/toUserinfoMessage">消息<em>${userInfo1.userMsg!''}</em></a></span>
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
	<!------------------------------------- end form section ---------------------->	
    <!----------------------------------------header_nav end-------------------------------------->
    <!--container-->
    <div class="center_container">
        <!--deal main-->
        <div class="detail_first main_width fix">
            <!--left-->
            <div class="first_left fl">
                <img src="${basePath}${insure.imgSrc}" alt="暂无图片" class="first_img">
            </div>
            <!--right-->
            <div class="first_right fl">
                <h2>${insure.insureName }</h2>
                <p class="note" style="font-size: 15px">${insure.insureContent }</p>
                <div class="first_info" id="firstInfo">
                <!--特点-->
                <ul class="first_list">
                    <li><b>适用人群：</b>${insure.people }</li>
                    <li><b>保障期限：</b>${insure.insureTimelimit }天</li>
                    <li><b>保单形式：</b>${insure.insureShape }</li>
                </ul>
                <dl class="price_box">
                        <dt>价  格：</dt>
                        <dd class="fix">
                            <div class="c_price">
                                <em>${insure.insurePrice }</em>元
                            </div>
                        </dd>
                    </dl>
                <div class="submit_box">
                    <a href="${basePath}frontBuy/toBuyOne?insureId=${insure.insureId}"  class="submit_buy">立即购买</a>
                    <a class="btn" href="javascript:;" onclick="collect('${insure.insureId}');">收藏该保险</a>                              
                                                  已售<em>${insure.insureNumber }</em>份
                </div>
                </div>
            </div>
        </div>
        <!--deal info-->
        <div class="detail_center">
            <!--menu-->
            <div class="detail_menu_box" id="detailMenuBox">
                <div class="detail_menu" id="detailMenu">
                    <div class="main_width">
                        <ul>
                            <li lab="description" class="active">
                                <a href="javascript:"><i></i>详细说明</a>
                            </li>
                            <li lab="custom">
                                <a href="javascript:"><i></i>客户评价</a>
                            </li>
                            <li lab="case">
                                <a href="javascript:"><i></i>案例</a>
                            </li>
                            <li lab="consult">
                                <a href="javascript:"><i></i>常见问题</a>
                            </li>
                        </ul>
                        <a href="${basePath}frontBuy/toBuyOne?insureId=${insure.insureId}" class="submit_buy">立即购买</a>
                    </div>
                </div>
            </div>
            <!--detail_info-->
            <div class="detail_info detail_introduction">
                <!--详细说明-->
                <div class="detail detail_description" style=" width:965px;margin:0 auto;padding: 20px;">
                    <h2 class="title_line"><i></i>产品特色</h2>
                    <#list insure.features as feature>
                    	<p style="line-height: 30px;font-size: 15px">${feature_index+1}、${feature.featureContent }</p>
                    </#list>
                    <h2 class="title_line"><i></i>保障责任</h2>
                    <div class="con">
                        <table class="tab1" border="1" cellpadding="1" cellspacing="1">
                            <thead>
                                <tr>
                                    <th style="width: 180px;">保障项目</th>
                                    <th style="width: 80px;">保障</th>
                                    <th>说明</th>
                                </tr>
                            </thead>
                            <tbody>
                              <#list insure.safeGuards as safeGuard>
                                <tr>
                                    <td>${safeGuard.safeguardProject }</td>
                                    <td>${safeGuard.safeguardMoney }</td>
                                    <td style="text-align: left">
                                    <p>${safeGuard.safeguardScope }</p>
                                    </td>
                                </tr>
                              </#list>  
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--客户评价-->
                <div class="detail detail_info main_width">
                    <div class="custom" id="custom">
                        <h2 class="title_line">
                            <i></i>
                            客户评价
                        </h2>
                        <ul class="custom_list" id="customList">
                        <#list comment as com>
                            <li class="fix">
                                <div class="tit">
                                    <img src="${basePath}styles/insurance/images/detail_imgs/costom-tx.jpg" class="fl" alt="">
                                    <span class="fr">${com.commentDate!''}</span>
                                    <p>${com.userName!''}</p>
                                </div>
                                <p>【评价】：${com.commentContent!''}</p>
                            </li>
                           </#list>
                        </ul>
                       <div class="custom_page" id="custom_page">
                           <#if page.currentPage != 1>
				                  <a class="prev" onclick="fenye(${page.prevPage});">上一页</a>
				           </#if>
				           <#if page.lastPage != 1 && page.lastPage !=0>   
			              	<#list 1..page.lastPage as n>
				                  <#if page.currentPage ==n >
					                  	<a class="current" href="javascript:;" onclick="fenye(${n});">${n}</a>
					                  <#else>
					                  	<a href="javascript:;" onclick="fenye(${n});">${n}</a>
				                  </#if>
			                 </#list>
			                </#if>
			               <#if page.currentPage != page.lastPage && page.currentPage != 1>		
			               		<a href="javascript:;" onclick="fenye(${page.nextPage});" class="next">下一页</a>
			              </#if>
                       </div>
                       <!-- ---------------------用户添加评论 start---------------------------------------- -->
                       <form id="myForm" action="${basePath}pinglun/addPinglun" method="post">
                       	<input type="hidden" name="insureId" value="${insure.insureId }">
                       <div class="margin clearfix">
						 <div class="article_style">
						    <div class="add_content" id="form-article-add">
						     <ul>
						      <li class="clearfix"><label class="label_name">填写评论：</label>
						      <span class="formControls col-10">
						      	<script name="pinglun" id="editor" type="text/plain" style="width:850px;height:400px; margin-left:10px;"></script> 
						      </span>
						      </li>
						     </ul>
						    <div class="Button_operation">
								<button class="btn btn-primary radius" type="submit">保存并提交</button>
								<button onclick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
							</div>
						    </div>
						 </div>
						</div>
						</form>
                       <!-- ---------------------用户添加评论 end---------------------------------------- -->
                    </div>
                </div>
        <!--         理赔
                <div class="detail detail_info detail_claim">
                   
                </div> -->
                <!--案例-->
                <div class="detail detail_info detail_case">
                    <div class="pro_content">
                        <h2>【腾讯新闻】六旬老人按摩美容后四根肋骨骨折 被判担责5成</h2>
                        <a href="#" target="_blank">http://news.qq.com/a/20140714/024688.html</a>
                        <p>老人按个摩居然肋骨骨折</p>
                        <p>
                            小编评语：上了年纪的人多少会有骨质疏松，不小心摔跤，撞一下就有可能导致骨折，不光遭罪，医药费也不少，买一份
                            <span class="bold">【大特保-史带】个人意外伤害险</span>，最高1万元的医疗保险费用，一般足够解决大多数医药费。
                        </p>
                        <span class="ri_bg"></span>
                    </div>
                </div>
                <!--购买咨询-->
                <div class="detail detail_info detail_consult">
                    <div class="consult_box conline_box">
                        <ul class="questBox">
                            <li>
                                <div class="ans fix">
                                    <span>2016-05-10 13:50:03 </span>
                                    <h2>打疫苗导致的并发症也是意外伤害吗?</h2>
                                </div>
                                <p class="qus">
                                    您好，这种情况是不包含在该产品的保障责任内的，该款产品在责任免除中提出被保险人因医疗事故或药物过敏导致的伤害不在保障范围内，感谢您对大特保的支持！
                                </p>
                            </li>
                            <li>
                                <div class="ans fix">
                                    <span>2016-05-10 13:50:03 </span>
                                    <h2>打疫苗导致的并发症也是意外伤害吗?</h2>
                                </div>
                                <p class="qus">
                                    您好，这种情况是不包含在该产品的保障责任内的，该款产品在责任免除中提出被保险人因医疗事故或药物过敏导致的伤害不在保障范围内，感谢您对大特保的支持！
                                </p>
                            </li>
                            <li>
                                <div class="ans fix">
                                    <span>2016-05-10 13:50:03 </span>
                                    <h2>打疫苗导致的并发症也是意外伤害吗?</h2>
                                </div>
                                <p class="qus">
                                    您好，这种情况是不包含在该产品的保障责任内的，该款产品在责任免除中提出被保险人因医疗事故或药物过敏导致的伤害不在保障范围内，感谢您对大特保的支持！
                                </p>
                            </li>
                            <li>
                                <div class="ans fix">
                                    <span>2016-05-10 13:50:03 </span>
                                    <h2>打疫苗导致的并发症也是意外伤害吗?</h2>
                                </div>
                                <p class="qus">
                                    您好，这种情况是不包含在该产品的保障责任内的，该款产品在责任免除中提出被保险人因医疗事故或药物过敏导致的伤害不在保障范围内，感谢您对大特保的支持！
                                </p>
                            </li>
                            <li>
                                <div class="ans fix">
                                    <span>2016-05-10 13:50:03 </span>
                                    <h2>打疫苗导致的并发症也是意外伤害吗?</h2>
                                </div>
                                <p class="qus">
                                    您好，这种情况是不包含在该产品的保障责任内的，该款产品在责任免除中提出被保险人因医疗事故或药物过敏导致的伤害不在保障范围内，感谢您对大特保的支持！
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
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
    <!--footer end-->
    <div class="sideBar">
        <a href="#" class="slider_block app"><i></i></a>
        <a href="#" class="slider_block jimi"><i></i></a>
        <a href="#" class="slider_block feedback"><i></i></a>
        <a href="javascript:" class="slider_block backtop" id="backtop"><i></i></a>
    </div>
</div>
<script src="${basePath}styles/insurance/js/jquery-1.12.3.min.js"></script>
<script src="${basePath}styles/insurance/laydate/laydate.js"></script>
<script src="${basePath}styles/insurance/js/detail.js"></script>
<script src="${basePath}/styles/behind/js/jquery-1.9.1.min.js"></script>
<script src="${basePath}/styles/behind/assets/js/bootstrap.min.js"></script>
<script
	src="${basePath}/styles/behind/assets/js/typeahead-bs2.min.js"></script>
<script src="${basePath}/styles/behind/assets/layer/layer.js"
	type="text/javascript"></script>
<script src="${basePath}/styles/behind/assets/laydate/laydate.js"
	type="text/javascript"></script>
<script src="${basePath}/styles/behind/js/H-ui.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${basePath}/styles/behind/Widget/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript"
	src="${basePath}/styles/behind/Widget/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript"
	src="${basePath}/styles/behind/Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script src="${basePath}styles/insurance/layer/layer.js" type="text/javascript"></script>	
<script type="text/javascript">
/**提交操作**/
function article_save_submit(){
	     var num=0;
		 var str="";
     $(".Mandatory input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("erro")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,	
				
          }); 
		    num++; 
		    return false;
          } else{
        	  var url = "${basePath}pinglun/addPinglun";
      		
      	/* 	$.post(url,$("#myForm").serialize(),function(i){
      			if(i==1){
      				 layer.alert('添加成功！',{
      	               title: '提示框',				
      				icon:1,		
      				  });
      				 location.reload();
      			}else{
      				layer.alert('添加失败！',{
       	               title: '提示框',				
       				icon:1,		
       				  });
      			}
      		}) */
          }
		 });
          					
	}
$(function(){
	var ue = UE.getEditor('editor');
});
/**日期选择**/
var start = {
    elem: '#start',
    format: 'YYYY/MM/DD',
    min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};
var end = {
    elem: '#end',
    format: 'YYYY/MM/DD',
    min: laydate.now(),
    max: '2099-06-16 ',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
</script>
<script type="text/javascript">
	function fenye(page){
		var insureId =${insure.insureId};
		location = "${basePath}frontInsure/findInsureByInsureIdFree?insureId="+insureId+"&currentPage="+page;
	}
	
	//收藏保险
	function collect(insureId){
		layer.alert(insureId);
		location="${basePath}userInfo/userCollect?insureId="+insureId;
	}
</script>
</body>
</html>