<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8" />
<title>系统管理 —回访管理</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<link
	href="<%=basePath%>/js/common/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">

<link href="<%=basePath%>/css/common/base.css" rel="stylesheet" />
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="<%=basePath%>/vendors/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/common/layer/layer.js"></script>
<script src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/shiro.demo.js"></script>
</head>
<body data-target="#one" data-spy="scroll">
	<jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
	<div class="container"
		style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
		<div class="row">
		<jsp:include page="../customer/menu.jsp" flush="true"></jsp:include>
			<div class="col-md-10">
				<h2>回访单列表</h2>
				<hr>
				<form method="post" action="/AMS/review/list" id="formId" class="form-inline">
					<div clss="well">
						<div class="form-group">
							<input type="text" class="form-control" style="width: 300px;"
								value="${findContent}" name="findContent" id="findContent"
								placeholder="输入客户姓名 / 车牌号/ 联系人姓名">
						</div>
						<span class="">
							<button type="submit" class="btn btn-primary">查询</button>
						</span>
					</div>
					<hr>
					<table class="table table-striped table-bordered">
						<tr>
							<th>客户姓名</th>
							<th>车牌号</th>
							<th>联系人姓名</th>
							<th>电话号码</th>
							<th>是否满意</th>
							<th>操作</th>
						</tr>
						<c:if test="${page.list!=null && fn:length(page.list) > 0}">
							<c:forEach items="${page.list}" var="it">
								<tr>
									<td>${it.cus_name}</td>
									<td>${it.car_plates}</td>
									<td>${it.link_name}</td>
									<td>${it.tel}</td>
									<td><c:if test="${it.sati==0}">满意</c:if><c:if test="${it.sati==1}">不满意</c:if></td>
									<td>
									<a href="javascript:deleteCus([${it.id}]);">删除</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="6">没有找到相关信息</td>
							</tr>
						</c:if>
					</table>
					<c:if test="${page.list!=null && fn:length(page.list) > 0}">
						<div class="pagination pull-right">${page.pageHtml}</div>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	<script>
        function deleteCus(id){
			var index = layer.confirm("确定要删除这项吗？",function(){
			var load = layer.load();
			location.href="<%=basePath %>/customer/delete?id="+id;
			});
        }
        </script>
</body>
</html>