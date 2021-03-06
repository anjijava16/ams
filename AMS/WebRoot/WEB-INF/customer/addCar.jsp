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
<title>系统管理-客户管理</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<link
	href="<%=basePath%>/js/common/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">
<link href="<%=basePath%>/vendors/chosen.min.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>/css/common/base.css" rel="stylesheet" />
<link href="<%=basePath%>/vendors/datepicker.css" rel="stylesheet"
	media="screen">
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
<script src="<%=basePath%>/assets/bootstrap3-validation.js"></script>
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
					<h4 class="modal-title" id="addPermissionLabel">车辆信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="<%=basePath %>/customer/insertCar" method="post" id="carFm">
						<div class="form-group">
							<label class="col-sm-2 control-label">所属客户</label>
							<div class="col-sm-2">
								<div class="input-group">
									<select id="cus" name="cus_id" class="chzn-select">
	                                  <option value="">请选择客户</option>
	                                  <c:forEach items="${customers }" var="it">
											<option value="${it.id }"
											<c:if test="${it.id == car.cus_id}">selected</c:if>>${it.cus_name}</option>
										</c:forEach>
	                                </select>
	                                <span class="input-group-addon" onclick="javascript:addCustomer();">新增</span>
                                </div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">车牌号</label>
							<div class="col-sm-3">
								<input type="text" id="carPlates" name="car_plates" class="form-control"
									value="${car.car_plates }" placeholder="请输入车牌号" check-type="required" required-message="请填写车牌号"/> <input
									type="hidden" id="car_id" name="id" value="${car.id }" />
							</div>
							<label class="col-sm-2 control-label">品牌首字母</label>
							<div class="col-sm-3">
								<select class="form-control" id="firstLetter" onchange="getBrand();">
									<option value="">请选择</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="E">E</option>
									<option value="F">F</option>
									<option value="G">G</option>
									<option value="H">H</option>
									<option value="I">I</option>
									<option value="J">J</option>
									<option value="K">K</option>
									<option value="L">L</option>
									<option value="M">M</option>
									<option value="N">N</option>
									<option value="O">O</option>
									<option value="P">P</option>
									<option value="Q">Q</option>
									<option value="R">R</option>
									<option value="S">S</option>
									<option value="T">T</option>
									<option value="U">U</option>
									<option value="V">V</option>
									<option value="W">W</option>
									<option value="X">X</option>
									<option value="Y">Y</option>
									<option value="Z">Z</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">品牌</label>
							<div class="col-sm-5">
								<select class="form-control" id="brand" name="brand" onchange="getFamily();">
									<option value="">请选择...</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">车系</label>
							<div class="col-sm-5">
								<select class="form-control" name="car_seri" id="family" onchange="getGroup();">
									<option value="">请选择...</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">车组</label>
							<div class="col-sm-5">
								<select class="form-control" name="group_name" id="group" onchange="getVehicle();">
									<option value="">请选择...</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">车型</label>
							<div class="col-sm-5">
								<select class="form-control" name="vehicle_name" id="vehicle" onchange="getCarPrice();">
									<option value="">请选择...</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">VIN</label>
							<div class="col-sm-3">
							<div class="input-group">
								<input type="text" class="form-control" id="vin" name="vin" value="LVSHCFDB2DE218686${car.vin }" placeholder="请输入VIN">
								<span class="input-group-addon" onclick="javascript:checkByVin();">查询</span>
							</div>
							</div>
							<label class="col-sm-2 control-label">发动机号</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="engine_num" 
								value="${car.engine_num }" placeholder="请输入发动机号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">外观颜色</label>
							<div class="col-sm-3">
								<select class="form-control" name="outer_color">
									<option value="">请选择...</option>
									<c:forEach items="${outerColor }" var="it">
										<option value="${it.data_key }"
											<c:if test="${car.outer_color == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 control-label">内饰颜色</label>
							<div class="col-sm-3">
								<select class="form-control" name="inner_color">
									<option value="">请选择...</option>
									<c:forEach items="${innerColor }" var="it">
										<option value="${it.data_key }"
											<c:if test="${car.inner_color == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">合格证号</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="cer_num" 
								value="${car.cer_num }" placeholder="请输入合格证号">
							</div>
							<label class="col-sm-2 control-label">钥匙号</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="key_num" 
								value="${car.key_num }" placeholder="请输入钥匙号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">生产月份</label>
							<div class="col-sm-3">
								<input name="creat_date" type="text" class="input-xlarge datepicker"
									value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${car.creat_date}" />" placeholder="请选择生产月份"/>
							</div>
							<label class="col-sm-2 control-label">出厂日期</label>
							<div class="col-sm-3">
								<input name="out_fa_date" type="text" class="input-xlarge datepicker"
									value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${car.out_fa_date}" />" placeholder="请选择出厂日期"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">年款</label>
							<div class="col-sm-3">
								<input type="number" class="form-control" name="year" 
								value="<fmt:formatDate pattern="yyyy"  value="${car.creat_date}" />" placeholder="请输入年款">
							</div>
							<label class="col-sm-2 control-label">使用性质</label>
							<div class="col-sm-3">
								<select class="form-control" name="use_type">
									<option value="">请选择...</option>
									<c:forEach items="${useType }" var="it">
										<option value="${it.data_key }"
											<c:if test="${car.use_type == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备件组织号</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="spare_num" 
								value="${car.spare_num }" placeholder="请输入备件组织号">
							</div>
							<label class="col-sm-2 control-label">首保日期</label>
							<div class="col-sm-3">
								<input name="fir_date" type="text" class="input-xlarge datepicker"
									value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${car.fir_date}" />" placeholder="请选择首保日期"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">里程数</label>
							<div class="col-sm-3">
								<input type="number" class="form-control" name="mileages" 
								value="${car.mileages }" placeholder="请输入当前里程数">
							</div>
							<label class="col-sm-2 control-label">车辆售价</label>
							<div class="col-sm-3">
								<input type="number" id="car_price" class="form-control" name="car_price" readonly="readonly"
								value="${car.car_price }" placeholder="请输入车辆售价" check-type="required" required-message="请先选择车型">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea name="bak" class="form-control" placeholder="请输入备注">${car.bak }</textarea>
							</div>
						</div>
				</div>
				<div class="form-actions">
					<button type="submit" id="valiBtn" class="btn btn-large btn-block btn-primary">提交</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	var carmodelList = ${carmodelList};
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
	
	$(function() {
		//时间选择框
		$(".datepicker").datepicker();
		getCondition();
		var carid = $('#car_id').val();
		$("#carFm").validation(function(obj,params){  
	      //扩展校验方法
	      if (obj.id=='carPlates'){
		       $.post("<%=basePath %>/customer/verifyCarPlates",{carPlates :$(obj).val()},function(data){
			         if(data.status == 400 && data.id != carid){
			         	params.err = true;
			         	params.msg = '该车牌号已存在';
			         }
		        });
	      }
	      if(obj.id=='brand'){
        		if ($(obj).val() == '')
				 {
				 	params.err = true;
		         	params.msg = '请选择品牌';
				 }
        	}
        	if(obj.id=='car_seri'){
        		if ($(obj).val() == '')
				 {
				 	params.err = true;
		         	params.msg = '请选择型号';
				 }
        	}
        	if(obj.id=='cus'){
        		if ($(obj).val() == '')
				 {
				 	params.err = true;
		         	params.msg = '请选择所属客户';
				 }
        	}
	    }, {reqmark:false});
	    $("#valiBtn").on('click',function(event){
	      // 2.最后要调用 valid()方法。
	      if ($("#carFm").valid('填写信息不正确。')==false){
	        return false;
	      }
	    });
	});
		
	//Item联动
	function getCondition(){
		var brand = $("#brand").val();
		var serialOld=[];
		$.each(carmodelList, function(i, obj){
			if(brand==obj.carbrand){
				serialOld.push(obj.carmodel);
			}
		});
		var serial=delRepeat(serialOld);
		$("#car_seri").empty();
		$("#car_seri").append("<option value=\"\">请选择...</option>");
		$.each(serial, function(i, obj){
			var selFlag = (obj == '${car.car_seri}');
			if(selFlag){
				$("#car_seri").append("<option value=\""+obj+"\" selected>"+obj+"</option>");
			} else {
				$("#car_seri").append("<option value=\""+obj+"\">"+obj+"</option>");
			}
		});
	}
	
	$(".chzn-select").chosen();
	
	function getCarPrice(){
		var brand = $("#brand").val();
		var car_seri = $("#car_seri").val();
		$.each(carmodelList, function(i, obj){
			console.log(obj.carbrand);
			if(brand==obj.carbrand && car_seri==obj.carmodel){
				$("#car_price").val(obj.carprice);
			}
		});
	}
	
	function addCustomer(){
		location.href="/AMS/customer/add";
	}
	//根据vin查询车型
	function checkByVin(){
		var vin = $("#vin").val();
		$.getJSON("<%=basePath %>/customer/checkByVin",{vin :vin},function(data){
			var res = data.data;
			var dataObj=eval("("+res+")");//转换为json对象 
			console.log(res);
			console.log(res.error_code);
        });
	}
	//品牌查询
	function getBrand(){
		var firstLetter = $("#firstLetter").val();
		$.getJSON("<%=basePath %>/customer/getBrand",{brandId :firstLetter},function(data){
			$("#brand").empty();
			$("#brand").append("<option value=''>请选择...</option>");
			var res = data.data;
			var dataObj=eval("("+res+")");//转换为json对象 
			console.log(dataObj.result);
			$.each(dataObj.result.brandList, function(i, item) {
		      $("#brand").append("<option value='"+item.brandId+"'>" + item.brandName + "</option>");
		    });
        });
	}
	//车系查询
	function getFamily(){
		var brand = $("#brand").val();
		$.getJSON("<%=basePath %>/customer/getFamily",{brandId :brand},function(data){
			$("#family").empty();
			$("#family").append("<option value=''>请选择...</option>");
			var res = data.data;
			var dataObj=eval("("+res+")");//转换为json对象 
			console.log(dataObj.result);
			$.each(dataObj.result.familyList, function(i, item) {
		      $("#family").append("<option value='"+item.familyId+"'>" + item.familyName + "</option>");
		    });
        });
	}
	//车系查询
	function getGroup(){
		var brand = $("#family").val();
		$.getJSON("<%=basePath %>/customer/getGroup",{familyId :brand},function(data){
			$("#group").empty();
			$("#group").append("<option value=''>请选择...</option>");
			var res = data.data;
			var dataObj=eval("("+res+")");//转换为json对象 
			console.log(dataObj.result);
			$.each(dataObj.result.groupList, function(i, item) {
		      $("#group").append("<option value='"+item.groupId+"'>" + item.groupName + "</option>");
		    });
        });
	}
	//车系查询
	function getVehicle(){
		var brand = $("#group").val();
		$.getJSON("<%=basePath %>/customer/getType",{groupId :brand},function(data){
			$("#vehicle").empty();
			$("#vehicle").append("<option value=''>请选择...</option>");
			var res = data.data;
			var dataObj=eval("("+res+")");//转换为json对象 
			console.log(dataObj.result);
			$.each(dataObj.result.vehicleList, function(i, item) {
		      $("#vehicle").append("<option value='"+item.groupId+"'>" + item.groupName + "</option>");
		    });
        });
	}
	</script>
</body>
</html>