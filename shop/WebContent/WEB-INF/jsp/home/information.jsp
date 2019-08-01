<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>个人资料</title>

<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath }/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/infstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>

<body>
	<!--头 -->

	<!--顶部导航条 -->
	<%@include file="top.jsp"%>

	<!--悬浮搜索框-->

	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />

					<!--头像 -->
					<div class="user-infoPic">

						<div class="filePic">
							<input type="file" class="inputPic"
								allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"> <img
								class="am-circle am-img-thumbnail"
								src="${pageContext.request.contextPath }/images/getAvatar.do.jpg"
								alt="" />
						</div>

						<p class="am-form-help">头像</p>

						<div class="info-m">
							<div>
								<b>用户名：<i><s:property value="#session.existUser.username" /></i></b>
							</div>
							<div class="vip">
								<span></span><a href="#">会员专享</a>
							</div>
						</div>
					</div>

					<!--个人信息 -->
					<div class="info-main">
						<form class="am-form am-form-horizontal" action="${pageContext.request.contextPath }/user_update.action" method="post">
							<input type="hidden" name="uid" value="<s:property value="#session.existUser.uid" /> "/>
							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">真实姓名</label>
								<div class="am-form-content">
									<input type="text" id="name" name="name" value="<s:property value="#session.existUser.name" />" placeholder="请输入真实姓名"> <small>姓名长度不能超过4个汉字</small>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-phone" class="am-form-label">电话</label>
								<div class="am-form-content">
									<input id="phone" name="phone" value="<s:property value="#session.existUser.phone" />" placeholder="请输入联系电话" type="text">

								</div>
							</div>
							
							<div class="am-form-group">
								<label for="user-address" class="am-form-label">收货地址</label>
								<div class="am-form-content address">
									<input type="text" name="addr" id="addr" value="<s:property value="#session.existUser.addr" />" placeholder="请输入送货地址"> <small>省——市——区——详细地址</small>
								</div>
							</div>

							<div class="info-btn">
								<input type="submit" class="am-btn am-btn-danger" value="保存修改"/>
							</div>

						</form>
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