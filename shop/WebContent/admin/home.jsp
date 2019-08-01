<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>建大商城管理系统主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">
    <link rel="shortcut icon" href="assets/ico/favicon.html">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/theme.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/alertify.css" rel="stylesheet">
    <link href="http://fonts.useso.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">
    <link rel="Favicon Icon" href="favicon.ico"> 
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
     
      <!-- 左侧菜单 -->
      <%@include file="left.jsp" %>

      <!-- Main window -->
      <div class="main_container" id="dashboard_page">
        <div class="row-fluid">
          
        </div>  


        <!-- CHARTS  -->
         <!-- /row-fluid -->

          <div class="row-fluid">
            <div class="widget widget-padding span4">
              <div class="widget-header">
                <i class="icon-circle"></i>
                <h5>建大商城JDshop</h5>
                <div class="widget-buttons">
                    <a href="javascript:void(0)" class="collapse" data-collapsed="false"><i data-title="Collapse" class="icon-chevron-up"></i></a>
                </div>
              </div>
              <div class="widget-body" style="min-height: 170px;">
              	<p>一家专门为建大学子做特卖的网站<a href="index.action"> 商城网址：http://localhost:8080/shop/index.action</a></p>
              	<p><span class="label label-danger">温馨提示:</span> </p>
             		<jsp:useBean id="time" class="java.util.Date"/>	
                		<p>当前时间 : <%=time %></p>
              </div><!-- /widget-body -->
            </div><!-- /widget -->
           
            <div class="widget widget-padding span8">
              <div class="widget-header">
                <i class="icon-bar-chart"></i>
                <h5>员工工作状态</h5>
                <div class="widget-buttons">
                    <a href="javascript:void(0)" class="collapse" data-collapsed="false"><i data-title="Collapse" class="icon-chevron-up"></i></a>
                </div>
              </div>
              
              <div class="widget-body clearfix" style="height: 170px;" id="widget-tasks">
                <div class="widget-tasks-statistics">
                  <div class="userstats clearfix" style="margin-top: 25px;">
                      <a href="javascript:void(0)" data-toggle="modal" data-target="#task_modal">
                      <img src="assets/img/avatars/07.jpg" class="image">
                      <div class="widget">
                        <input class="knob" data-width="75" data-height="75" data-displayInput=false data-readOnly=true data-thickness=".3" value="85">   
                      </div>
                      <p>${existAdminUser.name}</p>
                    </a>
                  </div>
                  <div class="userstats clearfix" style="margin-top: 25px;">
                  	<div class="widget">
                  		<a href="">点击签到</a>
                    </div>
                  </div>
                  <div class="userstats clearfix">
                      
                  </div>
                  <div class="userstats clearfix">
                      
                  </div>
                  <div class="userstats clearfix">
                      
                  </div>
                </div>
                
              </div>
              
            </div>
          </div><!-- /row-fluid -->



        <div class="row-fluid">

          <div class="widget span12">
            <div class="widget-header">
              <i class="icon-comment-alt"></i>
              <h5>系统公告</h5>
              <div class="widget-buttons">
                  <a href="javascript:void(0)" class="collapse" data-collapsed="false"><i data-title="Collapse" class="icon-chevron-up"></i></a>
              </div>
            </div>  
            <div class="widget-body" style="height:310px;overflow:hidden">
              <div class="widget-comments clearfix slimscroll">
                <ul>
                  <li>
                    <img src="assets/img/avatars/04.jpg" class="avatar"/>
                    <div class="comment-bubble">
                      <h4>管理员</h4>
                      	重新审核5月23的商品
                      <div class="date">2018/05/25</div>
                      <div class="settings">
                        <a href="javascript:void(0)" class="tip" data-title="Reply"><i class="icon-reply"></i></a><a href="javascript:void(0)" class="tip" data-title="Delete"><i class="icon-trash"></i></a><a href="javascript:void(0)" class="tip" data-title="Edit"><i class="icon-edit"></i></a>
                      </div>
                    </div>
                  </li>
                  <li>
                    <img src="assets/img/avatars/04.jpg" class="avatar"/>
                    <div class="comment-bubble">
                      <h4>管理员</h4>
                      	5月11日下午14：30，会议室208，全体会议
                      <div class="date">2018/05/25</div>
                      <div class="settings">
                        <a href="javascript:void(0)" class="tip" data-title="Reply"><i class="icon-reply"></i></a><a href="javascript:void(0)" class="tip" data-title="Delete"><i class="icon-trash"></i></a><a href="javascript:void(0)" class="tip" data-title="Edit"><i class="icon-edit"></i></a>
                      </div>
                    </div>
                  </li>
                  <li>
                    <img src="assets/img/avatars/04.jpg" class="avatar"/>
                    <div class="comment-bubble">
                      <h4>管理员</h4>
                      	各位同仁，新年好！
                      <div class="date">2018/01/01</div>
                      <div class="settings">
                        <a href="javascript:void(0)" class="tip" data-title="Reply"><i class="icon-reply"></i></a><a href="javascript:void(0)" class="tip" data-title="Delete"><i class="icon-trash"></i></a><a href="javascript:void(0)" class="tip" data-title="Edit"><i class="icon-edit"></i></a>
                      </div>
                    </div>
                  </li>
                  
                  
                </ul>
              </div>
            </div><!--/widget-body-->
          
          </div> <!-- /widget span5 -->
        </div> <!-- /row-fluid -->
		<div class="widget-header">
			商城后台管理系统 <a href="index.action" target="_blank" title="商城首页">商城首页</a> <em>© 2015-2025 JDshop.com 版权所有 <a href="#" target="_blank" title="建大商城">建大商城JDshop</a></em>
		</div>
      </div>
      <!-- /Main window -->
      
    </div><!--/.fluid-container-->
    </div><!-- wrap ends-->


    <!-- example modal -->
    <div id="example_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Support Ticket</h3>
      </div>
      <div class="modal-body">
        <p>Here you can view and manage this support ticket.</p>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary">Save changes</button>
      </div>
    </div> 

    <!-- example modal -->
    <div id="example_modal2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Example Modal</h3>
      </div>
      <div class="modal-body">
        <p>Here you can write more information about the object you clicked</p>
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
        <button class="btn btn-primary">Save changes</button>
      </div>
    </div> 



    <!-- task_modal modal -->
    <div id="task_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">员工详细信息</h3>
      </div>
      <div class="modal-body">
        <div class="clearfix">
          <img src="assets/img/avatars/07.jpg" class="img-circle" style="float: left; width: 65px; margin-right: 20px;">
           <h3 style="margin:0">${existAdminUser.name}</h3>
           <p class="muted">${existAdminUser.username}</p>
        </div>
        <hr>
        <h5>性别</h5>
        <p>${existAdminUser.sex}</p>
        <hr>
        <h5>联系电话</h5>
        <p>${existAdminUser.phone}</p>
        <hr>
       
        
      </div>
      <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
      </div>
    </div> 



    <script type="text/javascript" src="assets/js/jquery.min.js"></script>
     <!-- 安全退出 -->
	<script type="text/javascript">
		$(function() {
			$("#loginout").on("click", function() {
				alert("8888")
				if (confirm("确定退出系统?")) {
					window.top.location = "index.jsp";
				}
			});
		});
	</script>
    <script type="text/javascript" src="assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="assets/js/raphael-min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <script type="text/javascript" src='assets/js/sparkline.js'></script>
    <script type="text/javascript" src='assets/js/morris.min.js'></script>
    <script type="text/javascript" src="assets/js/jquery.dataTables.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.masonry.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.imagesloaded.min.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.facybox.js"></script>   
    <script type="text/javascript" src="assets/js/jquery.alertify.min.js"></script> 
    <script type="text/javascript" src="assets/js/jquery.knob.js"></script>
    <script type='text/javascript' src='assets/js/fullcalendar.min.js'></script>
    <script type='text/javascript' src='assets/js/jquery.gritter.min.js'></script>
    <script type="text/javascript" src="assets/js/realm.js"></script>
   
  </body>
</html>
