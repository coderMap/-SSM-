<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="${pageContext.request.contextPath }/css/dlstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

	<div class="login-boxtitle">
		<a href="home/demo.html"><img alt=""
			src="${pageContext.request.contextPath }/images/logobig.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath }/images/big.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">新用户注册</a></li>
					</ul>
					<!-- 错误回显 -->
					<div> 
					<span style="color:red"><s:actionerror/></span> 
					</div>
					<span style="color:red"><s:fielderror/></span>
					<form id="registerForm"
						action="${ pageContext.request.contextPath }/user_regist.action "
						method="post" novalidate="novalidate"
						onsubmit="return checkForm();">
						<div class="user-email">
							<label for="username"><i class="am-icon-envelope-o"></i></label>
							<input type="text" name="username" id="username" class="text"
								onblur="checkUsername" placeholder="请输入用户名"> <span
								id="span1"></span>
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="password" id="password" placeholder="设置密码">
						</div>
						<div class="user-pass">
							<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
							<input type="password" name="repassword" id="repassword"
								placeholder="确认密码">
						</div>

						<div class="user-email">
							<label for="email"><i class="am-icon-envelope-o"></i></label> <input
								type="email" name="email" id="email" placeholder="请输入邮箱账号">
						</div>

						<div>
							<span class="requiredField">*</span>验证码: <span class="fieldSet">
								<input type="text" id="checkcode" name="checkcode"
								class="text captcha" maxlength="4" autocomplete="off"><img
								id="checkImg" class="captchaImage"
								src="${pageContext.request.contextPath}/checkImg.action"
								onclick="change()" title="点击更换验证码">
							</span>
						</div>

						<div>
							<input type="submit"
								class="am-btn am-btn-primary am-btn-sm am-fl" value="同意协议并注册">
						</div>

						<div class="login">

							<dl>
								<dt>已经拥有账号了？</dt>
								<a href="${pageContext.request.contextPath}/user_loginPage.action">立即登录</a>

							</dl>
						</div>
					</form>

				</div>

				<script>
					$(function() {
						$('#doc-my-tabs').tabs();
					})
				</script>
				<!-- 校验 -->
				<script>
					function checkForm() {
						// 校验用户名:
						// 获得用户名文本框的值:
						var username = document.getElementById("username").value;
						if (username == null || username == '') {
							alert("用户名不能为空!");
							return false;
						}

						// 校验密码:
						// 获取密码文本框的值
						var password = document.getElementById("password").value;
						if (password == null || password == '') {
							alert("密码不能为空!");
							return false;
						}

						// 校验两次密码:
						// 获取两次密码文本框的值
						var repassword = document.getElementById("repassword").value;
						if (repassword != password) {
							alert("两次输入的密码不一致");
							return false;
						}

						// 校验邮箱:
						// 获得邮箱文本框的值:
						var email = document.getElementById("email").value;
						if (email == null || email == '') {
							alert("邮箱不能为空!");
							return false;
						}
					}
					//ajax校验
					function checkUsername() {
						// 获得文件框值:
						var username = document.getElementById("username").value;
						// 1.创建异步交互对象
						var xhr = createXmlHttp();
						// 2.设置监听
						xhr.onreadystatechange = function() {
							if (xhr.readyState == 4) {
								if (xhr.status == 200) {
									document.getElementById("span1").innerHTML = xhr.responseText;
								}
							}
						}
						// 3.打开连接
						xhr.open("GET",
								"${pageContext.request.contextPath}/user_findByName.action?time="
										+ new Date().getTime() + "&username="
										+ username, true);
						// 4.发送
						xhr.send(null);
					}

					function createXmlHttp() {
						var xmlHttp;
						try { // Firefox, Opera 8.0+, Safari
							xmlHttp = new XMLHttpRequest();
						} catch (e) {
							try {// Internet Explorer
								xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
							} catch (e) {
								try {
									xmlHttp = new ActiveXObject(
											"Microsoft.XMLHTTP");
								} catch (e) {
								}
							}
						}

						return xmlHttp;
					}
					//切换验证码图片
					function change() {
						var img1 = document.getElementById("checkImg");
						img1.src = "${pageContext.request.contextPath}/checkImg.action?"
								+ new Date().getTime();
					}
				</script>

			</div>
		</div>

	</div>
	<!-- 底部包含 -->
	<%@include file="buttom.jsp"%>
</body>

</html>