<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>头像上传</title>
	<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<!-- 公共资源CSS  -->
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/css/style.css" />
</head>
<body>
  <article class="page-container">
	<form style="width:650px" action="<%=basePath%>userRead/updateUpload" class="form form-horizontal" id="Form" method="post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>活动标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="readTitle" value="${userRead.readTitle}" size="50" datatype="*"  placeholder="请输入活动标题" />
				<input type="hidden" class="input-text" name="readId" value="${userRead.readId }" size="50" datatype="*"   />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>活动标题图片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="file" name="imagefile" id="imagefile" onchange="xmTanUploadImg(this)"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>预览：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<img id="xmTanImg" style="height:47%;width: 90%;"/>
		        <div id="xmTanDiv" ></div>
	        </div>
		</div>
		
		
		
		<br><hr>
		 <div class="row cl" style="padding-left:30%">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;上传&nbsp;&nbsp;" id="submitId" />
			</div>
		</div>
	</form>
  </article>
</body>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>

<!-- My97 -->
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/My97DatePicker/WdatePicker.js"></script>
<!-- 表单校验 -->
<script type="text/javascript" src="<%=basePath %>styles/behind/hui/js/Validform_v5.3.2_min.js"></script>

<script type="text/javascript" src="<%=basePath %>styles/behind/hui/js/ajaxfileupload.js"></script>
<script type="text/javascript">
  	
  	
  	/* 表单校验 */
	$(function(){
		$("#Form").Validform({
			tiptype:3, 
			tipSweep:true,
			datatype:{
				"num" :  /^\+?(0|[1-9][0-9]*)$/,
			}
		});
	});
	
	// 关闭窗口
	function closeLayer(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
        return true;
	} 
	
	//选择图片，马上预览
     function xmTanUploadImg(obj) {
         var file = obj.files[0];
         
         console.log(obj);console.log(file);
         console.log("file.size = " + file.size);  //file.size 单位为byte

         var reader = new FileReader();

         //读取文件过程方法
         reader.onloadstart = function (e) {
             console.log("开始读取....");
         }
         reader.onprogress = function (e) {
             console.log("正在读取中....");
         }
         reader.onabort = function (e) {
             console.log("中断读取....");
         }
         reader.onerror = function (e) {
             console.log("读取异常....");
         }
         reader.onload = function (e) {
             console.log("成功读取....");

             var img = document.getElementById("xmTanImg");
             img.src = e.target.result;
             //或者 img.src = this.result;  //e.target == this
         }

         reader.readAsDataURL(file)
     }
 	
 	//头像上传
 	  $("#submitId").on("click",function () {  
 		 var readId = $("[name=\"readId\"]").val();
          $.ajaxFileUpload({  
             url:'<%=basePath %>userRead/uploadImg?readId='+readId, //你处理上传文件的服务端  
             type:'post', 
             secureuri:false,//是否启用安全机制  
             fileElementId:'imagefile',//file的id  
             dataType: 'application/json',//返回的类型  
             success: function (data) {//调用成功时怎么处理  
            	 //alert(data);
                 if(data){
                	 alert('上传成功!');
                     window.parent.location.href = "<%=basePath %>userRead/toReadList";
                 }else{
                	 layer.msg('上传失败!',{icon:1,time:1000}); 
                 }
             }  
         }); 
 		 
     });  
</script>
</html>