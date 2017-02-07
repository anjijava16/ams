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
		<li <c:if test="${sessionScope.menuFlag == 'order'}">class="active"</c:if>><a href="<%=basePath%>/order/list"><i
				class="glyphicon glyphicon-chevron-right"></i>工单管理</a>
		</li>
		<li <c:if test="${sessionScope.menuFlag == 'schedule'}">class="active"</c:if>><a href="<%=basePath%>/order/list4schedule"><i
				class="glyphicon glyphicon-chevron-right"></i>排程管理</a>
		</li>
	</ul>
</div>