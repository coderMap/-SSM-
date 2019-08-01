<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
<head>  
<meta charset="UTF-8">
<title>无标题文档</title>
<link href="${pageContext.request.contextPath }/admin/assets/css/style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="formbody">
		<div class="formtitle"><span>分类的基本信息</span></div>
			<form action="${pageContext.request.contextPath }/adminCategory_save.action" method="post" id="categoryForm">
				<ul class="forminfo">
					<li><label>分类名称</label><input name="cname" id="cname" type="text" class="dfinput" maxlength="10" autofocus="autofocus" /><i id="error">分类名称不能超过10个字符</i></li> 
					<li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存" style="background-color: #119619" /></li>
				</ul>
			</form>
	    </div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.js"></script>
	<script type="text/javascript">
	   $(function(){
		   $(".btn").on("click",function(){
               var cname=$.trim($("#cname").val());
               if(dept_name===""){
                   //alert("部门名称不能为空");
                   $("#error").css("color","red").html("分类名称不能为空");
                   $("#cname").focus();
                   return false;
               }
               //验证部门是否重复
               $.get("sys/department/validDepartmentName",{dept_name:dept_name},function(data){
            	   if(data.flag=="success"){
            		   $("#departmentForm").submit();
            		   return; 
            	   }else{
            		   //alert("部门名称不能为空");
            		   $("#error").css("color","red").html(data.message);
            		   $("#dept_name").focus();
                       return false;
            	   }
               });
           });
	   });
	</script>
</body>
</html>
