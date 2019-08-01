<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar-nav nav-collapse collapse">
	<div class="accordion" id="accordion2">
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle active b_F79999" href="javascript:void(0)"><i class="icon-dashboard"></i> <span>菜单导航</span></a>
            </div>
          </div>
          
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_9FDDF6 collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapse2"><i class="icon-reorder"></i> <span>商城管理</span></a>
            </div>
            <div id="collapse2" class="accordion-body collapse">
              <div class="accordion-inner">
                <a class="accordion-toggle" href="${pageContext.request.contextPath}/adminCategory_findAll.action"><i class="icon-rss"></i> 一级分类管理</a>
                <a class="accordion-toggle" href="${pageContext.request.contextPath}/adminCategorySecond_findAll.action?page=1"><i class="icon-calendar"></i> 二级分类管理</a>
              </div>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_F6F1A2" href="${pageContext.request.contextPath}/adminProduct_findAll.action?page=1"><i class="icon-tasks"></i> <span>商品管理</span></a>
            </div>
          </div>
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_C1F8A9" href="${pageContext.request.contextPath}/adminOrder_findAll.action?page=1"><i class="icon-bar-chart"></i> <span>订单管理</span></a>
            </div>
          </div> 
          
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_F5C294" href="${pageContext.request.contextPath}/user_findAll.action?page=1"><i class="icon-user"></i> <span>用户管理</span></a>
            </div>
          </div>  
          <div class="accordion-group">
            <div class="accordion-heading">
              <a class="accordion-toggle b_9FDDF6" href="javascript:void(0)"><i class="icon-bullhorn"></i> <span>更多</span></a>
            </div>
          </div>     
        </div>
</div>