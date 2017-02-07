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
		<li <c:if test="${sessionScope.menuFlag == 'sorder'}">class="active"</c:if>><a href="<%=basePath%>/statistics/orderSta"><i
				class="glyphicon glyphicon-chevron-right"></i>工单统计</a>
		</li>
		<li <c:if test="${sessionScope.menuFlag == 'sparts'}">class="active"</c:if>><a href="<%=basePath%>/statistics/partsSta"><i
				class="glyphicon glyphicon-chevron-right"></i>备件统计</a>
		</li>
		<li <c:if test="${sessionScope.menuFlag == 'semp'}">class="active"</c:if>><a href="<%=basePath%>/statistics/empSta"><i
				class="glyphicon glyphicon-chevron-right"></i>工作量统计</a>
		</li>
	</ul>
</div>