<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="category">
	<ul class="category-list" id="js_climit_li">
		<s:iterator var="c" value="#session.cList">
			<li class="appliance js_toggle relative first">
				<div class="category-info">
					<h3 class="category-name b-category-name">
						<i><img
							src="${pageContext.request.contextPath }/images/cake.png"></i><a
							href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid" />&page=1"
							class="ml-22" title="点心"><s:property value="#c.cname" /></a>
					</h3>
					<em>&gt;</em>
				</div>
				<div class="menu-item menu-in top">
					<div class="area-in">
						<div class="area-bg">
							<div class="menu-srot">
								<div class="sort-side">

									<dl class="dl-sort">
										<dt>
											<a
												href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid" />&page=1"><span
												title="一级标题"><s:property value="#c.cname" /></span></a>
										</dt>
										<dt>
											<span>—————————————————————————————————————————————————</span>
										</dt>
										<s:iterator var="cs" value="#c.categorySeconds">
											<dd>
												<a title="二级标题" href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="#cs.csid" />&page=1"><s:property value="#cs.csname" /></a>
											</dd>
										</s:iterator>
									</dl>

								</div>

							</div>
						</div>
					</div>
				</div> <b class="arrow"></b>
			</li>
		</s:iterator>
	</ul>
</div>