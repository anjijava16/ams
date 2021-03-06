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
<title>系统管理 —工单管理</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<link
	href="<%=basePath%>/js/common/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">

<link href="<%=basePath%>/css/common/base.css" rel="stylesheet" />
<link href="<%=basePath%>/vendors/datepicker.css" rel="stylesheet" />
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="<%=basePath%>/vendors/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/common/layer/layer.js"></script>
<script src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/shiro.demo.js"></script>
<script src="<%=basePath%>/vendors/bootstrap-datepicker.js"></script>
<script src="<%=basePath%>/vendors/flot/jquery.flot.js"></script>
<script src="<%=basePath%>/vendors/flot/jquery.flot.categories.js"></script>
<script>
	//时间选择框
	$(function() {
		$(".datepicker").datepicker();
		var oiList = ${oiList};
		var data = [${empNum}];
		$.each(oiList, function(i,obj){
			data[i] = [obj.rep_emp_name, obj.hour_total];
		});
        $.plot("#catchart", [ data ], {
            series: {
                bars: {
                    show: true,
                    barWidth: 0.6,
                    align: "center"
                }
            },
            xaxis: {
                mode: "categories",
                tickLength: 0
            }
        });
	});
</script>
</head>
<body data-target="#one" data-spy="scroll">
	<jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
	<div class="container"
		style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
		<div class="row">
		<jsp:include page="menu.jsp" flush="true"></jsp:include>
			<div class="col-md-10">
				<h2>工作量统计</h2>
				<hr>
				<form method="post" action="/AMS/statistics/orderSta" id="formId" class="form-inline">
					<div clss="well">
						<div class="form-group">
							<input name="start_time" type="text" class="input-xlarge datepicker"
									value="${start_time}" placeholder="请选择开始日期"/>
						</div>
						<div class="form-group">
							<input name="end_time" type="text" class="input-xlarge datepicker"
									value="${end_time}" placeholder="请选择结束日期"/>
						</div>
						<span class="">
							<button type="submit" class="btn btn-primary">查询</button>
						</span>
					</div>
					<hr>
					<table class="table table-striped table-bordered">
						<tr>
							<th>工人名称</th>
							<th>工作量（小时）</th>
						</tr>
						<c:if test="${oiList!=null && fn:length(oiList) > 0}">
							<c:forEach items="${oiList}" var="it">
								<tr>
									<td>${it.rep_emp_name}</td>
									<td>${it.hour_total}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${oiList==null || fn:length(oiList) < 1}">
							<tr>
								<td class="text-center danger" colspan="5">没有找到相关信息</td>
							</tr>
						</c:if>
					</table>
				</form>
				<div class="row-fluid">
            <div class="navbar navbar-inner block-header">
                <div class="muted pull-left">工作量实时柱状图</div>
            </div>
            <div class="block-content collapse in">
                <div class="span12">
                    <div id="catchart" style="width:100%;height:300px"></div>
                </div>
            </div>
    </div>
			</div>
		</div>
	</div>
</body>
</html>