<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>商品列表</title>
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
					<li class="active">商品管理</li>
				</ul> 
			</div>

		<div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-group"></i>
              <h5>商品列表</h5>
              <div class="widget-buttons">
               
                  <a href="${pageContext.request.contextPath }/adminProduct_addPage.action" data-title="新增商品" class="tip" target="_blank"><i class="icon-external-link"></i>添加</a>
                  <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i class="icon-chevron-up"></i></a>
              </div>
            </div>  
            <div class="widget-body">
              <table id="users" class="table table-striped table-bordered dataTable">
                <thead>
                  <tr>
                    <th>序号</th>
                    <th>商品图片</th>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>是否热门</th>
                    <th>是否置顶</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody>
                <s:iterator var="product" value="pageBean.List" status="status">
                  <tr>
                    <td><s:property value="#status.count"/></td>
                    <td>
                    <img alt="商品图片" width="40" height="45" src="${pageContext.request.contextPath }/<s:property value="#product.image"/>">
                    </td>
                    <td><s:property value="#product.pname"/></td>
                    <td><s:property value="#product.shop_price"/></td>
                    <td>
                    <s:if test="#product.is_hot==1">
                    	是
                    </s:if>
                    <s:else>
                    	否
                    </s:else>
                    </td>
                    <td>
                    <s:if test="#product.is_top==1">
                    	是
                    </s:if>
                    <s:else>
                    	否
                    </s:else>
                    </td> 
                    <td>
                      <div class="btn-group">
                        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                       			 操作
                          <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pull-right">
                          <li><a href="${pageContext.request.contextPath }/adminProduct_edit.action?pid=<s:property value="#product.pid"/>"><i class="icon-edit"></i> 修改</a></li>
                          <li><a href="${pageContext.request.contextPath }/adminProduct_delete.action?pid=<s:property value="#product.pid"/>"><i class="icon-trash"></i> 删除</a></li>
                        </ul>
                      </div>
                    </td>
                  </tr>
                  </s:iterator>
                   
                </tbody>
              </table>
              <tr>
                   <td>
                   	第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   	<s:if test="pageBean.page!=1">
                   		<a href="${pageContext.request.contextPath }/adminProduct_findAll.action?page=1">首页</a>
                   		<a href="${pageContext.request.contextPath }/adminProduct_findAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a>
                   	</s:if>
                   	<s:if test="pageBean.page!=pageBean.totalPage">
                   		<a href="${pageContext.request.contextPath }/adminProduct_findAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a>
                   		<a href="${pageContext.request.contextPath }/adminProduct_findAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>
                    </s:if>	
                   </td>
               </tr>
              
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
    <script type="text/javascript">
    $(function() {
        $("#add").on("click", function() {
            //iframe层-父子操作
            parent.layer.open({
                type : 2,
                title:"一级分类管理 |新增 ",
                area : [ '700px', '530px' ],
                fixed : false, //不固定
                //maxmin: true,
                content : '${pageContext.request.contextPath }/admin/product/add.jsp'
            });
        });
    });
    
    function update(dept_id){
        //使用占位符来传递数据
       parent.layer.open({
           type : 2,
           title:"部门管理 | 编辑 ",
           area : [ '700px', '530px' ],
           fixed : false, //不固定
           //maxmin: true,
           content : 'sys/department/update/'+dept_id
       });
    }
    
    function doDelete(dept_id){
    	if(window.confirm("你确定要执行该操作吗?")){
    		$.post("sys/department/delete",{dept_id:dept_id,_method:"delete"},function(data){
    			if(data.flag=="success"){
    				//刷新窗口
    				window.location.reload();
    				return;
    			}else{
    				alert(data.message);
    				return;
    			}
    		});
    	}
    }
</script>
  </body>
</html>
