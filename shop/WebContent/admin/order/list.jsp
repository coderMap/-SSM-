<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>订单列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Bluth Company">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/admin/assets/ico/favicon.html">
    <link href="${pageContext.request.contextPath }/admin/assets/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/assets/css/theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/admin/assets/css/alertify.css" rel="stylesheet">
    <link rel="Favicon Icon" href="${pageContext.request.contextPath }/admin/favicon.ico">
    <link href="http://fonts.useso.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css"> 
    <script type="text/javascript">
    function showDetail(oid){
		var but = document.getElementById("but"+oid);
		var div1 = document.getElementById("div"+oid);
		if(but.value == "订单详情"){
			// 1.创建异步对象
			var xhr = createXmlHttp();
			// 2.设置监听
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						
						div1.innerHTML = xhr.responseText;
					}
				}
			}
			// 3.打开连接
			xhr.open("GET","${pageContext.request.contextPath}/adminOrder_findOrderItem.action?oid="+oid+"&time="+new Date().getTime(),true);
			// 4.发送
			xhr.send(null);
			but.value = "关闭";
		}else{
			div1.innerHTML = "";
			but.value="订单详情";
		}
		
	}
	function createXmlHttp(){
		   var xmlHttp;
		   try{ // Firefox, Opera 8.0+, Safari
		        xmlHttp=new XMLHttpRequest();
		    }
		    catch (e){
			   try{// Internet Explorer
			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			      }
			    catch (e){
			      try{
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      catch (e){}
			      }
		    }

			return xmlHttp;
		 }
    </script>
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
					<li><a href="#">订单管理</a> <span class="divider">/</span></li>
					<li class="active">订单管理</li>
				</ul> 
			</div>

		<div class="row-fluid">
          <div class="widget widget-padding span12">
            <div class="widget-header">
              <i class="icon-group"></i>
              <h5>订单列表</h5>
              <div class="widget-buttons">
               
                  <a href="#" data-title="Collapse" data-collapsed="false" class="tip collapse"><i class="icon-chevron-up"></i></a>
              </div>
            </div>  
            <div class="widget-body">
              <table id="users" class="table table-striped table-bordered dataTable">
                <thead>
                  <tr>
                    <th>序号</th>
                    <th>订单编号</th>
                    <th>收货人</th>
                    <th>订单总金额</th>
                    <th>订单时间</th>
                    <th>联系电话</th>
                    <th>收货地址</th>
                    <th>订单状态</th>
                    <th>订单详情</th>
                  </tr>
                </thead>
                <tbody>
                <s:iterator var="order" value="pageBean.List" status="status">
                  <tr>
                    <td><s:property value="#status.count"/></td>
                    <td><s:property value="#order.oid"/></td>
                    <td><s:property value="#order.name"/></td>
                    <td><s:property value="#order.total"/></td>
                    <td><s:property value="#order.ordertime"/></td>
                    <td><s:property value="#order.phone"/></td>
                    <td><s:property value="#order.addr"/></td>
                    <td>
                    <s:if test="#order.state==1">
                    	<font color="red">未付款</font>
                    </s:if>
                    <s:if test="#order.state==2">
                    	已经付款<a href="${pageContext.request.contextPath }/adminOrder_updateState.action?oid=<s:property value="#order.oid"/>"><font color="blue">点此发货</font></a>
                    </s:if>
                    <s:if test="#order.state==3">
                    	<font color="#990887">未确认收货</font>
                    </s:if>
                    <s:if test="#order.state==4">
                    	<font color="green">交易完成</font>
                    </s:if>
                    </td>
                    <td>
                    	点击查看
                      <div class="btn-group">
                        <input id="but<s:property value="#order.oid"/>" type="button" value="订单详情" onclick="showDetail(<s:property value="#order.oid"/>)" />
                        <div id="div<s:property value="#order.oid"/>">
                        
                        </div> 
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
                   		<a href="${pageContext.request.contextPath }/adminOrder_findAll.action?page=1">首页</a>
                   		<a href="${pageContext.request.contextPath }/adminOrder_findAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a>
                   	</s:if>
                   	<s:if test="pageBean.page!=pageBean.totalPage">
                   		<a href="${pageContext.request.contextPath }/adminOrder_findAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a>
                   		<a href="${pageContext.request.contextPath }/adminOrder_findAll.action?page=<s:property value="pageBean.totalPage"/>">尾页</a>
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
