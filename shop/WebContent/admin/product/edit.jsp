<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>修改商品</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Bluth Company">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/admin/assets/ico/favicon.html">
<link
	href="${pageContext.request.contextPath }/admin/assets/css/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/admin/assets/css/theme.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/admin/assets/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/admin/assets/css/alertify.css"
	rel="stylesheet">
<link rel="Favicon Icon"
	href="${pageContext.request.contextPath }/admin/favicon.ico">
<link href="http://fonts.useso.com/css?family=Open+Sans:400,700"
	rel="stylesheet" type="text/css">

</head>
<body>
	<div id="wrap">
		   <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
      <div class="container-fluid">
          <div class="logo"> 
            <span style="color:yellow;font-size:28px">建大商城后台管理系统</span>
          </div>
           <a class="btn btn-navbar visible-phone" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
           <a class="btn btn-navbar slide_menu_left visible-tablet">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>

          <div class="top-menu visible-desktop">
            <ul class="pull-left">
              <li><a id="messages" data-notification="2" href="#"><i class="icon-envelope"></i> 消息</a></li>
              <li><a id="notifications" data-notification="3" href="#"><i class="icon-globe"></i> 通知</a></li>
            </ul>
            <ul class="pull-right">
            <!-- 从session中获取用户信息 -->
             <li><a href="javascript:void(0)">${existAdminUser.name} 您好!</a></li>  
			<li><a href="javascript:void(0)" id="loginout"><i class="icon-off"></i> 退出登陆</a></li>
            </ul>
          </div>

          <div class="top-menu visible-phone visible-tablet">
            <ul class="pull-right">  
              <li><a title="link to View all Messages page, no popover in phone view or tablet" href="#"><i class="icon-envelope"></i></a></li>
              <li><a title="link to View all Notifications page, no popover in phone view or tablet" href="#"><i class="icon-globe"></i></a></li>
              <li><a href="login.html"><i class="icon-off"></i></a></li>
            </ul>
          </div>

        </div>
      </div>
    </div>

		<div class="container-fluid">

			<!-- Side menu -->
			<%@include file="../left.jsp"%>
			<!-- /Side menu -->

			<!-- Main window -->
			<div class="main_container" id="tables_page">
				<div class="row-fluid">
					<ul class="breadcrumb">
						<li><a href="#">主页</a> <span class="divider">/</span></li>
						<li><a href="#">商品管理</a> <span class="divider">/</span></li>
						<li class="active">修改商品</li>
					</ul>
				</div>

				<div class="row-fluid">
					<div class="widget widget-padding span12">
						<div class="widget-header">
							<i class="icon-group"></i>
							<h5>修改商品信息</h5>
							<div class="widget-buttons">

								<span data-title="编辑一级分类" class="tip" target="_blank" id="add"><i
									class="icon-external-link"></i>添加</span> <a href="#"
									data-title="Collapse" data-collapsed="false"
									class="tip collapse"><i class="icon-chevron-up"></i></a>
							</div>
						</div>
						<div class="widget-body">
							<div class="formbody">
								
								<form action="${pageContext.request.contextPath}/adminProduct_update.action" method="post" enctype="multipart/form-data">
									<input type="hidden" name="pid" value="<s:property value="model.pid"/>" >
									<input type="hidden" name="image" value="<s:property value="model.image"/>" >
									<table id="users" class="table table-striped table-bordered dataTable">
                						 
                						<tr>
											<td width="18%" align="center">
												商品名称：
											</td>
											<td >
												<input type="text" name="pname" value="<s:property value="model.pname"/>" id="userAction_save_do_logonName" class="bg"/>
											</td>
											<td width="18%" align="center">
												商品图片：
											</td>
											<td >
												<input type="file" name="upload" />
											</td>
										</tr>
										<tr>
											<td width="18%" align="center" >
												市场价格：
											</td>
											<td >
												<input type="text" name="market_price" value="<s:property value="model.market_price"/>" id="userAction_save_do_logonName" class="bg"/>
											</td>
											<td width="18%" align="center" >
												商城价格：
											</td>
											<td>
												<input type="text" name="shop_price" value="<s:property value="model.shop_price"/>" id="userAction_save_do_logonName" class="bg"/>
											</td>
										</tr>
										<tr>
										<td width="18%" align="center" >
												是否热门：
											</td>
											<td>
												<select name="is_hot">
													<option value="1" <s:if test="model.is_hot==1">selected</s:if>>是</option>
													<option value="0" <s:if test="model.is_hot==0">selected</s:if>>否</option>
												</select>
											</td>
											<td width="18%" align="center">
												是否置顶：
											</td>
											<td>
												<select name="is_top">
													<option value="1" <s:if test="model.is_top==1">selected</s:if>>是</option>
													<option value="0" <s:if test="model.is_top==0">selected</s:if>>否</option>
												</select>
											</td>
										</tr>
										<tr>
											<td width="18%" align="center">
												所属的二级分类：
											</td>
											<td class="ta_01" bgColor="#ffffff" colspan="3">
												<select name="categorySecond.csid">
													<s:iterator var="cs" value="csList"> 
														<option value="<s:property value="#cs.csid"/>"<s:if test="#cs.csid ==model.categorySecond.csid">selected</s:if>><s:property value="#cs.csname"/></option>
													</s:iterator>
												</select>
											</td>
										</tr>
										<tr>
											<td width="18%" align="center" >
												商品描述：
											</td>
											<td colspan="3">
												<textarea name="pdesc" rows="5" cols="30"><s:property value="model.pdesc"/></textarea>
											</td>
										</tr>
										<tr>
											<td  style="WIDTH: 100%" align="center"
												bgColor="#f5fafe" colSpan="4">
												<button type="submit" id="userAction_save_do_submit" value="确定" class="button_ok">
													&#30830;&#23450;
												</button>
						
												<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
												<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button>
						
												<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
												<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回"/>
												<span id="Label1"></span>
											</td>
										</tr> 
                					</table>
									
								</form>
							</div>
						</div>
						<!-- /widget-body -->
					</div>
					<!-- /widget -->
				</div>
				<!-- /row-fluid -->

			</div>
			<!-- /Main window -->

		</div>
		<!--/.fluid-container-->
	</div>
	<!-- wrap ends-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/raphael-min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/bootstrap.js"></script>
	<script type="text/javascript"
		src='${pageContext.request.contextPath }/admin/assets/js/sparkline.js'></script>
	<script type="text/javascript"
		src='${pageContext.request.contextPath }/admin/assets/js/morris.min.js'></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/jquery.masonry.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/jquery.imagesloaded.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/jquery.facybox.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/jquery.alertify.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/jquery.knob.js"></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath }/admin/assets/js/fullcalendar.min.js'></script>
	<script type='text/javascript'
		src='${pageContext.request.contextPath }/admin/assets/js/jquery.gritter.min.js'></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/assets/js/realm.js"></script>
	<script
		src="${pageContext.request.contextPath }/admin/assets/plugin/layer/layer.js"
		type="text/javascript"></script>

</body>
</html>
