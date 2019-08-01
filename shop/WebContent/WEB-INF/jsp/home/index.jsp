<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>建大商城首页</title>
	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/hmstyle.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	
</head>

<body>
	<div class="hmtop">
		<!-- 顶部包含 -->
		<%@include file="top.jsp"%>

		<div class="banner">
			<!--轮播 -->

			<div class="am-slider am-slider-default scoll" data-am-flexslider
				id="demo-slider-0">
				<ul class="am-slides">
					<s:iterator var="p" value="tList">
						<li class="banner5"><a
							href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid" />">
								<img
								src="${pageContext.request.contextPath }/<s:property value="#p.image"/>" />
						</a></li>
					</s:iterator>
				</ul>
			</div>

			<div class="clear"></div>
		</div> 

		<div class="shopNav">
			<div class="slideall">

				<div class="long-title">
					<span class="all-goods">全部分类</span>
				</div>
				<!-- 包含menu.jsp -->
				<%@include file="menu.jsp"%>
				<!--左侧导航 -->
				<div id="nav" class="navfull">
					<div class="area clearfix">
						<div class="category-content" id="guide_2">
							<!-- 左侧导航 -->
							<%@include file="left.jsp"%>
						</div>
					</div>
				</div>
				<!--轮播 -->
				<script type="text/javascript">
					(function() {
						$('.am-slider').flexslider();
					});
					$(document).ready(function() {
						$("li").hover(function() {
							$(".category-content .category-list li.first .menu-in").css("display","none");
							$(".category-content .category-list li.first").removeClass("hover");
								$(this).addClass("hover");
								$(this).children("div.menu-in").css("display","block")
							},function() {
								$(this).removeClass("hover")
								$(this).children("div.menu-in").css("display","none")
							});
					})
					
				</script>

				<!--走马灯 -->

				<div class="marqueen">
					<span class="marqueen-title">商城头条</span>
					<div class="demo">
						<ul>
							<!-- 判断 -->
							<s:if test="#session.existUser==null">
								<div class="mod-vip">
									<div class="m-baseinfo">
										<a
											href="${pageContext.request.contextPath }/person/index.html">
											<img
											src="${pageContext.request.contextPath }/images/getAvatar.do.jpg">
										</a> <em> Hi,<span class="s-name">小叮当</span> <a href="#"><p>点击更多优惠活动</p></a>
										</em>
									</div>
									<div class="member-logout">
										<a class="am-btn-warning btn"
											href="${pageContext.request.contextPath }/user_loginPage.action">登录</a>
										<a class="am-btn-warning btn"
											href="${pageContext.request.contextPath }/user_registPage.action">注册</a>
									</div>
									<div class="member-login">
										<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
										<a href="#"><strong>0</strong>待付款</a> <a href="#"><strong>0</strong>待评价</a>
									</div>
									<div class="clear"></div>
								</div>
							</s:if>
							<s:else>
								<div class="mod-vip">
									<div class="m-baseinfo">
										<a
											href="${pageContext.request.contextPath }/user_infoPage.action">
											<img
											src="${pageContext.request.contextPath }/images/getAvatar.do.jpg">
										</a> <em> Hi,<span class="s-name"><s:property
													value="#session.existUser.username" /></span> <a href="#"><p>点击更多优惠活动</p></a>
										</em>
									</div>
									<div class="member-loginout">
										<a class="am-btn-warning btn" href="#"><strong>0</strong>待收货</a>
										<a class="am-btn-warning btn" href="#"><strong>1</strong>待发货</a>
										<a class="am-btn-warning btn" href="#"><strong>3</strong>待付款</a>
										<a class="am-btn-warning btn" href="#"><strong>8</strong>待评价</a>
									</div>
									<div class="clear"></div>
								</div>
							</s:else>

							<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
							<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
							<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券
									买1送1！</a></li>

						</ul>
						<div class="advTip">
							<img src="${pageContext.request.contextPath }/images/advTip.jpg" />
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<script type="text/javascript">
				if ($(window).width() < 640) {
					function autoScroll(obj) {
						$(obj).find("ul").animate({
							marginTop : "-39px"
						}, 500, function() {
							$(this).css({
								marginTop : "0px"
							}).find("li:first").appendTo(this);
						})
					}
					$(function() {
						setInterval('autoScroll(".demo")', 3000);
					})
				}
			</script>
		</div>
		<div class="shopMainbg">
			<div class="shopMain" id="shopmain">
				<!--热门商品 -->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>热门商品</h4>
						<h3>热门商品倒计时！秒杀全场</h3>
						<span class="more "> <a class="more-link " href="# ">更多热门</a>
						</span>
					</div>
				</div>
				<div class="clear "></div>
				<div class="am-g am-g-fixed recommendation">
					<div class="clock am-u-sm-3">
						<img src="${pageContext.request.contextPath }/images/2016.png "></img>
						<p>
							热门<br>商品 
						</p>
					</div>
					<s:iterator var="p" value="hList">
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>
									<s:property value="#p.pname" />
								</h3>
								<h4>
									原价：￥<span style="color: #99999"><s:property
											value="#p.market_price" /></span>
								</h4>
								<h4>
									现价：￥<span style="color: red"><s:property
											value="#p.shop_price" /></span>
								</h4>
							</div>
							<div class="recommendationMain ">
								<a
									href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid" />"><img
									src="${pageContext.request.contextPath }/<s:property value="#p.image"/>"></img></a>
							</div>
						</div>
					</s:iterator>
				</div>
				<div class="clear "></div>

				<!--每日新品 -->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>每日新品</h4>
						<h3>优惠享不停</h3>
						<span class="more "> <a class="more-link " href="# ">更多商品</a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed flood method3">
					<s:iterator var="p" value="nList">
						<ul class="am-thumbnails ">
							<li>
								<div class="list">
									<a
										href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid" />"><img
										src="${pageContext.request.contextPath }/<s:property value="#p.image"/>"
										width="40" height="220" />
										<div class="pro-title ">
											<s:property value="#p.pname" />
										</div> <span style="color: red"><s:property
												value="#p.shop_price" /></span>￥ </a>
								</div>
							</li>
						</ul>
					</s:iterator>
				</div>
				<div class="clear "></div>

				<!-- 底部包含 -->
				<%@include file="buttom.jsp"%>
			</div>
		</div>
	</div>
	</div>
	<!-- 包含右侧 -->
	<%@include file="right.jsp"%>
	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath }/basic/js/quick_links.js "></script>
	<script >
	$(function(){
        $("#ai-topsearch").on("click",function(){
        	var pname = document.getElementById("searchInput").value;
            alert(pname);
         	$.ajax({
         		type:"POST",
         		url:"sss",
         		success:function(data){
         			
         		}
         	})
        })  	
       });
	</script>
</body>

</html>