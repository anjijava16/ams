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
<script src="<%=basePath%>/vendors/flot/jquery.flot.pie.js"></script>
<script>
	//时间选择框
	$(function() {
		$(".datepicker").datepicker();
		var partsList = ${partsList};
		var numData = [];
		var priceData = [];
		var totalNum = 0;
		var totalPrice = 0;
		$.each(partsList, function(i,obj){
   			totalNum += parseFloat(obj.num);
   			totalPrice += parseFloat(obj.price);
   		});
		$.each(partsList, function(i,obj){
   			numData[i] = {
                label: obj.parts_name,
                data: (obj.num / totalNum) * 100
            };
   			priceData[i] = {
                label: obj.parts_name,
                data: (obj.price / totalPrice) * 100
            };
   		});
        $.plot('#piechart1', numData, {
            series: {
                pie: { 
                    show: true,
                    radius: 1,
                    label: {
                        show: true,
                        radius: 3/4,
                        formatter: labelFormatter,
                        background: { 
                            opacity: 0.5,
                            color: '#000'
                        }
                    }
                }
            },
            legend: {
                show: false
            }
        });
           
        $.plot('#piechart2', priceData, {
            series: {
                pie: {
                    show: true,
                    radius: 1,
                    tilt: 0.5,
                    label: {
                        show: true,
                        radius: 1,
                        formatter: labelFormatter,
                        background: {
                            opacity: 0.8
                        }
                    },
                    combine: {
                        color: '#999',
                        threshold: 0.1
                    }
                }
            },
            legend: {
                show: false
            }
        });
	});
	
	function labelFormatter(label, series) {
            return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
    }
</script>
</head>
<body data-target="#one" data-spy="scroll">
	<jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
	<div class="container"
		style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
		<div class="row">
		<jsp:include page="menu.jsp" flush="true"></jsp:include>
			<div class="col-md-10">
				<h2>备件统计</h2>
				<hr>
				<form method="post" action="/AMS/statistics/partsSta" id="formId" class="form-inline">
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
							<th>备件名称</th>
							<th>销售数量</th>
							<th>销售收入</th>
						</tr>
						<c:if test="${partsList!=null && fn:length(partsList) > 0}">
							<c:forEach items="${partsList}" var="it">
								<tr>
									<td>${it.parts_name}</td>
									<td>${it.num}</td>
									<td>${it.price}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${partsList==null || fn:length(partsList) < 1}">
							<tr>
								<td class="text-center danger" colspan="5">没有找到相关信息</td>
							</tr>
						</c:if>
					</table>
				</form>
				<div class="row-fluid">
				<div class="block col-md-10">
                    <div class="navbar navbar-inner block-header">
                        <div class="muted pull-left">销售数量</div>
                    </div>
                    <div class="block-content collapse in">
                        <div class="span12">
                           <div id="piechart1" style="width:100%;height:200px"></div>
                        </div>
                    </div>
	                  <div class="navbar navbar-inner block-header">
	                      <div class="muted pull-left">销售收入</div>
	                  </div>
	                  <div class="block-content collapse in">
	                      <div class="span12">
	                         <div id="piechart2" style="width:100%;height:200px"></div>
	                      </div>
	                  </div>
	              </div>
	        </div>
			</div>
		</div>
	</div>
</body>
</html>