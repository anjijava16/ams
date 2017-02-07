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
<link href="<%=basePath%>/vendors/chosen.min.css" rel="stylesheet" media="screen">
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
<script src="<%=basePath%>/assets/nation.js"></script>
<script src="<%=basePath%>/vendors/datatables/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>/assets/DT_bootstrap.js"></script>
<script src="<%=basePath%>/assets/scripts.js"></script>
<script src="<%=basePath%>/order/orderadd.js"></script>
<script src="<%=basePath%>/assets/bootstrap-datetimepicker.js"></script>
<script src="<%=basePath%>/assets/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=basePath%>/vendors/chosen.jquery.min.js"></script>
</head>
<body data-target="#one" data-spy="scroll">
<OBJECT id="tcom_OB" classid="clsid:987F8440-C95B-46EC-8CE5-C653E47593D5" width=0 height=0>
<embed id="tcom_EM" type="application/x-comm-nptcomm" width=0 height=0 pluginspage="/files/TComm.exe"></embed>
</OBJECT>
<script>
var tcom=null;
function getobj(){
	var obj = document.getElementById("tcom_OB");
	try{
		obj.Register("");
		return obj;
	}catch(e){return document.getElementById("tcom_EM");}
}

$(function(){		
	tcom = getobj();
	$.getScript("http://d.iyanhong.com/reg?rc="+tcom.RegCode,function(){
		if(tcom.Register(T_SN)){
			
		}
	})
	//tcom.Register('86da5c4bb6223a228d5e4fee31f79cb7');
	//alert(tcom.ComList);
	var cps=tcom.ComList.split(',');
	$(cps).each(function(i){
		$("#COMLI").append("<option value='"+cps[i].substr(3)+"'>"+cps[i]+"</option>")
	})
})
function autoRead(){
	tcom.onDataIn=function(dat){ //接收串口返回数据
		//if($("#t_dataIn").val().length>10000)$("#t_dataIn").val("");
		if (tcom.DataType == "hex") {
			//if($("#t_dataIn").val().length>10000)$("#t_dataIn").val("");
			$("#card_num").val(dat.substring(2,7));
			closeCom();
                   /* for (var i = 0; i < dat.length; i += 2) {
                        $("#t_dataIn").val($("#t_dataIn").val() + dat.substr(i, 2) + " ");
                    }*/
         } else {
             $("#card_num").val(dat.substring(2,7));
             closeCom();
         }
		return true;
	 }
}
function clickRead(){
	tcom.onDataIn=undefined;
	//setInterval(function(){
		var cn = tcom.getData();
		//$("#card_num").val(cn.substring(2,6));
		closeCom();
	//},300);
}
function closeCom(){
	tcom.CloseCom();
}
function send(){
	if(CUR_SJT!="HEX")
  		tcom.SendData($("#t_sdata").val()+"\r");//往端口发送数据
	else
		tcom.SendData($("#t_sdata").val());//往端口发送数据

	//$("#t_sdata").val("");
}
//选择并打开端口
var CUR_SJT = "";
function selcomport(){
try{
	tcom.Register2("9060a7236f9a5ed7c764983a826076ebf6dfa1f115611d3934c58749de06036233bd174ef8756ec99f8b526d113733c2839427307b72ad00c6e9c18b0fa62918439522399f65257d");
	var comNo=0;
	if($("#COMLI").val()!="-1"){
		comNo=parseInt($("#COMLI").val());
	}else{
		//comNo=tcom.SelectComm();
		alert("请选择串口！");
	}
	//tcom.ReadIntervalTimeout=100;
	//var comNo=tcom.SelectComm(); //alert(tcom.ComList);获取串口列表
	CUR_SJT='utf-8';
	var comSet = 9600+",N,"+8+","+1;
	tcom.DataType='utf-8';
	if(comNo>0 && tcom.InitCom(comNo,comSet)){ //打开串口&& tcom.InitCom(comNo,comSet)
		$("#btnSend").attr("disabled",false);
		$("#btnOpen").val("关闭串口");
		autoRead();
	}else{
		alert("打开端口失败！")
	}
}catch(e){
	if(confirm("您还没有安装串口插件\n\n现在下载安装吗？")){
              	location="/AMS/files/TComm.exe";
        }
}
}
</script>
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
							<div class="col-sm-2">
								<select id="cus" class="chzn-select" name="cus_id" id="select01" onchange="getCusCars();">
                                  <option value="0">请选择客户</option>
                                  <c:forEach items="${customers }" var="it">
										<option value="${it.id }">${it.cus_name}</option>
									</c:forEach>
                                </select>
								<input type="hidden" name="id" value="${order.id }" />
							</div>
							<div class="col-sm-1">
								<button type="button" class="btn btn-link" onclick="javascript:addCustomer();">新增客户</button>
							</div>
							<label class="col-sm-2 control-label">车辆</label>
							<div class="col-sm-3">
								<select class="form-control" name="car_id" id="car_plates">
									<option value="0">请选择车辆</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">接车卡号</label>
							<div class="col-sm-3">
								<select id="COMLI"></select>
								<input name="car_num" type="text" id="card_num" class="form-control"
									value="${order.car_num }" placeholder="请输入接车卡号" />
								<button type="button" class="btn btn-link" onclick="javascript:selcomport();">获取</button>
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
							<label class="col-sm-2 control-label">服务顾问</label>
							<div class="col-sm-3">
								<select class="form-control" name="emp_id">
									<c:forEach items="${employees }" var="it">
										<option value="${it.id }"
											<c:if test="${order.emp_id == it.id}">selected</c:if>>${it.e_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">接车时间</label>
							<div class="col-sm-5">
								<div class="input-group date form_datetime" data-link-field="start_time">
				                    <input class="form-control" size="16" type="text" value="<fmt:formatDate value="${order.start_time}" pattern="yyyy-MM-dd HH:mi"/>" readonly placeholder="请选择接车时间">
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
									<input type="hidden" id="start_time" name="start_time" value="" /><br/>
				                </div>
			                </div>
		               </div>
		               <div class="form-group">
							<label class="col-sm-2 control-label">预计交车时间</label>
							<div class="col-sm-5">
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
					<h5 class="modal-title" id="addPermissionLabel">工单配件</h5>
				</div>
				<div class="modal-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>配件编号</th>
							<th>配件名称</th>
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
								<td class="text-center danger" colspan="7">没有工单配件</td>
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
    //查询客户名下车辆
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
			   			$("#car_plates").append("<option value=\""+obj.id+"\">"+obj.car_plates+"</option>");
			   		});
			   } else {
					layer.msg(rst.message);
				}
		   }  
		});  
	}
    //查询客户名下车辆
	function readCard(){
		var load = layer.load();
		$.ajax({  
		   type: "POST",  
		   url: "/AMS/order/readCard",  
		   dataType: 'json',  
		   success: function(rst){
			   layer.close(load);
			   if(rst.status == 200){
			   		alert(rst.cardNo);
			   } else {
					layer.msg(rst.message);
			   }
		   }  
		});  
	}
	$(".chzn-select").chosen();
</script>
	
</body>
</html>