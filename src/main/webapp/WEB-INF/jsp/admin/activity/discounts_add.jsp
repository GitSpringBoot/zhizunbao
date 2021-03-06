<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/styles/common/behind/cssStyle.jsp" %>	
		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
        <!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
</head>
<body>

<div class=" clearfix">
 <div id="add_brand" style="margin-left: 20%" class="clearfix">
 <div>
<form id="myForm" action="<%=basePath%>discounts/addDiscounts" method="post"> 
   <ul class="add_conent">
	    <li class=" clearfix">
	    	<label class="label_name"><i><font color="red">*</font></i>活动时间：</label>
	    	<input name="disTime" type="text" class="add_text" datatype="*" nullmsg="不能为空" />天
	    </li>
	    <li class=" clearfix">
	    	<label class="label_name"><i><font color="red">*</font></i>优惠金额：</label>
	    	<input name="disMoney" type="text" class="add_text" datatype="*" nullmsg="不能为空" />元
	    </li>
	    <li>
		    <input type="submit" class="btn btn-warning" value="保存"/>
		    <input onclick="closeLayer();" type="button" value="返回" class="btn btn-warning"/>
	    </li>
   </ul>
 </form> 
 </div>
  
 </div>
 
 </div>

</body>
<%@include file="/styles/common/behind/jsStyle.jsp" %>	
</html>
<script type="text/javascript">
/* 表单校验 */
$(function(){
	$("#myForm").Validform({
		tiptype:3, 
		tipSweep:true,
		datatype:{
			"integer" :  /^\+?(0|[1-9][0-9]*)$/,
			"password":	  /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/,
			"telphone":   /^1[34578]\d{9}$/,
			"idCard":     /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/,
			"email":      /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/, 
		}
	//--不为纯数字或字母的正在表达式 用于密码验证
	//^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$
	});
});
	// 关闭窗口
	function closeLayer(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	       parent.layer.close(index);
	       return true;
	}

     $(document).ready(function(){
 $(".left_add").height($(window).height()-60); 
  $(".right_add").width($(window).width()-600);
   $(".right_add").height($(window).height()-60);
  $(".select").height($(window).height()-195); 
  $("#select_style").height($(window).height()-220); 
     });
</script>
