<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <%@ include file="/styles/ztree/common/admin_styles_css.jsp" %>
    <link rel="stylesheet" href="<%=basePath %>styles/behind/hui/ZTree/css/demo.css" type="text/css">
	<link rel="stylesheet" href="<%=basePath %>styles/behind/hui/ZTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	
    <title>分配权限</title>
	</head>
  <body>
  <article class="page-container">
	<form style="width:650px" action="<%=basePath%>role/updateRole" class="form form-horizontal" id="Form" method="post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>分配权限：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="hidden" name="roleId" id="roleId" value="${role.roleId }">
				<ul id="treeDemo" class="ztree"></ul>
					<%-- <li>${jsonString}</li> --%>
			</div>
		</div>
		<br><hr>
		 <div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;修改&nbsp;&nbsp;" onclick="assignResources()" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn btn-success radius" type="button" value="&nbsp;&nbsp;返回&nbsp;&nbsp;" onclick="closeLayer()" />
			</div>
		</div>
	</form>
 <%@ include file="/styles/ztree/common/admin_styles_js.jsp" %> 
 	<script type="text/javascript" src="<%=basePath %>styles/behind/hui/ZTree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="<%=basePath %>styles/behind/hui/ZTree/js/jquery.ztree.excheck.js"></script> 
  	<script type="text/javascript">
 // 初始化一些参数
	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

	// 数据
	var zNodes = ${jsonString} 
	/* [
		{ id:1, pId:0, name:"人员管理", open:true,checked:false},
		{ id:11, pId:1, name:"人员列表"},
		{ id:12, pId:1, name:"角色列表"},
		{ id:13, pId:1, name:"权限列表"},
		{ id:2, pId:0, name:"仓库管理", open:true},
		{ id:21, pId:2, name:"仓库列表"},
		{ id:22, pId:2, name:"地区列表"},
		{ id:23, pId:2, name:"商品列表"}
	]; 
	 */
	
	// 页面加载树
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
	
	// 关闭窗口
	function closeLayer(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
        return true;
	}
	
	// 获取资源树上所有选中的权限
	function assignResources(){
		// 获取选中权限id
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getCheckedNodes(true);
		var redIds = "";
		for (var i = 0; i < nodes.length; i++) {
			redIds += nodes[i].id + ",";
		}
		redIds = redIds.substring(0, redIds.length-1);
		$.post(
			"<%=basePath %>role/assignResources",
			{
				"resIds":redIds,
				"roleId":$("#roleId").val()
			}, function(result){
				if(result>0){
					
				layer.confirm('权限分配成功', {
				  btn: ['确认'] //按钮
				}, function(){
					
					location="<%=basePath%>admin/toAdministrator";
					closeLayer(); // 关闭弹出框
				});
				}else{
					layer.alert("权限分配失败");
				}
			}
		)
	}
  	</script>
  </body>
</html>
