<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
<head>  
<meta charset="UTF-8">
<title>添加二级分类</title>
<link href="${pageContext.request.contextPath }/admin/assets/css/style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="formbody">
	<div class="formtitle"><span>添加二级分类</span></div>
		<form action="${pageContext.request.contextPath}/adminCategorySecond_save.action" method="post">
			<div class="widget-body">
              	<ul class="forminfo">
				<li><label>二级分类名称:</label>
					<input name="csname" id="csname" type="text" class="dfinput" maxlength="10" autofocus="autofocus" /><i id="error">分类名称不能超过10个字符</i></li>
              	<li><label>所属一级分类:</label>
              	 	<select name="category.cid" class="dfinput" maxlength="10">
              		<s:iterator var="c" value="cList">
              			  <option value="<s:property value="#c.cid"/>"><s:property value="#c.cname"/></option>
              		</s:iterator>
              		</select>
              	</li>
              		 <li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存" style="background-color: #119619" /></li>    
              		</ul> 
              	</div>
			</form>
	    </div> 
</body>
</html>
