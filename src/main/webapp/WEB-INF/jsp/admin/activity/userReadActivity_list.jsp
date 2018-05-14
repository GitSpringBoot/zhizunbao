<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
         <link href="<%=basePath %>styles/behind/assets/css/bootstrap.min.css" rel="stylesheet" />
         <link href="<%=basePath %>styles/behind/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=basePath %>styles/behind/css/style.css"/>       
        <link href="<%=basePath %>styles/behind/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=basePath %>styles/behind/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=basePath %>styles/behind/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath %>styles/behind/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="<%=basePath %>styles/behind/js/jquery-1.9.1.min.js"></script>
        <script src="<%=basePath %>styles/behind/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>styles/behind/Widget/Validform/5.3.2/Validform.min.js"></script>
		<script src="<%=basePath %>styles/behind/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="<%=basePath %>styles/behind/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=basePath %>styles/behind/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="<%=basePath %>styles/behind/assets/layer/layer.js" type="text/javascript" ></script>          
		<script src="<%=basePath %>styles/behind/js/lrtk.js" type="text/javascript" ></script>
         <script src="<%=basePath %>styles/behind/assets/layer/layer.js" type="text/javascript"></script>	
        <script src="<%=basePath %>styles/behind/assets/laydate/laydate.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery/1.9.1/jquery.min.js"></script> 
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/icheck/jquery.icheck.min.js"></script> 
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/js/H-ui.admin.js"></script> 
		<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
		<!-- 公共资源CSS  -->
		<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/lib/Hui-iconfont/1.0.7/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/lib/icheck/icheck.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/css/style.css" />
<!-- My97 -->
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/My97DatePicker/WdatePicker.js"></script>
<!-- 表单校验 -->
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/js/Validform_v5.3.2_min.js"></script>

<script type="text/javascript" src="<%=basePath %>styles/behind/hui/js/ajaxfileupload.js"></script>
<title>活动用户查阅管理</title>


</head>

<body>
<div class="page-content clearfix">
  <div class="administrator">
       <div class="d_Confirm_Order_style">
    <div class="search_style">
     
      
    </div>
   
     <div class="margin clearfix">
		
		<div class="compete_list">
			<table id="sample-table-1"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="60px">序号</th>
						<th width="220px">活动标题</th>
						<th>活动内容</th>
						<th width="130px">查阅用户</th>
					</tr>
				</thead>
					<tbody>
				<c:forEach items="${userReadActivityList}" var="u" varStatus="l">
						<tr>
						    <td>${l.count }</td>
							<td>${u.readTitle}</td>
							<td>
								<div style="height:90px ;overflow: auto;">
								${u.readContent}
								</div>
							</td>
							<td>
							   <c:forEach items="${u.ulist }" var="l" varStatus="s">
							       <c:if test="${s.index>0 }">,</c:if>
      	                              ${l.userName }
							   </c:forEach>
							</td>
						</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
  </div>
</div>


 </div>
</body>
</html>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample_table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			});

</script>
<script type="text/javascript">
$(function() { 
	$("#administrator").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		spacingw:50,//设置隐藏时的距离
	    spacingh:270,//设置显示时间距
	});
});

//初始化宽度、高度  
 $(".widget-box").height($(window).height()-215); 
$(".table_menu_list").width($(window).width()-260);
 $(".table_menu_list").height($(window).height()-215);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".widget-box").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-260);
	  $(".table_menu_list").height($(window).height()-215);
	})
 laydate({
    elem: '#start',
    event: 'focus' 
});



/*产品-编辑*/
function member_edit(title,url,disId,w,h){
	location = url + "?disId=" + disId;
	
}

/*产品-删除*/
 function member_del(obj,disId){
	
	layer.confirm("确定要删除 此活动吗?",function(index){
		var url = "<%=basePath%>discounts/deleteDiscounts";
		 var params = {};
		params.disId = disId;
		$.post(url,params,function(i){
			if(i > 0){
				layer.msg('已删除!',{icon:1,time:1000});
				 location.reload();
			}else{
				layer.msg('删除失败!',{icon:1,time:1000});
			}
		});  
	})   
}	

</script>
