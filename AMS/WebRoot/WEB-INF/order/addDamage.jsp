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
<link href="<%=basePath%>/vendors/datepicker.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
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
<script src="<%=basePath%>/assets/nation.js"></script>
<script src="<%=basePath%>/vendors/datatables/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/assets/DT_bootstrap.js"></script>
<script src="<%=basePath%>/assets/scripts.js"></script>
<script src="<%=basePath%>/order/orderadd.js"></script>
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
					<form class="form-horizontal" method="post">
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
									value="${order.car_num }" disabled />
							</div>
							<label class="col-sm-2 control-label">保单号</label>
							<div class="col-sm-3">
								<input name="insure_num" type="text" class="form-control"
									value="${order.insure_num }" disabled />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">行驶里程</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="mileages"
									value="${order.mileages }" disabled>
							</div>
							<label class="col-sm-2 control-label">工时费</label>
							<div class="col-sm-3">
								<input name="hour_total" type="text" class="form-control"
									readonly="readonly" value="${order.hour_total }" />
							</div>
							
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">配件费</label>
							<div class="col-sm-3">
								<input name="parts_total" type="text" class="form-control"
									readonly="readonly" value="${order.parts_total }" />
							</div>
							<label class="col-sm-2 control-label">附加费</label>
							<div class="col-sm-3">
								<input name="add_total" type="text" class="form-control"
									readonly="readonly" value="${order.add_total }" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">优惠金额</label>
							<div class="col-sm-3">
								<input name="dis_total" type="text" class="form-control"
									readonly="readonly" value="${order.dis_total }" />
							</div>
							<label class="col-sm-2 control-label">总金额</label>
							<div class="col-sm-3">
								<input name="total_price" type="text" class="form-control"
									readonly="readonly" value="${order.total_price }" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">接车时间</label>
							<div class="col-sm-3">
				                <input class="form-control" type="text" value="<fmt:formatDate value="${order.start_time}" pattern="yyyy-MM-dd HH:mm"/>" readonly >
			                </div>
							<label class="col-sm-2 control-label">预计交车时间</label>
							<div class="col-sm-3">
			                    <input class="form-control" type="text" value="<fmt:formatDate value="${order.pre_end_time}" pattern="yyyy-MM-dd HH:mm"/>" readonly >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">报修描述</label>
							<div class="col-sm-3">
								<input name="rep_desc" type="text" class="form-control"
									value="${order.rep_desc }" disabled />
							</div>
							<label class="col-sm-2 control-label">服务顾问</label>
							<div class="col-sm-3">
								<select class="form-control" name="emp_id" disabled="disabled">
									<c:forEach items="${employees }" var="it">
										<option value="${it.id }"
											<c:if test="${order.emp_id == it.id}">selected</c:if>>${it.e_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea name="bak" class="form-control" disabled>${order.bak }</textarea>
							</div>
						</div>
				</div>
				<div class="modal-header">
					<h5 class="modal-title" id="addPermissionLabel">工单项目
					<button type="button" class="btn btn-link" onclick="$('#addItem').modal();">添加</button></h5>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>维修项目类型</th>
							<th>工时</th>
							<th>附加工时</th>
							<th>工时单价</th>
							<th>工时总价</th>
							<th>维修工位</th>
							<th>操作</th>
						</tr>
						<c:if test="${itemPage.list!=null && fn:length(itemPage.list) > 0}">
							<c:forEach items="${itemPage.list}" var="it">
								<tr>
									<td>${it.rep_item_type}</td>
									<td>${it.work_hour}</td>
									<td>${it.add_hour}</td>
									<td>${it.hour_price}</td>
									<td>${it.hour_total}</td>
									<td>${it.rep_station}</td>
									<td><a href="<%=basePath %>/order/deleteItem?id=${it.id}&orderId=${order.id}">移除</a></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${itemPage.list==null || fn:length(itemPage.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="9">没有工单项目</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="modal-header">
					<h5 class="modal-title" id="addPermissionLabel">工单配件
					<button type="button" class="btn btn-link" onclick="$('#addParts').modal();">添加</button></h5>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>配件编号</th>
							<th>配件名称</th>
							<th>数量</th>
							<th>单价</th>
							<th>折扣</th>
							<th>金额</th>
							<th>操作</th>
						</tr>
						<c:if test="${partsPage.list!=null && fn:length(partsPage.list) > 0}">
							<c:forEach items="${partsPage.list}" var="it">
								<tr>
									<td>${it.parts_no}</td>
									<td>${it.parts_name}</td>
									<td>${it.num}</td>
									<td>${it.price}</td>
									<td>${it.discount}</td>
									<td>${it.total}</td>
									<td><a href="<%=basePath %>/order/deleteParts?id=${it.id}&orderId=${order.id}">移除</a></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${partsPage.list==null || fn:length(partsPage.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="8">没有工单配件</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div class="modal-header">
					<h5 class="modal-title" id="addPermissionLabel">附加项目
					<button type="button" class="btn btn-link" onclick="$('#addAdd').modal();">添加</button></h5>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>项目名称</th>
							<th>价格</th>
							<th>描述</th>
							<th>操作</th>
						</tr>
						<c:if test="${addPage.list!=null && fn:length(addPage.list) > 0}">
							<c:forEach items="${addPage.list}" var="it">
								<tr>
									<td>${it.add_name}</td>
									<td>${it.add_total}</td>
									<td>${it.add_desc}</td>
									<td><a href="<%=basePath %>/order/deleteAdd?id=${it.id}&orderId=${order.id}">移除</a></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${addPage.list==null || fn:length(addPage.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="4">没有找到相关信息</td>
							</tr>
						</c:if>
					</table>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%--Item弹框--%>
	<div class="modal fade bs-example-modal-sm" id="addItem"
		tabindex="-1" role="dialog" aria-labelledby="addItemLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addStationsLabel">添加工单项目</h4>
				</div>
				<div class="modal-header">
				<form class="form-horizontal" id="orderItemFm">
					<div class="form-group">
						<label class="col-sm-2 control-label">作业项目</label>
						<div class="col-sm-3">
							<input type="text" name="rep_item_type" id="rep_item_type" class="form-control" readonly="readonly" />
							<input type="hidden" name="order_id" value="${order.id }" /> 
						</div>
						<label class="col-sm-2 control-label">工时</label>
						<div class="col-sm-3">
							<input type="text" name="work_hour" id="work_hour" class="form-control" readonly="readonly" /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">工时单价</label>
						<div class="col-sm-3">
							<input type="text" name="hour_price" id="hour_price" class="form-control" readonly="readonly" /> 
						</div>
						<label class="col-sm-2 control-label">附加工时</label>
						<div class="col-sm-3">
							<input type="number" id="add_hour" name="add_hour" class="form-control" value="0" onchange="calcItem();"/> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">折扣</label>
						<div class="col-sm-3">
							<div class="input-group">
								<input type="number" class="form-control" id="discount" name="discount" value="100" onchange="calcItem();"/>
								<span class="input-group-addon">%</span>
							</div>
						</div>
						<label class="col-sm-2 control-label">工时费用</label>
						<div class="col-sm-3">
							<input type="text" name="hour_total" id="hour_total" class="form-control" readonly="readonly"
							 value="0" /> 
						</div>
					</div>
					<!-- div class="form-group">
						<label class="col-sm-2 control-label">维修工位</label>
						<div class="col-sm-3">
							<select class="form-control" name="rep_station">
									<option value="">请选择...</option>
									<c:forEach  items="${stationList}" var="it">
										<option value="${it.w_no }" >${it.w_name }</option>
									</c:forEach>
								</select>
						</div>
					</div> -->
					</form>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="wh">
						<div class="form-group">
							<label class="col-sm-2 control-label">损伤部件分组</label>
							<div class="col-sm-3">
								<select class="form-control" id="damage_parts_group" name="damage_parts_group" onchange="getCondition(0);">
									<option value="">请选择...</option>
									<c:forEach  items="${dpgSet}" var="it">
										<option value="${it }" >${it }</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 control-label">损伤部位</label>
							<div class="col-sm-3">
								<select class="form-control" id="damage_position" name="damage_position" onchange="getCondition(1);">
									<option value="">请选择...</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">损伤部件</label>
							<div class="col-sm-3">
								<select class="form-control" name="damage_parts" id="damage_parts">
									<option value="">请选择...</option>
								</select>
							</div>
							<label class="col-sm-2 control-label">维修类型</label>
							<div class="col-sm-3">
								<select class="form-control" name="repairtype" id="repairtype">
									<option value="">请选择...</option>
									<c:forEach items="${repairType }" var="it">
										<option value="${it.data_key }"
											<c:if test="${repairType == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">维修方法</label>
							<div class="col-sm-3">
								<select class="form-control" name="repairmethod" id="repairmethod">
									<option value="">请选择...</option>
									<c:forEach items="${repairMethod }" var="it">
										<option value="${it.data_key }"
											<c:if test="${repairMethod == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 control-label">价格区间</label>
							<div class="col-sm-3">
								<select class="form-control" name="pricerange">
									<option value="">请选择...</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">
								<button type="button" class="btn btn-info" onclick="listWorkingHours();">查询</button>
							</label>
						</div>
						<table class="table table-striped table-bordered" id="whTb">
							<tr>
								<th>损伤部件分组</th>
								<th>损伤部位</th>
								<th>损伤部件</th>
								<th>维修类型</th>
								<th>维修方法</th>
								<th>作业项目</th>
								<th>作业级别</th>
								<th>价格区间</th>
								<th>所需工时(分钟)</th>
								<th>所需费用</th>
							</tr>
							<tr id="whNone">
								<td class="text-center danger" colspan="10">没有找到相关信息</td>
							</tr>
						</table>
				</div>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="addItems();" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	<%----/弹框--%>
	<%--Parts弹框--%>
	<div class="modal fade bs-example-modal-sm" id="addParts"
		tabindex="-1" role="dialog" aria-labelledby="addItemLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addStationsLabel">添加工单配件</h4>
				</div>
				<div class="modal-header">
				<form class="form-horizontal" id="orderPartsFm">
					<div class="form-group">
						<label class="col-sm-2 control-label">配件名称</label>
						<div class="col-sm-3">
							<input type="text" id="parts_name" name="parts_name" class="form-control" readonly="readonly" /> 
							<input type="hidden" id="parts_no" name="parts_no" class="form-control" readonly="readonly" /> 
							<input type="hidden" name="order_id" value="${order.id }" /> 
						</div>
						<label class="col-sm-2 control-label">单价</label>
						<div class="col-sm-3">
							<input type="number" id="price" name="price" class="form-control" readonly="readonly" /> 
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">数量</label>
						<div class="col-sm-3">
							<input type="number" id="num" name="num" class="form-control" value="1" onchange="calcParts();"/> 
						</div>
						<label class="col-sm-2 control-label">折扣</label>
						<div class="col-sm-3">
							<div class="input-group">
								<input type="number" class="form-control" id="discountParts" name="discount" value="100" onchange="calcParts();"/>
								<span class="input-group-addon">%</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">金额</label>
						<div class="col-sm-3">
							<input type="number" id="total" name="total" class="form-control" readonly="readonly"/> 
						</div>
					</div>
				</form>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="cpFm">
						<div class="form-group">
							<label class="col-sm-2 control-label">损伤部件分组</label>
							<div class="col-sm-3">
								<select class="form-control" id="damage_parts_group_p" name="damage_parts_group" onchange="getConditionParts(0);">
									<option value="">请选择...</option>
									<c:forEach  items="${dpgPartsSet}" var="it">
										<option value="${it }" >${it }</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 control-label">损伤部位</label>
							<div class="col-sm-3">
								<select class="form-control" id="damage_position_p" name="damage_position" onchange="getConditionParts(1);">
									<option value="">请选择...</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">损伤部件</label>
							<div class="col-sm-3">
								<select class="form-control" name="damage_parts" id="damage_parts_p">
									<option value="">请选择...</option>
								</select>
							</div>
							<label class="col-sm-2 control-label">配件名称</label>
							<div class="col-sm-3">
								<input type="text" name="partsname" class="form-control"/> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">配件编号</label>
							<div class="col-sm-3">
								<input type="text" name="partsnumber" class="form-control"  /> 
							</div>
							<label class="col-sm-2 control-label">原厂编号</label>
							<div class="col-sm-3">
								<input type="text" name="firmsnumber" class="form-control"  /> 
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">适用车型</label>
							<div class="col-sm-3">
								<select class="form-control" name="applymodel">
									<option value="">通用所有车型</option>
									<c:forEach  items="${brandSet}" var="it">
										<option value="${it }" >${it }</option>
									</c:forEach>
								</select>
							</div>
							<!-- label class="col-sm-2 control-label">配件类别</label>
							<div class="col-sm-3">
								<select class="form-control" name="partstype">
									<option value="">请选择...</option>
								</select>
							</div>
							 -->
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">
								<button type="button" class="btn btn-info" onclick="listCarParts();">查询</button>
							</label>
						</div>
						<table class="table table-striped table-bordered" id="cpTb">
							<tr>
								<th>损伤部件分组</th>
								<th>损伤部位</th>
								<th>损伤部件</th>
								<th>配件名称</th>
								<th>配件编号</th>
								<th>原厂编号</th>
								<th>适用车型</th>
								<th>配件价格</th>
								<th>配件类别</th>
								<th>配件库存数量</th>
							</tr>
							<tr id="cpNone">
								<td class="text-center danger" colspan="10">没有找到相关信息</td>
							</tr>
						</table>
				</div>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="addParts();" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	<%----/弹框--%>
	<%--Add弹框--%>
	<div class="modal fade bs-example-modal-sm" id="addAdd"
		tabindex="-1" role="dialog" aria-labelledby="addItemLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addStationsLabel">添加附加项目</h4>
				</div>
				<div class="modal-header">
				<form class="form-horizontal" id="orderAddFm">
					<div class="form-group">
						<label class="col-sm-2 control-label">项目名称</label>
						<div class="col-sm-3">
							<input type="text" name="add_name" class="form-control" placeholder="请填写项目名称" /> 
							<input type="hidden" name="order_id" value="${order.id }" /> 
						</div>
						<label class="col-sm-2 control-label">项目价格</label>
						<div class="col-sm-3">
							<input type="number" name="add_total" class="form-control"
								 placeholder="请填写项目价格" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">项目备注</label>
						<div class="col-sm-8">
							<textarea name="add_desc" class="form-control" placeholder="请输入备注"></textarea>
						</div>
					</div>
					</form>
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="addOrderAdd();" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	<%----/弹框--%>
	<script>
	var damagePartsGroup = ${damagePartsGroup};
	var carPartsList = ${carPartsList};
	function delRepeat(oldArray){//去重函数
		oldArray = $.makeArray(oldArray);
		var newArray = [];
		$.each(oldArray, function(i, obj){
		　　//判断元素是否存在于new_arr中，如果不存在则插入到new_arr的最后
		　　if($.inArray(obj,newArray)==-1) {
		　　　　newArray.push(obj);
		　　}
		});
		return newArray;
	}
	//Item联动
	function getCondition(condType){
		var dpg = $("#damage_parts_group").val();
		var dpo = $("#damage_position").val();
		var dp = $("#damage_parts").val();
		if(condType == 0){//损伤部件分组
			var damagePositionOld=[];
			$.each(damagePartsGroup, function(i, obj){
				if(dpg==obj.damage_parts_group){
					damagePositionOld.push(obj.damage_position);
				}
			});
			var damagePosition=delRepeat(damagePositionOld);
			$("#damage_position").empty();
			$("#damage_position").append("<option value=\"\">请选择...</option>");
			$.each(damagePosition, function(i, obj){
				$("#damage_position").append("<option value=\""+obj+"\">"+obj+"</option>");
			});
		} else if(condType == 1){
			var damagePartsOld=[];
			$.each(damagePartsGroup, function(i, obj){
				if(dpg==obj.damage_parts_group && dpo==obj.damage_position){
					damagePartsOld.push(obj.damage_parts);
				}
			});
			console.log(damagePartsOld.length);
			var damageParts=delRepeat(damagePartsOld);
			$("#damage_parts").empty();
			$("#damage_parts").append("<option value=\"\">请选择...</option>");
			$.each(damageParts, function(i, obj){
				$("#damage_parts").append("<option value=\""+obj+"\">"+obj+"</option>");
			});
		}
	}
	//Parts联动
	function getConditionParts(condType){
		var dpg = $("#damage_parts_group_p").val();
		var dpo = $("#damage_position_p").val();
		var dp = $("#damage_parts_p").val();
		if(condType == 0){//损伤部件分组
			var damagePositionOld=[];
			$.each(carPartsList, function(i, obj){
				if(dpg==obj.damage_parts_group){
					damagePositionOld.push(obj.damage_position);
				}
			});
			var damagePosition=delRepeat(damagePositionOld);
			$("#damage_position_p").empty();
			$("#damage_position_p").append("<option value=\"\">请选择...</option>");
			$.each(damagePosition, function(i, obj){
				$("#damage_position_p").append("<option value=\""+obj+"\">"+obj+"</option>");
			});
		} else if(condType == 1){
			var damagePartsOld=[];
			$.each(carPartsList, function(i, obj){
				if(dpg==obj.damage_parts_group && dpo==obj.damage_position){
					damagePartsOld.push(obj.damage_parts);
				}
			});
			var damageParts=delRepeat(damagePartsOld);
			$("#damage_parts_p").empty();
			$("#damage_parts_p").append("<option value=\"\">请选择...</option>");
			$.each(damageParts, function(i, obj){
				$("#damage_parts_p").append("<option value=\""+obj+"\">"+obj+"</option>");
			});
		}
	}
	</script>
</body>
</html>