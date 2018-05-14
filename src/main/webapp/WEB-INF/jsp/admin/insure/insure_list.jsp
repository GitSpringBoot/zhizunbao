<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/styles/common/behind/cssStyle.jsp" %>
</head>
<body>
<div class="page-content clearfix">
  <div id="brand_style">
   <!--  <div class="search_style">
     
      <ul class="search_content clearfix">
       <li><label class="l_f">保险名称</label><input name="" type="text"  class="text_add" placeholder="输入保险名称"  style=" width:250px"/></li>
       <li><label class="l_f">添加时间</label><input class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
       <li><select name="" class="text_add"><option  value="1">旅游保险</option><option value="2">个人保险</option></select></li>
       <li style="width:90px;"><button type="button" class="btn_search"><i class="icon-search"></i>查询</button></li>
      </ul>
    </div> -->
     <div class="border clearfix">
       <span class="l_f">
        <a href="<%=basePath%>/insure/toAddInsture"  title="添加保险" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加保险</a>
       <!--  <a href="javascript:void()" class="btn btn-info">旅游保险</a>
        <a href="javascript:void()" class="btn btn-success">个人保险</a> -->
       </span>
     </div>
     <!--保险展示-->
     <!-- <div class="brand_list clearfix" id="category">
     <div class="show_btn" id="rightArrow"><span></span></div>
     <div class="chart_style side_content">
     <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
         <div id="main" style="height:300px;" class="side_list"></div>
     </div> --> 
     <!--保险列表-->
      <div>
       <table class="table table-striped table-bordered table-hover" id="sample-table">
		<thead>
		 <tr>
				<th><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
				<th width="80px">编号</th>
				<th width="80px">保险名称</th>
				<th width="120px">保险图片</th>
				<th width="180px">保障期限(天)</th>
				<th width="400px">保险简介</th>
				<th width="150px">适用人群</th>
				<th width="200px">投保人数(个)</th>
				<th width="200px">保险价格(元)</th>                
				<th width="260px">保单形式</th>                
				<th width="240px">操作</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach items="${insureList }" var="i" varStatus="n">
		<tr>
          <td width="25px"><label><input type="checkbox" class="ace"  name="ck" value="${i.insureId }"><span class="lbl"></span></label></td>
          <td width="80px">${n.count }</td>
          <td width="80px">${i.insureName }</td>
          <td><img src="<%=basePath%>${i.imgSrc}"  width="130" alt="找不到相应的图片"/></td>
          <td>${i.insureTimelimit }</td>
          <td class="text-l">${i.insureContent }</td>
          <td>${i.people }</td>
          <td>${i.insureNumber }</td>
          <td>${i.insurePrice }</td>
          <td>${i.insureShape }</td>
          <td class="td-manage">
          <a title="编辑" onclick="member_edit('修改','<%=basePath %>insure/toUpdateInsure','${i.insureId }','900','900')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a> 
          <a title="上传图片" onclick="edit('上传图片','<%=basePath %>insure/toUploadImg','${i.insureId }','${i.insureName }','700','700')" href="javascript:;"  class="btn btn-xs btn-info" >&nbsp;<i class="glyphicon glyphicon-open"></i></a> 
          <a title="删除" href="javascript:;"  onclick="member_del(this,'${i.insureId }','${i.insureName }')" class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
          </td>
		</tr>
      </c:forEach>  
        </tbody>
        </table>
        </div>
     </div>
    
  </div>
	
</body>
</html>
<%@include file="/styles/common/behind/jsStyle.jsp" %>
<script type="text/javascript">
	//添加图片
	function edit(title,url,insureId,insureName,w,h){
		url = url + "?insureId=" + insureId+"&insureName="+insureName;
		layer_show(title,url,w,h);
	}
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6,9,10]}// 制定列不参与排序
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


//初始化宽度、高度  
 $(".chart_style").height($(window).height()-215);
  $(".table_menu_list").height($(window).height()-215);
  $(".table_menu_list ").width($(window).width()-440);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	 $(".chart_style").height($(window).height()-215);
	 $(".table_menu_list").height($(window).height()-215);
	 $(".table_menu_list").width($(window).width()-440);
	});	
	//图层隐藏限时参数		 
$(function() { 
	$("#category").fix({
		float : 'left',
		//minStatue : true,
		skin : 'green',	
		durationTime :false,
		stylewidth:'400',
		spacingw:30,//设置隐藏时的距离
	    spacingh:440,//设置显示时间距
	});
});
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form ,.brond_name').on('click', function(){
	var cname = $(this).attr("title");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe span').html(cname);
	parent.$('#parentIframe').css("display","inline-block");
    parent.$('.Current_page').attr("name",herf).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
    parent.layer.close(index);
	
});
function generateOrders(id){
	window.location.href = "Brand_detailed.html?="+id;
};
/*保险-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*保险-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="icon-ok bigger-120"></i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});
	});
}
/*保险-修改*/
function member_edit(title,url,insureId,w,h){
	url = url + "?insureId=" + insureId;
	/* layer_show(title,url,w,h); */
	location = url;
}

/*保险-删除*/
function member_del(obj,insureId,insureName){
	layer.confirm("确定要删除  <span style='color:red'>" + insureName + "</span> 保险吗?",function(index){
		var url = "<%=basePath%>insure/deleteInsure";
		var params = {};
		params.insureId = insureId;
		$.post(url,params,function(result){
			if(result > 0){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			}else{
				layer.msg('删除失败!',{icon:1,time:1000});
			}
		});
	});
}
/* laydate({
    elem: '#start',
    event: 'focus' 
}); */


</script>