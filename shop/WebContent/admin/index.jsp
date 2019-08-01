<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>建大商城后台管理系统登陆页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Bluth Company">
<link rel="shortcut icon" href="assets/ico/favicon.html">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/theme.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
<link href="assets/css/alertify.css" rel="stylesheet">
<link rel="Favicon Icon" href="favicon.ico">
<link href="http://fonts.useso.com/css?family=Open+Sans:400,700"
	rel="stylesheet" type="text/css">
<style type="text/css">
	body{
		margin：0px;padding：opx;
		background:#fff url(login-bg.jpg) top center no-repeat;
		background-size:100%;
	}
	h1{
		color:yellow;
	}
</style>
</head>
<body>
	<div id="wrap">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div style="text-align: center">
							<h1><strong>建大商城 </strong>后台管理系统</h1>
						</div>
					</div>
					<div class="widget container-narrow">
							<div class="widget-header">
								<i class="icon-user"></i>
								<h5 style="color:#000">登陆您的账号</h5>
							</div>
							<div class="widget-body clearfix" style="padding: 25px;">
								<form method="post" action="${pageContext.request.contextPath }/adminUser_login.action" target="_parent">

									<div class="control-group">
										<div class="controls">
											管理员姓名：<input class="btn-block" type="text" name="username" id="username" placeholder="请输入姓名">
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											管理员密码：<input class="btn-block" type="password" name="password" id="password" placeholder="请输入密码">
										</div>
									</div>
									<div class="control-group">
										<div class="controls clearfix">
											<label style="width: auto" class="checkbox pull-left">
												<input type="checkbox"> 记住密码
											</label> <a style="padding: 5px 0px 0px 5px;" href="#"
												class="pull-right">忘记密码?</a>
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<input type="submit" value="登陆" class="btn-block"/> 
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="row-fluid">
						<div style="text-align: center">
							<h5 style="color:#000">版权所有@ 2018<a href="">关于我们</a></h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../../../code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="assets/js/raphael-min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src='assets/js/sparkline.js'></script>
	<script type="text/javascript" src='assets/js/morris.min.js'></script>
	<script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.masonry.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.imagesloaded.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.facybox.js"></script>
	<script type="text/javascript" src="assets/js/jquery.elfinder.min.html"></script>
	<script type="text/javascript" src="assets/js/jquery.alertify.min.js"></script>
	<script type="text/javascript" src="assets/js/realm.js"></script>
</body>
</html>
