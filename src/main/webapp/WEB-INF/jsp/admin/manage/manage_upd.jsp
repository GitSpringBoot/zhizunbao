<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="<%=basePath %>styles/behind/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=basePath %>styles/behind/css/style.css"/>       
        <link href="<%=basePath %>styles/behind/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=basePath %>styles/behind/assets/css/ace.min.css" />
        <link rel="stylesheet" href="<%=basePath %>styles/behind/font/css/font-awesome.min.css" />
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=basePath %>styles/behind/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="<%=basePath %>styles/behind/js/jquery-1.9.1.min.js"></script>
		<script src="<%=basePath %>styles/behind/assets/layer/layer.js" type="text/javascript" ></script>
        <script src="<%=basePath %>styles/behind/assets/laydate/laydate.js" type="text/javascript"></script>  
        <script src="<%=basePath %>styles/behind/assets/js/bootstrap.min.js"></script>
		<script src="<%=basePath %>styles/behind/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="<%=basePath %>styles/behind/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=basePath %>styles/behind/assets/js/jquery.dataTables.bootstrap.js"></script>
                      
<title>个人信息管理</title>
</head>

<body>
<div class="clearfix">
 <div class="admin_info_style">
   <div class="admin_modify_style" id="Personal" style="width: 100%; height: 100%;">
     <div class="type_title">管理员信息 </div>
      <form id="myForm" action="" method="post">
          <div class="xinxi">
      <input type="hidden" name="manageId" id="website-title" value="${manage.manageId }" class="col-xs-7 text_info" disabled="disabled">
        <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">登录名： </label>
          <div class="col-sm-9"><input type="text" name=username id="website-title" value="${manage.username }" class="col-xs-7 text_info" disabled="disabled">
          &nbsp;&nbsp;&nbsp;</div>
          </div>
        <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">姓名： </label>
          <div class="col-sm-9"><input type="text" name=realName id="website-title" value="${manage.realName }" class="col-xs-7 text_info" disabled="disabled">
          &nbsp;&nbsp;&nbsp;</div>
          </div>
        <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">密码： </label>
          <div class="col-sm-9"><input type="password" name=password id="website-title" value="${manage.password }" class="col-xs-7 text_info" disabled="disabled">
          &nbsp;&nbsp;&nbsp;</div>
          </div>
        <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">生日： </label>
          <div class="col-sm-9">
          
          <input type="text" name=manageBirthday id="website-title" value="${manage.manageBirthday }" class="col-xs-7 text_info" disabled="disabled">
          &nbsp;&nbsp;&nbsp;</div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">性别： </label>
          <div class="col-sm-9">
          <span class="sex">${manage.manageSex==0 ? '女':'男' }</span>
            <div class="add_sex">
           
            <label><input name="manageSex" type="radio" value="1" class="ace" <c:if test="${manage.manageSex==1}"> checked="checked"</c:if>><span class="lbl">男</span></label>&nbsp;&nbsp;
            <label><input name="manageSex" type="radio" value="0" class="ace" <c:if test="${manage.manageSex==0}">checked="checked"</c:if>><span class="lbl">女</span></label>
            </div>
           </div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">身份证： </label>
          <div class="col-sm-9"><input type="text" name="manageCard" id="website-title" value="${manage.manageCard }" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">移动电话： </label>
          <div class="col-sm-9"><input type="text" name="manageTel" id="website-title" value="${manage.manageTel }" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
          <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">电子邮箱： </label>
          <div class="col-sm-9"><input type="text" name="manageEmail" id="website-title" value="${manage.manageEmail }" class="col-xs-7 text_info" disabled="disabled"></div>
          </div>
           <c:if test="${sessionScope.man.roleId==1 }">
           <div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="form-field-1">角色： </label>
          <div class="col-sm-9">
          <select class="col-xs-7 text_info" disabled="disabled" name="roleId" size="1" id="website-title">
					<c:forEach items="${roleList }" var="roleList">
					<option value="${roleList.roleId }" <c:if test="${roleList.roleId==manage.roleId }">selected</c:if> >${roleList.roleName }</option>					
					</c:forEach>
				</select>
          </div>
          </div>
          </c:if>
           <div class="Button_operation clearfix"> 
				<button onclick="modify();" class="btn btn-danger radius" type="button">修改信息</button>				
				<button onclick="save_info('${manage.realName }','${manage.password}');" class="btn btn-success radius" type="button">保存修改</button>              
			</div>
            </div>
      </form>
    </div>
    
 </div>
</div>
 
</body>
</html>
<script>

 //按钮点击事件
function modify(){
	 $('.text_info').attr("disabled", false);
	 $('.text_info').addClass("add");
	  $('#Personal').find('.xinxi').addClass("hover");
	  $('#Personal').find('.btn-success').css({'display':'block'});
	};
function save_info(realName,password){
	
layer.confirm("确定要更改姓名为  <span style='color:red'>【" + realName + "】</span>  人员信息吗?",function(index){
		
		var url = "<%=basePath %>manage/updateManage";
		
		$.post(url,$("#myForm").serialize(),function(i){
			  if(i==0){ layer.alert('修改失败！',{
	               title: '提示框',				
				   icon:2,			   		
				  });
				  $('#Personal').find('.xinxi').removeClass("hover");
				  $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
				  $('#Personal').find('.btn-success').css({'display':'none'});
				   layer.close(index); return false;}	 	
	          else{
	        	 
				   layer.alert('修改成功！',{
	               title: '提示框',				
				   icon:1,			   		
				  });
				   location.href="<%=basePath %>manage/toAdmin_manage";
				  $('#Personal').find('.xinxi').removeClass("hover");
				  $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
				  $('#Personal').find('.btn-success').css({'display':'none'});
				   layer.close(index);
				   
			  }		  		
		
	});
})
	
	};	
 //初始化宽度、高度    
    $(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
    //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".admin_modify_style").height($(window).height()); 
	$(".recording_style").width($(window).width()-400); 
  });
  //修改密码
  function change_Password(){
	   layer.open({
    type: 1,
	title:'修改密码',
	area: ['300px','300px'],
	shadeClose: true,
	content: $('#change_Pass'),
	btn:['确认修改'],
	yes:function(index, layero){		
		   if ($("#password").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		  if ($("#Nes_pas").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          } 
		   
		  if ($("#c_mew_pas").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
				icon:0,
			    
			 });
			return false;
          }
		    if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{			  
			  layer.alert('修改成功！',{
               title: '提示框',				
			icon:1,		
			  }); 
			  layer.close(index);      
		  }	 
	}
    });
	  }
</script>
<script>
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,4,5,6]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
});</script>
