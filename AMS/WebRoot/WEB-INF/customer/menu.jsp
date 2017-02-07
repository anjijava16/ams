<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<div id="one" class="col-md-2" style="width:10.667%;">
	<ul data-spy="affix"
		class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu"
		style=" left:0;top: 151px; z-index: 100;">
		<li <c:if test="${sessionScope.menuFlag == 'customer'}">class="active"</c:if>><a href="<%=basePath%>/customer/list"><i
				class="glyphicon glyphicon-chevron-right"></i>客户列表</a>
		</li>
		<li <c:if test="${sessionScope.menuFlag == 'car'}">class="active"</c:if>><a href="<%=basePath%>/customer/listCar"><i
				class="glyphicon glyphicon-chevron-right"></i>车辆列表</a>
		</li>
		<li <c:if test="${sessionScope.menuFlag == 'link'}">class="active"</c:if>><a href="<%=basePath%>/customer/listLinkman"><i
				class="glyphicon glyphicon-chevron-right"></i>联系人列表</a>
		</li>
		<li <c:if test="${sessionScope.menuFlag == 'review'}">class="active"</c:if>><a href="<%=basePath%>/review/list"><i
				class="glyphicon glyphicon-chevron-right"></i>维修客户回访</a>
		</li>
		<li <c:if test="${sessionScope.menuFlag == 'question'}">class="active"</c:if>><a href="<%=basePath%>/review/listQuestion"><i
				class="glyphicon glyphicon-chevron-right"></i>回访问题管理</a>
		</li>
		<li <c:if test="${sessionScope.menuFlag == 'ask'}">class="active"</c:if>><a href="<%=basePath%>/review/listAsk"><i
				class="glyphicon glyphicon-chevron-right"></i>回访模板管理</a>
		</li>
	</ul>
</div>