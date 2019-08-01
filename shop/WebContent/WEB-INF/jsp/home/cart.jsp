<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>购物车页面</title>

	<link
		href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
		rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/basic/css/demo.css"
		rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/cartstyle.css"
		rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/optstyle.css"
		rel="stylesheet" type="text/css" />

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/jquery.js"></script>
</head>

<body>
<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<%@include file="top.jsp"%>

				<!--悬浮搜索框-->

				<div class="clear"></div>
			</div>
		</article>
	</header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<%@include file="menu.jsp"%>
	</div> 
	<div class="concent">
		<!--购物车 -->
		<s:if test="#session.cart.cartItems.size()!=0">
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">

							<div class="bundle-main">
								<s:iterator var="cartItem" value="#session.cart.cartItems">

									<ul class="item-content clearfix">
										
										<li class="td td-item">
											<div class="item-pic">
												<a href="#" target="_blank"
													data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆"
													class="J_MakePoint" data-point="tbcart.8.12"> <img
													src="${pageContext.request.contextPath }/<s:property value="#cartItem.product.image"/>" width="100px" height="100px"
													class="itempic J_ItemImg"></a>
											</div>
											<div class="item-info">
												<div class="item-basic-info">
													<a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色"
														class="item-title J_MakePoint" data-point="tbcart.8.11"><s:property
															value="#cartItem.product.pname" /></a>
												</div>
											</div>
										</li>
										<li class="td td-info">
											<div class="item-props item-props-can">
												<span class="sku-line">颜色：12#川南玛瑙</span> <span
													class="sku-line">包装：裸装</span> <span tabindex="0"
													class="btn-edit-sku theme-login">修改</span> <i
													class="theme-login am-icon-sort-desc"></i>
											</div>
										</li>
										<li class="td td-price">
											<div class="item-price price-promo-promo">
												<div class="price-content">
													<div class="price-line">
														<em class="price-original">￥<s:property
																value="#cartItem.product.market_price" /></em>
													</div>
													<div class="price-line">
														<em class="J_Price price-now" tabindex="0">￥<s:property
																value="#cartItem.product.shop_price" /></em>
													</div>
												</div>
											</div>
										</li>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<div class="sl">
														<input class="min am-btn" name="" type="button" value="-" />
														<input class="text_box" name="" type="text"
															value="<s:property value="#cartItem.count"/>"
															style="width: 30px;" /> <input class="add am-btn"
															name="" type="button" value="+" />
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number"><s:property
														value="#cartItem.subtotal" /></em>
											</div>
										</li>
										<li class="td td-op">
											<div class="td-inner">
												<a title="移入收藏夹" class="btn-fav" href="#"> 移入收藏夹</a> <a
													href="${pageContext.request.contextPath }/cart_removeCart.action?pid=<s:property value="#cartItem.product.pid" />"
													data-point-url="#" class="delete"> 删除</a>
											</div>
										</li>
									</ul>

								</s:iterator>
							</div>
						</div>
					</tr>
					<div class="clear"></div>
				</div>


				<div class="clear"></div>

				<div class="float-bar-wrapper">
					
					<div class="operations">
						<a
							href="${pageContext.request.contextPath }/cart_clearCart.action"
							hidefocus="true" class="deleteAll">清空购物车</a> <a href="#"
							hidefocus="true" class="J_BatchFav">移入收藏夹</a>
					</div>
					<div class="float-bar-right">
						<div class="amount-sum">
							<span class="txt">已选商品</span> <em id="J_SelectedItemsCount">0</em><span
								class="txt">件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span> <span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span> <strong class="price">¥<em
								id="J_Total"><s:property value="#session.cart.total" /></em></strong>
						</div>
						<div class="btn-area">
							<a href="${pageContext.request.contextPath }/order_save.action"
								id="J_Go" class="submit-btn submit-btn-disabled"
								aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span></a>
						</div>
					</div>
				</div>
			</div>
		</s:if>
		<s:else>
			<div class="cart-table-th">
				<div class="wp">
					<span style="color: red"><h2>亲！您的购物车还空空如也，快去购物吧！</h2></span>
				</div>
			</div>
		</s:else>
		<!-- 底部 -->
		<%@include file="buttom.jsp"%>
	</div>

</body>

</html>