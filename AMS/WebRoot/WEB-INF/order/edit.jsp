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
	<link href="<%=basePath%>/assets/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

<link href="<%=basePath%>/css/common/base.css" rel="stylesheet" />
<link href="<%=basePath%>/vendors/datepicker.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>/vendors/chosen.min.css" rel="stylesheet" media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="<%=basePath%>/vendors/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/common/layer/layer.js"></script>
<script
	src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/shiro.demo.js"></script>
<script src="<%=basePath%>/vendors/bootstrap-datepicker.js"></script>
<script src="<%=basePath%>/assets/distpicker.data.js"></script>
<script src="<%=basePath%>/assets/distpicker.js"></script>
<script src="<%=basePath%>/assets/nation.js"></script>
<script src="<%=basePath%>/assets/main.js"></script>
<script src="<%=basePath%>/vendors/datatables/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/assets/DT_bootstrap.js"></script>
<script src="<%=basePath%>/assets/scripts.js"></script>
<script src="<%=basePath%>/order/orderadd.js"></script>
<script src="<%=basePath%>/assets/bootstrap-datetimepicker.js"></script>
<script src="<%=basePath%>/assets/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=basePath%>/vendors/chosen.jquery.min.js"></script>
</head>
<body data-target="#one" data-spy="scroll">
	<jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
	<div class="container"
		style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
		<div class="row">
		<jsp:include page="menu.jsp" flush="true"></jsp:include>
			<div class="col-md-10">
				<div class="modal-header">
					<h4 class="modal-title" id="addPermissionLabel">新增工单</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal"
						action="<%=basePath%>/order/insert" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label">客户</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" readonly="readonly" value="${cus_name }" />
								<input type="hidden" name="id" value="${order.id }" />
							</div>
							<label class="col-sm-2 control-label">车辆</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" readonly="readonly" value="${car_plates }" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">接车卡号</label>
							<div class="col-sm-3">
								<input name="car_num" type="text" class="form-control"
									value="${order.car_num }" placeholder="请输入接车卡号" />
							</div>
							<label class="col-sm-2 control-label">保单号</label>
							<div class="col-sm-3">
								<input name="insure_num" type="text" class="form-control"
									value="${order.insure_num }" placeholder="请输入保单号" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">行驶里程</label>
							<div class="col-sm-3">
								<input type="number" class="form-control" name="mileages"
									value="${order.mileages }" placeholder="请输入当前行驶里程">
							</div>
							<label class="col-sm-2 control-label">工时费</label>
							<div class="col-sm-3">
								<input name="hour_total" type="number" class="form-control"
									readonly="readonly" value="${order.hour_total }" />
							</div>
							
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备件费</label>
							<div class="col-sm-3">
								<input name="parts_total" type="number" class="form-control"
									readonly="readonly" value="${order.parts_total }" />
							</div>
							<label class="col-sm-2 control-label">附加费</label>
							<div class="col-sm-3">
								<input name="add_total" type="number" class="form-control"
									readonly="readonly" value="${order.add_total }" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">优惠金额</label>
							<div class="col-sm-3">
								<input name="dis_total" type="number" class="form-control"
									readonly="readonly" value="${order.dis_total }" />
							</div>
							<label class="col-sm-2 control-label">总金额</label>
							<div class="col-sm-3">
								<input name="total_price" type="number" class="form-control"
									readonly="readonly" value="${order.total_price }" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">接车时间</label>
							<div class="col-sm-4">
								<div class="input-group date form_datetime" data-link-field="start_time">
				                    <input class="form-control" size="16" type="text" value="<fmt:formatDate value="${order.start_time}" pattern="yyyy-MM-dd HH:mm"/>" readonly placeholder="请选择接车时间">
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
									<input type="hidden" id="start_time" name="start_time" value="" /><br/>
				                </div>
			                </div>
			                <label class="col-sm-2 control-label">服务顾问</label>
							<div class="col-sm-2">
								<select class="form-control" name="emp_id" disabled="disabled">
									<c:forEach items="${employees }" var="it">
										<option value="${it.id }"
											<c:if test="${order.emp_id == it.id}">selected</c:if>>${it.e_name}</option>
									</c:forEach>
								</select>
							</div>
		               </div>
		               <div class="form-group">
							<label class="col-sm-2 control-label">预计交车时间</label>
							<div class="col-sm-4">
								<div class="input-group date form_datetime" data-link-field="pre_end_time">
			                    <input class="form-control" size="16" type="text" value="<fmt:formatDate value="${order.pre_end_time}" pattern="yyyy-MM-dd HH:mm"/>" readonly placeholder="请选择接车时间">
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
								<input type="hidden" id="pre_end_time" name="pre_end_time" value="" /><br/>
			                </div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">报修描述</label>
							<div class="col-sm-5">
								<input name="rep_desc" type="text" class="form-control"
									value="${order.rep_desc }" placeholder="请输入报修描述" />
							</div>
							
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea name="bak" class="form-control" placeholder="请输入备注">${order.bak }</textarea>
							</div>
						</div>
				</div>
				<!-- div class="modal-header">
					<h5 class="modal-title" id="addPermissionLabel">工单项目</h5>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>维修项目类型</th>
							<th>维修</th>
							<th>工时</th>
							<th>附加工时</th>
							<th>工时单价</th>
							<th>工时总价</th>
							<th>维修班组</th>
							<th>维修工位</th>
						</tr>
						<c:if test="${itemList!=null && fn:length(itemList) > 0}">
							<c:forEach items="${itemList}" var="it">
								<tr>
									<td>${it.rep_item_type}</td>
									<td>${it.rep_type}</td>
									<td>${it.hour_num}</td>
									<td>${it.add_hour}</td>
									<td>${it.hour_price}</td>
									<td>${it.hour_total}</td>
									<td>${it.rep_group}</td>
									<td>${it.rep_station}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${itemList==null || fn:length(itemList) < 1}">
							<tr>
								<td class="text-center danger" colspan="8">没有工单项目</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="modal-header">
					<h5 class="modal-title" id="addPermissionLabel">工单备件</h5>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>备件编号</th>
							<th>备件名称</th>
							<th>数量</th>
							<th>单价</th>
							<th>单位</th>
							<th>折扣</th>
							<th>金额</th>
						</tr>
						<c:if test="${partsList!=null && fn:length(partsList) > 0}">
							<c:forEach items="${partsList}" var="it">
								<tr>
									<td>${it.parts_no}</td>
									<td>${it.parts_name}</td>
									<td>${it.num}</td>
									<td>${it.price}</td>
									<td>${it.company}</td>
									<td>${it.discount}</td>
									<td>${it.total}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${partsList==null || fn:length(partsList) < 1}">
							<tr>
								<td class="text-center danger" colspan="7">没有工单备件</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="modal-header">
					<h5 class="modal-title" id="addPermissionLabel">附加项目</h5>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>项目名称</th>
							<th>价格</th>
						</tr>
						<c:if test="${addList!=null && fn:length(addList) > 0}">
							<c:forEach items="${addList}" var="it">
								<tr>
									<td>${it.add_name}</td>
									<td>${it.add_total}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${addList==null || fn:length(addList) < 1}">
							<tr>
								<td class="text-center danger" colspan="2">没有找到客户信息</td>
							</tr>
						</c:if>
					</table>
				</div>
				 -->
				<div class="form-actions">
					<button type="submit" class="btn btn-large btn-block btn-primary">提交</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script>
    $('.form_datetime').datetimepicker({
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1,
        format:'yyyy-mm-dd hh:ii',
	    language: 'zh-CN'
    });
</script>
	
</body>
</html>