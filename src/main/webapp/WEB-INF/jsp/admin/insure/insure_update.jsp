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
<form id="myForm" action="<%=basePath %>insure/updateInsure" method="post">
	<input type="hidden" name="insureId" value="${insureId}"> 
   <ul class="add_conent">
	    <li class=" clearfix">
		    <label class="label_name"><i><font color="red">*</font></i>保险名称：</label> 
		    <input name="insureName" type="text" class="add_text" datatype="*" nullmsg="不能为空" />
	    </li>
	    <li class=" clearfix">
		    <label class="label_name"><i><font color="red">*</font></i>保障期限：</label> 
		    <input name="insureTimelimit" type="text" class="add_text" style="width:80px" datatype="integer" errormsg="格式不正确" nullmsg="不能为空" />&nbsp;&nbsp;天
	    </li>
	    <li class=" clearfix">
		    <label class="label_name"><i><font color="red">*</font></i>保险价格：</label> 
		    <input name="insurePrice" type="text" class="add_text" style="width:80px" datatype="integer" errormsg="格式不正确" nullmsg="不能为空" />&nbsp;&nbsp;元
	    </li>
	    <li class=" clearfix">
		    <label class="label_name">投保人数：</label> 
		    <input readonly="readonly" name="insureNumber" type="text" class="add_text" style="width:80px"/>&nbsp;&nbsp;人
	    </li>
	    <li class=" clearfix">
		    <label class="label_name"><i><font color="red">*</font></i>适用人群：</label> 
		    <select id="select1" style="margin-left: 10px" name="peopleId" class="text_add">
		    	<c:forEach items="${peopleList}" var="p">
		    		<option value="${p.peopleId }">${p.people }</option>
		    	</c:forEach>
		    </select>
	    </li>
	    <li class=" clearfix"><label class="label_name"><i><font color="red">*</font></i>保险特色：</label><br><br>
    	 	<div>
	    	 	<c:forEach items="${featureList }" var="f">
	        		<label><input name="feature" class="ace" type="checkbox" value="${f.featureId }"><span class="lbl">${f.featureContent }</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
	        	 </c:forEach>
        	 </div>
         </li>
         <li class=" clearfix"><label class="label_name"><i><font color="red">*</font></i>保障范围：</label><br><br>
		    <div>
		    	<c:forEach items="${safeGuardList }" var="s">
	         		<label><input name="safeguard" class="ace" type="checkbox" value="${s.safeguardId }"><span class="lbl">${s.safeguardProject }</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
	         	</c:forEach>
	        </div>	
         </li>
         <li class=" clearfix"><label class="label_name"><i><font color="red">*</font></i>保险分类：</label>
         	<select id="select2" style="margin-left: 10px" name="typeId" class="text_add">
	    	   <c:forEach items="${typeList }" var="t">
	    	   		<c:choose>
	    	   			<c:when test="${t.pid==null }">
	    	   				<optgroup label="${t.typeName }"></optgroup>
	    	   			</c:when>
	    	   			<c:otherwise>
	    	   				<option value="${t.typeId }">${t.typeName }</option>
	    	   			</c:otherwise>
	    	   		</c:choose>
			    		
         	   </c:forEach>
		    </select>
         </li>
         <li class=" clearfix"><label class="label_name"><i><font color="red">*</font></i>保单形式：</label>
         	<label><input name="insureShape" class="ace" type="checkbox" value="电子保单"><span class="lbl">电子保单</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         	<label><input name="insureShape" class="ace" type="checkbox" value="纸质保单"><span class="lbl">纸质保单</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </li>
	    <li class=" clearfix">
		    <label class="label_name">保险简介：</label> 
		    <textarea name="insureContent" cols="" rows="" class="textarea" onkeyup="checkLength(this);" datatype="*" errormsg="格式不正确" nullmsg="不能为空" ></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">255</span>字</span>
	    </li>
	    <li>
		    <input type="submit"  class="btn btn-warning" value="保存"/>
		    <input onclick="javascript:(history.go(-1));" type="button" value="返回"  class="btn btn-warning"/>
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

$(function(){
	var insureId = ${insureId};
	 $.post(
		"<%=basePath%>insure/findOtherByInsureId",
		{"insureId":insureId},
		function(obj){
			//alert(JSON.stringify(obj));
			var insure = obj.insure;
			var insureSafeGuard = obj.insureSafeGuards;
			var insureFeature = obj.insureFeatures;
			var insureType=obj.insureType;
			var shape=insure.insureShape.split(",");
			for ( var i in shape) {
				$(":checkbox[value='"+shape[i]+"']").prop("checked",true);
			}
			$(":input[name='insureName']").val(insure.insureName);
			$(":input[name='insureTimelimit']").val(insure.insureTimelimit);
			$(":input[name='insurePrice']").val(insure.insurePrice);
			$(":input[name='insureNumber']").val(insure.insureNumber);
			$("textarea").text(insure.insureContent);
			$("#select1 [value='"+insure.peopleId+"']").prop("selected",true);
			$("#select2 [value='"+insureType.typeId+"']").prop("selected",true);
			for ( var i in insureSafeGuard) {
				$(":checkbox[name='safeguard'][value='"+insureSafeGuard[i].safeguardId+"']").prop("checked",true);
			}
			for ( var i in insureFeature) {
				$(":checkbox[name='feature'][value='"+insureFeature[i].featureId+"']").prop("checked",true);
			}
		},"json"
	);
});
<%-- 	//修改保险
	function updateInsure(){
	$.post(
		"<%=basePath %>insure/updateInsure",
		$("#myForm").serialize(),
		function(msg){
			if (msg) {
				location="<%=basePath%>insure/findInsureList";
			}else{
				layer.msg('添加失败!',{icon: 5,time:1000});
			}
		},"json"
	)
		
} --%>

     $(document).ready(function(){
 $(".left_add").height($(window).height()-60); 
  $(".right_add").width($(window).width()-600);
   $(".right_add").height($(window).height()-60);
  $(".select").height($(window).height()-195); 
  $("#select_style").height($(window).height()-220); 
 //当文档窗口发生改变时 触发  
    $(window).resize(function(){
		  $(".right_add").width($(window).width()-600); 
		 $(".left_add").height($(window).height()-60);
		 $(".right_add").height($(window).height()-60); 
		 $(".select").height($(window).height()-195); 
		$("#select_style").height($(window).height()-220); 
	});
	 })
	function checkLength(which) {
	var maxChars = 255;
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您出入的字数超多限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; // 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
}

</script>
