<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>编辑二级分类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/admin/assets/ico/favicon.html">
    <link href="${pageContext.request.contextPath }/admin/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/assets/css/theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/assets/css/alertify.css" rel="stylesheet">
    <link rel="Favicon Icon" href="${pageContext.request.contextPath }/admin/favicon.ico">
    <link href="http://fonts.useso.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css"> 
    
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
      <%@include file="../left.jsp" %>
      <!-- /Side menu -->

      	<!-- Main window -->
		<div class="main_container" id="tables_page">
			<div class="row-fluid">
				<ul class="breadcrumb">
					<li><a href="#">主页</a> <span class="divider">/</span></li>
					<li><a href="#">商城管理</a> <span class="divider">/</span></li>
					<li class="active">一级分类管理</li>
				</ul> 
			</div>

		<div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-group"></i>
              <h5>一级分类列表</h5>
              <div class="widget-buttons">
               
                  <span data-title="编辑一级分类" class="tip" target="_blank" id="add"><i class="icon-external-link"></i>添加</span>
                  <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i class="icon-chevron-up"></i></a>
              </div>
            </div>  
            <div class="widget-body">
              <div class="formbody">
		<div class="formtitle"><span>编辑二级分类</span></div>
			<form action="${pageContext.request.contextPath }/adminCategorySecond_update.action" method="post">
				<input type="hidden" name="csid" value="<s:property value="model.csid"/>" />
				<ul class="forminfo">
				<li><label>二级分类名称</label><input name="csname" id="csname" value="<s:property value="model.csname"/>" type="text" class="dfinput" maxlength="10" autofocus="autofocus" /><i id="error">分类名称不能超过10个字符</i></li>
              	<li><label>所属一级分类： <select name="category.cid">
              		<s:iterator var="c" value="cList"> 
              			  <option value="<s:property value="#c.cid"/>" <s:if test="model.category.cid==#c.cid">selected</s:if>><s:property value="#c.cname"/></option>
              		</s:iterator>
              		</select></label></li>
              		 <li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存" style="background-color: #119619" /></li>    
              	</ul>
			</form>
	    </div>
            </div> <!-- /widget-body -->
          </div> <!-- /widget -->
        </div> <!-- /row-fluid -->

		</div>
		<!-- /Main window -->

    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/raphael-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/bootstrap.js"></script>
    <script type="text/javascript" src='${pageContext.request.contextPath }/admin/assets/js/sparkline.js'></script>
    <script type="text/javascript" src='${pageContext.request.contextPath }/admin/assets/js/morris.min.js'></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.dataTables.min.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.masonry.min.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.imagesloaded.min.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.facybox.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.alertify.min.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/jquery.knob.js"></script>
    <script type='text/javascript' src='${pageContext.request.contextPath }/admin/assets/js/fullcalendar.min.js'></script>
    <script type='text/javascript' src='${pageContext.request.contextPath }/admin/assets/js/jquery.gritter.min.js'></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/assets/js/realm.js"></script>
    <script src="${pageContext.request.contextPath }/admin/assets/plugin/layer/layer.js" type="text/javascript"></script>
   
  </body>
</html>
 