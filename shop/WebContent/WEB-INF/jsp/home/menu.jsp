<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="nav-cont">
	<ul >
		<li class="index"><a href="${pageContext.request.contextPath }/index.action">首页</a></li>
		<s:iterator var="c" value="#session.cList">
		<li class="qc"><a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid" />&page=1"><s:property value="#c.cname" /></a></li>
		</s:iterator>
	</ul>
	<div class="nav-extra">
		<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
			class="am-icon-angle-right" style="padding-left: 10px;"></i>
	</div>
</div>