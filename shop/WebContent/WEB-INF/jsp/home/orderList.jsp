<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>我的订单管理</title>

<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath }/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/orstyle.css"
	rel="stylesheet" type="text/css">

<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>

<body>
	<!--头 -->
	<%@include file="top.jsp"%>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<!-- 菜单 -->
		<%@include file="menu.jsp"%>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>
							<li><a href="#tab2">待付款</a></li>
							<li><a href="#tab3">待发货</a></li>
							<li><a href="#tab4">待收货</a></li>
							<li><a href="#tab5">待评价</a></li>
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">

										<!--所有订单-->
										<s:iterator var="order" value="pageBean.list">
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">
														订单编号：<a href="javascript:;"><s:property value="#order.oid" /></a>
													</div>
													<span>成交时间：<s:property value="#order.ordertime" /></span>
												</div>
												<div class="order-content">
													<div class="order-left">
														<s:iterator var="orderItem" value="#order.orderItems">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint"> <img
																			src="${pageContext.request.contextPath }/<s:property value="#orderItem.product.image"/>"
																			class="itempic J_ItemImg" width="100px"
																			height="100px">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>
																					<s:property value="#orderItem.product.pname" />
																				</p>
																				<p class="info-little">
																					颜色：12#川南玛瑙 <br />包装：裸装
																				</p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">
																		¥：
																		<s:property value="#orderItem.product.shop_price" />
																	</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>
																		<s:property value="#orderItem.count" />
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation"></div>
																</li>
															</ul>
														</s:iterator>



													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：
																<s:property value="#orderItem.subtotal" />
																<p>
																	含运费：<span>10.00</span>
																</p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">
																		<s:if test="#order.state==1">
																			<a href="${pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid" />"><font color="red">未付款</font></a>
																		</s:if>
																		<s:if test="#order.state==2">
																已经付款
																</s:if>
																		<s:if test="#order.state==3">
																			<a href="#"><font color="red">确认收货</font></a>
																		</s:if>
																		<s:if test="#order.state==4">
																交易完成
																</s:if>
																	</p>
																	<p class="order-info">
																		<a href="orderinfo.html">订单详情</a>
																	</p>
																	<p class="order-info">
																		<a href="logistics.html">查看物流</a>
																	</p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">删除订单</div>
															</li>
														</div>
													</div>
												</div>
											</div>
										</s:iterator>


									</div>
								</div>
								<!-- 分页 -->
								<ul class="am-pagination am-pagination-right">
									<span>第 <s:property value="pageBean.page" />/<s:property
											value="pageBean.totalPage" />页
									</span>
									<s:if test="pageBean.page!=1">
										<li><a
											href="${pageContext.request.contextPath }/order_findByUid.action?page=1">&laquo;首页</a></li>
										<li><a
											href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page-1" />">&laquo;</a></li>
									</s:if>

									<s:iterator var="i" begin="1" end="pageBean.totalPage">
										<s:if test="pageBean.page!=#i">
											<li><a
												href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#i" />"><s:property
														value="#i" /></a></li>
										</s:if>
										<s:else>
											<li><span><s:property value="#i" /></span></a></li>
										</s:else>
									</s:iterator>

									<s:if test="pageBean.page!=pageBean.totalPage">
										<li><a
											href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page+1" />">&raquo;</a></li>
										<li><a
											href="${pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.totalPage" />">&raquo;尾页</a></li>
									</s:if>
								</ul>
							</div>

							<!-- 待付款 -->
							<div class="am-tab-panel am-fade" id="tab2">

								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">订单状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status1">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation"></div>
														</li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/62988.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱</p>
																		<p class="info-little">
																			颜色分类：李清照 <br />尺码：均码
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation"></div>
														</li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation"></div>
														</li>
													</ul>
												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div>
													</li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">等待买家付款</p>
																<p class="order-info">
																	<a href="#">取消订单</a>
																</p>

															</div>
														</li>
														<li class="td td-change"><a href="pay.html">
																<div class="am-btn am-btn-danger anniu">一键支付</div>
														</a></li>
													</div>
												</div>

											</div>
										</div>
									</div>

								</div>
							</div>

							<!-- 待发货 -->
							<div class="am-tab-panel am-fade" id="tab3">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status2">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款</a>
															</div>
														</li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/62988.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱</p>
																		<p class="info-little">
																			颜色分类：李清照 <br />尺码：均码
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款</a>
															</div>
														</li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款</a>
															</div>
														</li>
													</ul>
												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div>
													</li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">买家已付款</p>
																<p class="order-info">
																	<a href="orderinfo.html">订单详情</a>
																</p>
															</div>
														</li>
														<li class="td td-change">
															<div class="am-btn am-btn-danger anniu">提醒发货</div>
														</li>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 待收货 -->
							<div class="am-tab-panel am-fade" id="tab4">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<div class="order-status3">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div>
														</li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/62988.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱</p>
																		<p class="info-little">
																			颜色分类：李清照 <br />尺码：均码
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div>
														</li>
													</ul>

												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div>
													</li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">卖家已发货</p>
																<p class="order-info">
																	<a href="orderinfo.html">订单详情</a>
																</p>
																<p class="order-info">
																	<a href="logistics.html">查看物流</a>
																</p>
																<p class="order-info">
																	<a href="#">延长收货</a>
																</p>
															</div>
														</li>
														<li class="td td-change">
															<div class="am-btn am-btn-danger anniu">确认收货</div>
														</li>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 待评价 -->
							<div class="am-tab-panel am-fade" id="tab5">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<!--不同状态的订单	-->
										<div class="order-status4">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>

											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div>
														</li>
													</ul>

												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div>
													</li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">交易成功</p>
																<p class="order-info">
																	<a href="orderinfo.html">订单详情</a>
																</p>
																<p class="order-info">
																	<a href="logistics.html">查看物流</a>
																</p>
															</div>
														</li>
														<li class="td td-change"><a href="commentlist.html">
																<div class="am-btn am-btn-danger anniu">评价商品</div>
														</a></li>
													</div>
												</div>
											</div>
										</div>


										<div class="order-status4">
											<div class="order-title">
												<div class="dd-num">
													订单编号：<a href="javascript:;">1601430</a>
												</div>
												<span>成交时间：2015-12-20</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">
												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div>
														</li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/62988.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>礼盒袜子女秋冬 纯棉袜加厚 韩国可爱</p>
																		<p class="info-little">
																			颜色分类：李清照 <br />尺码：均码
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div>
														</li>
													</ul>

													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="#" class="J_MakePoint"> <img
																	src="${pageContext.request.contextPath }/images/kouhong.jpg_80x80.jpg"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="#">
																		<p>美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
																		<p class="info-little">
																			颜色：12#川南玛瑙 <br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">333.00</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>2
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation">
																<a href="refund.html">退款/退货</a>
															</div>
														</li>
													</ul>


												</div>
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">
															合计：676.00
															<p>
																含运费：<span>10.00</span>
															</p>
														</div>
													</li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus">交易成功</p>
																<p class="order-info">
																	<a href="orderinfo.html">订单详情</a>
																</p>
																<p class="order-info">
																	<a href="logistics.html">查看物流</a>
																</p>
															</div>
														</li>
														<li class="td td-change"><a href="commentlist.html">
																<div class="am-btn am-btn-danger anniu">评价商品</div>
														</a></li>
													</div>
												</div>
											</div>
										</div>


									</div>

								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
			<!--底部-->
			<%@include file="buttom.jsp"%>
		</div>
		<aside class="menu">
			<ul>
				<li class="person active"><a href="index.html"><i
						class="am-icon-user"></i>个人中心</a></li>
				<li class="person">
					<p>
						<i class="am-icon-newspaper-o"></i>个人资料
					</p>
					<ul>
						<li><a href="information.html">个人信息</a></li>
						<li><a href="safety.html">安全设置</a></li>
						<li><a href="address.html">地址管理</a></li>
						<li><a href="cardlist.html">快捷支付</a></li>
					</ul>
				</li>
				<li class="person">
					<p>
						<i class="am-icon-balance-scale"></i>我的交易
					</p>
					<ul>
						<li><a href="order.html">订单管理</a></li>
						<li><a href="change.html">退款售后</a></li>
						<li><a href="comment.html">评价商品</a></li>
					</ul>
				</li>
				<li class="person">
					<p>
						<i class="am-icon-dollar"></i>我的资产
					</p>
					<ul>
						<li><a href="points.html">我的积分</a></li>
						<li><a href="coupon.html">优惠券 </a></li>
						<li><a href="bonus.html">红包</a></li>
						<li><a href="walletlist.html">账户余额</a></li>
						<li><a href="bill.html">账单明细</a></li>
					</ul>
				</li>

				<li class="person">
					<p>
						<i class="am-icon-tags"></i>我的收藏
					</p>
					<ul>
						<li><a href="collection.html">收藏</a></li>
						<li><a href="foot.html">足迹</a></li>
					</ul>
				</li>

				<li class="person">
					<p>
						<i class="am-icon-qq"></i>在线客服
					</p>
					<ul>
						<li><a href="consultation.html">商品咨询</a></li>
						<li><a href="suggest.html">意见反馈</a></li>

						<li><a href="news.html">我的消息</a></li>
					</ul>
				</li>
			</ul>

		</aside>
	</div>

</body>

</html>