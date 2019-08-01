<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>订单页面</title>

	<link
		href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
		rel="stylesheet" type="text/css" />

	<link href="${pageContext.request.contextPath }/basic/css/demo.css"
		rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/cartstyle.css"
		rel="stylesheet" type="text/css" />

	<link href="${pageContext.request.contextPath }/css/jsstyle.css"
		rel="stylesheet" type="text/css" />

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/address.js"></script>
</head>

<body>
	<!--头 -->
	<header> 
	<article>
	<div class="mt-logo">
		<!--顶部导航条 -->

		<%@include file="top.jsp"%>
		<!--悬浮搜索框-->

		<div class="clear"></div>
	</div>
	</div>
	</article> 
	</header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<%@include file="menu.jsp"%>
	</div>
	<b class="line"></b>
	<div class="concent">
		<div class="paycont">
			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
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
							<div class="th th-oplist">
								<div class="td-inner">订单编号</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>
					<s:iterator var="orderItem" value="model.orderItems">
						<tr class="item-list">
							<div class="bundle  bundle-last">

								<div class="bundle-main">
									<ul class="item-content clearfix">

										<div class="pay-phone">
											<li class="td td-item">
												<div class="item-pic">
													<a href="#" class="J_MakePoint"> <img
														src="${pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"
														class="itempic J_ItemImg" width="100px" height="100px"></a>
												</div>
												<div class="item-info">
													<div class="item-basic-info">
														<a href="#" class="item-title J_MakePoint"
															data-point="tbcart.8.11"><s:property value="#orderItem.product.pname" /></a>
													</div>
												</div>
											</li>
											<li class="td td-info">
												<div class="item-props">
													<span class="sku-line">颜色：12#川南玛瑙</span> <span
														class="sku-line">包装：裸装</span>
												</div>
											</li>
											<li class="td td-price">
												<div class="item-price price-promo-promo">
													<div class="price-content">
														<em class="J_Price price-now">¥：<s:property value="#orderItem.product.shop_price" /></em>
													</div>
												</div>
											</li>
										</div>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<span class="phone-title">购买数量</span>
													<div class="sl">
														<input class="min am-btn" name="" type="button" value="-" />
														<input class="text_box" name="" type="text"
															value="<s:property value="#orderItem.count" />"
															style="width: 30px;" /> <input class="add am-btn"
															name="" type="button" value="+" />
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number"><s:property value="#orderItem.subtotal" /></em>
											</div>
										</li>
										<li class="td td-oplist">
											<div class="td-inner">
													<span class="sku-line">编号：<s:property value="#orderItem.itemid" /></span> 
												</div>
											</div>
										</li>

									</ul>
									<div class="clear"></div>

								</div>
						</tr>
					</s:iterator>

					<div class="clear"></div>
				</div>


			</div>
			<div class="clear"></div>
			<!-- 提交的订单 -->
				<div class="pay-confirm clearfix">
					<form id="orderForm" action="${ pageContext.request.contextPath }/order_payOrder.action" method="post">
						<input type="hidden" name="oid" value="<s:property value="model.oid"/>"/>
						<!--地址 -->
						<div class="address">
							<h3>确认收货信息</h3>
							<ul>
								<li class="user-addresslist defaultAddr">
									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<input name="addr"
												value="<s:property value="model.user.addr"/>"
												style="width: 450px" />
										</div>
									</div>
									<div class="per-border"></div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">收货姓名</label>
										<div class="am-form-content">
											<input name="name"
												value="<s:property value="model.user.name"/>"
												style="width: 150px" />
										</div>
									</div>
									<div class="per-border"></div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">联系电话</label>
										<div class="am-form-content">
											<input name="phone"
												value="<s:property value="model.user.phone"/>"
												style="width: 150px" />
										</div>
									</div>
									<div class="per-border"></div>

								</li>


							</ul>
							<div class="clear"></div>



						</div>
						<!--物流 -->
						
						<div class="clear"></div>

						<!--支付方式-->
						<div class="logistics">
							<h3>选择支付方式</h3>
							<ul class="pay-list">
								<tr>
									<td>
										<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />工商银行 <img src="${ pageContext.request.contextPath }/bank_img/icbc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" name="pd_FrpId" value="BOC-NET-B2C" />中国银行 <img src="${ pageContext.request.contextPath }/bank_img/bc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" name="pd_FrpId" value="ABC-NET-B2C" />农业银行 <img src="${ pageContext.request.contextPath }/bank_img/abc.bmp" align="middle" /></td>
									</br>
									<td>
										<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" />交通银行 <img src="${ pageContext.request.contextPath }/bank_img/bcc.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" name="pd_FrpId" value="PINGANBANK-NET" />平安银行 <img src="${ pageContext.request.contextPath }/bank_img/pingan.bmp"
										align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />建设银行 <img src="${ pageContext.request.contextPath }/bank_img/ccb.bmp" align="middle" /></td>
									</br>
									<td>
										<input type="radio" name="pd_FrpId" value="CEB-NET-B2C" />光大银行 <img src="${ pageContext.request.contextPath }/bank_img/guangda.bmp" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp; 
										<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" />招商银行 <img src="${ pageContext.request.contextPath }/bank_img/cmb.bmp" align="middle" /></td>

								</tr>
							</ul>
						</div>
						<div class="clear"></div>

						<!--信息 -->

						<div class="box">
							<div tabindex="0" id="holyshit267" class="realPay">
								<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
									<em class="style-large-bold-red " id="J_ActualFee"><s:property
											value="model.total" /></em>
								</span>
							</div>

							<div id="holyshit268" class="pay-address">

								<p class="buy-footer-address">
									<span class="buy-line-title buy-line-title-type">收件地址：</span> <span
										class="buy--address-detail"> <span class="province"><s:property value="model.user.addr"/></span>
									</span>
								</p>
								<p class="buy-footer-address">
									<span class="buy-line-title">收货人：</span> <span
										class="buy-address-detail"><s:property value="model.user.name"/>
									</span>
								</p>
								<p class="buy-footer-address">
									<span class="buy-line-title">联系电话：</span> <span
										class="buy-address-detail"><s:property value="model.user.phone"/>
									</span>
								</p>
							</div>
						</div>

						<div id="holyshit269" class="submitOrder">
							<div class="go-btn-wrap">
								<p style="text-align:right">
							<a href="javascript:document.getElementById('orderForm').submit();">
								<img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</p>
							</div>
						</div>
						<div class="clear"></div>
					</form>
				</div>
			</div>
		</div>

		<div class="clear"></div>

	<!-- 底部 -->
	<%@include file="buttom.jsp"%>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12">
			<form class="am-form am-form-horizontal">

				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" id="user-name" placeholder="收货人">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input id="user-phone" placeholder="手机号必填" type="email">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">所在地</label>
					<div class="am-form-content address">
						<select data-am-selected>
							<option value="a">浙江省</option>
							<option value="b">湖北省</option>
						</select> <select data-am-selected>
							<option value="a">温州市</option>
							<option value="b">武汉市</option>
						</select> <select data-am-selected>
							<option value="a">瑞安区</option>
							<option value="b">洪山区</option>
						</select>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
						<small>100字以内写出你的详细地址${pageContext.request.contextPath }.</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<div class="am-btn am-btn-danger">保存</div>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<div class="clear"></div>
</body>

</html>