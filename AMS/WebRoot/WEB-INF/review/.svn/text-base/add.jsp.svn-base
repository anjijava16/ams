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
		<jsp:include page="../customer/menu.jsp" flush="true"></jsp:include>
			<div class="col-md-10">
				<div class="modal-header">
					<h4 class="modal-title" id="addPermissionLabel">新增回访</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="<%=basePath%>/review/insert" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label">客户</label>
							<div class="col-sm-3">
								<select id="cus" class="form-control" name="cus_id" onchange="getCusCars();">
                                  <option>请选择客户</option>
                                  <c:forEach items="${customers }" var="it">
										<option value="${it.id }"
										<c:if test="${it.id == order.cus_id}">selected</c:if>>${it.cus_name}</option>
									</c:forEach>
                                </select>
								<input type="hidden" name="id" value="${review.id }" />
								<input type="hidden" name="order_id" value="${order.id }" />
							</div>
							<label class="col-sm-2 control-label">车辆</label>
							<div class="col-sm-3">
								<select class="form-control" name="car_id" id="car_plates">
									<option>请选择车辆</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-3">
								<select class="form-control" name="link_id" id="linkman" onchange="setTel();">
									<option>请选择联系人</option>
								</select>
							</div>
							<label class="col-sm-2 control-label">手机号</label>
							<div class="col-sm-3">
								<input type="text" id="tel" name="tel" class="form-control" readonly="readonly"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">回访模板</label>
							<div class="col-sm-3">
								<select class="form-control" name="ans_id" id="ans_id">
									<option>请选择模板</option>
									<c:forEach items="${askList }" var="it">
										<option value="${it.id }" >${it.ask_name}</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 control-label">是否满意</label>
							<div class="col-sm-3">
								<select class="form-control" name="sati" id="sati">
									<option value="0">满意</option>
									<option value="1" >不满意</option>
								</select>
							</div>
						</div>
		               <div class="form-group">
							<label class="col-sm-2 control-label">回访时间</label>
							<div class="col-sm-5">
								<div class="input-group date form_datetime" data-link-field="start_time">
				                    <input class="form-control" size="16" type="text" value="" readonly placeholder="请选择下次回访时间">
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
									<input type="hidden" id="rvw_time" name="rvw_time" value="" /><br/>
				                </div>
			                </div>
		                </div>
		               <div class="form-group">
							<label class="col-sm-2 control-label">下次回访时间</label>
							<div class="col-sm-5">
								<div class="input-group date form_datetime" data-link-field="start_time">
				                    <input class="form-control" size="16" type="text" value="" readonly placeholder="请选择下次回访时间">
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
									<input type="hidden" id="next_rvw" name="next_rvw" value="" /><br/>
				                </div>
			                </div>
						</div>
		               <div class="form-group">
							<label class="col-sm-2 control-label">访谈概述</label>
							<div class="col-sm-5">
								<input name="rvw_con" type="text" class="form-control" placeholder="请输入访谈概述" />
							</div>
							
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea name="bak" class="form-control" placeholder="请输入备注"></textarea>
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
        format:'yyyy-mm-dd HH:mm',
	    language: 'zh-CN'
    });
    $("#select01").chosen();
    
    //查询客户名下车辆和联系人
	function getCusCars(){
		var id = $("#cus").val();
		$("#car_plates").empty();
		$("#car_plates").append("<option>请选择车辆</option>");
		var load = layer.load();
		$.ajax({
		   type: "POST",  
		   url: "/AMS/order/getCarByCusId",  
		   data: {id:id},
		   dataType: 'json',  
		   success: function(rst){
			   layer.close(load);
			   if(rst.status == 200){
			   		$.each(rst.carInfos, function(i,obj){
			   			var carId = ${order.car_id};
			   			var selFlag = (obj.id == carId);
			   			if(selFlag){
				   			$("#car_plates").append("<option value=\""+obj.id+"\" selected>"+obj.car_plates+"</option>");
			   			} else {
			   				$("#car_plates").append("<option value=\""+obj.id+"\" >"+obj.car_plates+"</option>");
			   			}
			   		});
			   		$.each(rst.linkmans, function(i,obj){
			   			$("#linkman").append("<option value=\""+obj.id+"\" te=\""+obj.link_tel+"\">"+obj.link_name+"</option>");
			   		});
			   } else {
					layer.msg(rst.message);
				}
		   }  
		});  
	}
	
	function setTel(){
		$("#tel").val($("#linkman").find("option:selected").attr("te"));
	}
	getCusCars();
</script>
	
</body>
</html>