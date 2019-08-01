<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>商品列表</title>

	<link
		href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css"
		rel="stylesheet" type="text/css" />

	<link href="${pageContext.request.contextPath }/basic/css/demo.css"
		rel="stylesheet" type="text/css" />

	<link href="${pageContext.request.contextPath }/css/seastyle.css"
		rel="stylesheet" type="text/css" />

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/basic/js/jquery-1.7.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/script.js"></script>
</head>
<body>
	<!--顶部导航条 -->
	<%@include file="top.jsp"%>
	<!--悬浮搜索框-->
	<div class="search">
		<div class="search-list">
			<div class="nav-table">
				<div class="long-title">
					<span class="all-goods">全部分类</span>
				</div>
				<%@include file="menu.jsp"%>
			</div>
			<div class="am-g am-g-fixed">
				<div class="am-u-sm-12 am-u-md-12">
					<div class="theme-popover">
						<ul class="select">
							<p class="title font-normal">
								<span class="fl">搜索结果：</span> <span class="total fl">搜索到<strong
									class="num"><s:property value="pageBean.totalCount"/></strong>件相关商品
								</span>
							</p>
							<div class="clear"></div>
							<li class="select-list">
								<dl id="select1">
									<dt class="am-badge am-round">分类：</dt>
									<s:iterator var="c" value="#session.cList">
										<div class="dd-conent">	
											<dd class="select-all selected">
												<a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid" />&page=1"><s:property value="#c.cname" /></a>
											</dd>
											<s:iterator var="cs" value="#c.categorySeconds">
												<dd>
													<a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid" />&page=1"><s:property value="#cs.csname" /></a>
												</dd>
											</s:iterator>
										</div>
									</s:iterator>
								</dl>
							</li>
						</ul>
						<div class="clear"></div>
					</div>
					<div class="search-content">
						<div class="sort">
							<li class="first"><a title="综合">综合排序</a></li>
							<li><a title="销量">销量排序</a></li>
							<li><a title="价格">价格优先</a></li>
							<li class="big"><a title="评价" href="#">评价为主</a></li>
						</div>
						<div class="clear"></div>
						<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
							<s:iterator var="p" value="pageBean.list">
								<li>
									<div class="i-pic limit">
										<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid" />"><img src="${pageContext.request.contextPath }/<s:property value="#p.image" />" width="40" height="220" /></a>
										<p class="title fl">
											<s:property value="#p.pname" />
										</p>
										<p class="price fl">
											<b>¥</b> <strong><s:property value="#p.shop_price" /></strong>
										</p>
										<p class="number fl">
											销量<span>1110</span>
										</p>
									</div>
								</li>
							</s:iterator>
						</ul>
					</div>
					<div class="search-side">
						<div class="side-title">经典搭配</div>
						<li>
							<div class="i-pic check">
								<img src="${pageContext.request.contextPath }/images/cp.jpg" />
								<p class="check-title">萨拉米 1+1小鸡腿</p>
								<p class="price fl">
									<b>¥</b> <strong>29.90</strong>
								</p>
								<p class="number fl">
									销量<span>1110</span>
								</p>
							</div>
						</li>
					</div>
					<div class="clear"></div>
					<!--分页 -->
					<ul class="am-pagination am-pagination-right">
						<span >第 <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页</span>
						<!-- 一级分类 -->
						<s:if test="cid!=null">
						<s:if test="pageBean.page!=1">
							<li><a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid" />&page=1">&laquo;首页</a></li>
							<li><a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page-1" />">&laquo;</a></li>
						</s:if>
						
						<s:iterator var="i" begin="1" end="pageBean.totalPage">
						<s:if test="pageBean.page!=#i">
						<li><a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="#i" />"><s:property value="#i"/></a></li>
						</s:if>
						<s:else>
						<li><span><s:property value="#i"/></span></a></li>
						</s:else>
						</s:iterator>
						
						<s:if test="pageBean.page!=pageBean.totalPage">
							<li><a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+1" />">&raquo;</a></li>
							<li><a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.totalPage" />">&raquo;尾页</a></li>
						</s:if>
						</s:if>
						<!-- 二级分类 -->
						<s:if test="csid!=null">
						<s:if test="pageBean.page!=1">
							<li><a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid" />&page=1">&laquo;首页</a></li>
							<li><a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid" />&page=<s:property value="pageBean.page-1" />">&laquo;</a></li>
						</s:if>
						
						<s:iterator var="i" begin="1" end="pageBean.totalPage">
						<s:if test="pageBean.page!=#i">
						<li><a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid" />&page=<s:property value="#i" />"><s:property value="#i"/></a></li>
						</s:if>
						<s:else>
						<li><span><s:property value="#i"/></span></a></li>
						</s:else>
						</s:iterator>
						
						<s:if test="pageBean.page!=pageBean.totalPage">
							<li><a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid" />&page=<s:property value="pageBean.page+1" />">&raquo;</a></li>
							<li><a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid" />&page=<s:property value="pageBean.totalPage" />">&raquo;尾页</a></li>
						</s:if>
						</s:if>
					</ul>
				</div>
			</div>
			<!-- 底部 -->
			<%@include file="buttom.jsp"%>
		</div>
	</div>
	<!--右侧菜单 -->
	<%@include file="right.jsp"%>
	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/basic/js/quick_links.js"></script>

	<div class="theme-popover-mask"></div>

</body>

</html>