<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--顶部导航条 -->
<div class="am-container header">
	<ul class="message-l">
		<div class="topMessage">
			<!-- 判断 -->
			<s:if test="#session.existUser==null">
				<div class="menu-hd">
					<a href="${pageContext.request.contextPath }/user_loginPage.action"
						target="_top" class="h">亲，请登录</a>&nbsp;&nbsp;&nbsp; <a
						href="${pageContext.request.contextPath }/user_registPage.action"
						target="_top">免费注册</a>
				</div>
			</s:if>
			<s:else>
				<div class="menu-hd">
					<a href="#"><span style="color: red; font-style: inherit;"><s:property value="#session.existUser.username" /></span>您好！</a>&nbsp;&nbsp;&nbsp; <a
						href="#" target="_top"></a>
				</div>
			</s:else>
		</div>
	</ul>
	<ul class="message-r">
		<div class="topMessage home">
			<div class="menu-hd">
				<a href="index.action" target="_top" class="h">商城首页</a>
			</div>
		</div>

		<div class="topMessage mini-cart">
			<div class="menu-hd">
				<a id="mc-menu-hd"
					href="${pageContext.request.contextPath }/cart_myCart.action"
					target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>我的购物车</span>
					<!-- 购物车数量 -->
					<strong id="J_MiniCartNum" class="h"></strong></a>
			</div>
		</div>
		<s:if test="#session.existUser!=null">
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a
						href="${pageContext.request.contextPath }/order_findByUid.action?page=1"
						target="_top"><i class="am-icon-heart am-icon-fw"></i><span>我的订单</span></a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="${pageContext.request.contextPath }/user_infoPage.action?uid=<s:property value="#session.existUser.uid" />"
						target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>

			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="${pageContext.request.contextPath }/user_quit.action"
						target="_top"><i class="am-icon-user am-icon-fw"></i>退出</a>
				</div>
			</div>
		</s:if>

	</ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
	<div class="logoBig">
		<li><img src="${pageContext.request.contextPath }/images/logobig.png" /></li>
	</div>

	<div class="search-bar pr">
		<form action="${pageContext.request.contextPath }/product_findByName.action?" method="post">
			<input id="searchInput" name="pname" type="text" placeholder="搜索" autocomplete="off"> 
			<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit" >
		</form>
	</div>
</div>

<div class="clear"></div>

