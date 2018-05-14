<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="/styles/common/behind/cssStyle.jsp" %>	
	<title>分类管理</title>
</head>
<body>
<body>
 <div class="margin clearfix">
   <div class="border clearfix">
       <span class="l_f">
        <a title="添加类型" onclick="member_add('添加类型','<%=basePath %>insure/toAddType','500','500')" href="javascript:;" class="btn btn-warning"><i class="fa fa-plus"></i> 添加类型</a>
       </span>
     </div>
     <div class="compete_list">
       <table id="sample-table-1" class="table table-striped table-bordered table-hover">
		 <thead>
			<tr>
			  <th>序号</th>
			  <th>分类名称</th>
              <th>所属分类</th>
			  <th width="150px">操作</th>
             </tr>
		    </thead>
             <tbody>
	             <c:forEach items="${typeList }" var="t" varStatus="n">
					  <tr>
						<td>${n.count }</td>
						<td class="hidden-480">${t.typeName}</td>
						<td>${t.pname }</td>
						<td>
							 <c:if test="${t.pid!=null }">
				                 <a title="修改类型" onclick="member_modify('修改类型','<%=basePath %>insure/toUpdateType','${t.typeId }','500','500')" href="javascript:;" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>        
				                 <a title="删除" href="javascript:;"  onclick="Competence_del(this,'${t.typeId}','${t.typeName }')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
							 </c:if>
						</td>
					   </tr>
				  </c:forEach> 												
		      </tbody>
	        </table>
     </div>
 </div>
</body>
<%@include file="/styles/common/behind/jsStyle.jsp" %>	
</html>
<script type="text/javascript">
/*分类-新增*/
function member_add(title,url,w,h){
	/* url = url + "?insureId=" + insureId; */
	layer_show(title,url,w,h);
	
}
 /*分类-删除*/
function Competence_del(obj,typeId,typeName){
	layer.confirm("确定要删除  <span style='color:red'>" + typeName + "</span> 类型吗?",function(index){
		var url = "<%=basePath%>insure/deleteType";
		var params = {};
		params.typeId = typeId;
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
/*修改分类*/
function member_modify(title,url,typeId,w,h){
	url = url + "?typeId=" + typeId; 
	layer_show(title,url,w,h);
	
}	

//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form ,#Competence_add').on('click', function(){
	var cname = $(this).attr("title");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe span').html(cname);
	parent.$('#parentIframe').css("display","inline-block");
    parent.$('.Current_page').attr("name",herf).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+">" + cnames + "</a>");
    parent.layer.close(index);
	
});
</script>