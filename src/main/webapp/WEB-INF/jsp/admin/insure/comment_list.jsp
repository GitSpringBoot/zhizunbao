<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
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
        <script src="<%=basePath %>styles/behind/assets/js/bootstrap.min.js"></script>
		<script src="<%=basePath %>styles/behind/assets/js/typeahead-bs2.min.js"></script>           	
		<script src="<%=basePath %>styles/behind/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=basePath %>styles/behind/assets/js/jquery.dataTables.bootstrap.js"></script>
        <script src="<%=basePath %>styles/behind/assets/layer/layer.js" type="text/javascript" ></script>          
        <script src="<%=basePath %>styles/behind/assets/laydate/laydate.js" type="text/javascript"></script>
<title></title>
</head>

<body>
<div class="margin clearfix">
 <div class="Guestbook_style">

    <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:void()" class="btn btn-danger" onclick="deleteAll()"><i class="fa fa-trash"></i>&nbsp;批量删除</a>
       
       </span>
     </div>
     <div class="search_style">
     <form action="<%=basePath%>comment/findOne" method="post">
         <ul class="search_content clearfix">
         <li><select name="insureId">
          <option value="0">请选择查看评论的类型</option>
          <option value="0">全部类型</option>
          <c:forEach items="${insureList }" var="r">
             <option value="${r.insureId }">${r.insureName }</option>
          </c:forEach>
        </select>
        </li>
       <li style="width:100px;"><button value="findOne()" style="width:80px;" type="submit" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
      </ul>
     </form>
    </div>
    <!--留言列表-->
    <div class="Guestbook_list">
      <table class="table table-striped table-bordered table-hover" id="sample-table">
      <thead>
		 <tr>
          <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
          <th width="80">序号</th>
          <th width="150px">用户名</th>
          <th width="150px">保险类型</th>
          <th width="">评论内容内容</th>
          <th width="200px">评论时间</th>
          <th width="250">操作</th>
          </tr>
      </thead>
	<tbody>
		<c:forEach items="${commentList }" var="c" varStatus="s">
		 <tr>
          <td><label><input value="${c.id},${c}" type="checkbox" class="ace"><span class="lbl"></span></label></td>
          <td>${s.count }</td>
          <td>${c.userName }</td>
          <td>${c.insureName }</td>
          <td class="text-l">
          ${c.commentContent }
          <td>${c.commentDate }</td>
          <td class="td-manage">
          <a  href="javascript:;"  onclick="member_del(this,'${c.id }')" title="删除" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
          </td>
		 </tr>
		</c:forEach>
        </tbody>
      </table>
    </div>
 </div>
</div>
<!--留言详细-->
<div id="Guestbook" style="display:none">
 <div class="content_style">
  <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1">留言用户 </label>
       <div class="col-sm-9"></div>
	</div>
   <div class="form-group"><label class="col-sm-2 control-label no-padding-right" for="form-field-1"> 留言内容 </label>
       <div class="col-sm-9"></div>
	</div>
    
 </div>
</div>
</body>
</html>
<script type="text/javascript">
 /*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+'#?='+id,w,h);
}
/*留言-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除此条评论吗？',function(index){
		var url = "<%=basePath%>comment/deleteComment";
		 var params = {};
		params.id = id;
		$.post(url,params,function(i){
			if(i == 1){
				layer.msg('已删除!',{icon:1,time:1000});
				 location.reload();
			}else{
				layer.msg('删除失败!',{icon:1,time:1000});
			}
		});  
		
	});
}

/*checkbox激发事件*/
$('#checkbox').on('click',function(){
	if($('input[name="checkbox"]').prop("checked")){
		 $('.Reply_style').css('display','block');
		}
	else{
		
		 $('.Reply_style').css('display','none');
		}	
	})

	/*字数限制*/
function checkLength(which) {
	var maxChars = 200; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您输入的字数超过限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
</script>
<script type="text/javascript">
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,3,5,6]}// 制定列不参与排序
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
			})
		//批量删除
	function deleteAll() {
		   var ids = "";
		   $(".ace:checked").each(function(){
				
				ids += ",";
				ids += $(this).val();
			})
	        
		   var id = ids.substring(1);
		   if(id.length==0){
			   alert("请先选择需要删除的评论")
		   }else{
	      layer.confirm('确认要删除这些评论吗？',function(index){
		  $.ajax({
			  url:"<%=basePath %>comment/deleteAll",
			  type:"post",
			  data:{id:id},
			  dataType:"text",
			  success:function(data){
				  if(data=="true"){
					  alert("删除成功");
					  location.reload();
					  
				  }else{
					  alert("删除失败")
				  }
			  }
		  })
	})}   
	}

</script>

