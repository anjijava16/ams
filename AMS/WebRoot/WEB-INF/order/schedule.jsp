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
<link href="<%=basePath%>/assets/style.css" rel="stylesheet" />
<link href="<%=basePath%>/assets/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="<%=basePath%>/vendors/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/common/layer/layer.js"></script>
<script src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/shiro.demo.js"></script>
<script src="<%=basePath%>/assets/main.js"></script>
<script src="<%=basePath%>/assets/bootstrap-datetimepicker.js"></script>
<script src="<%=basePath%>/assets/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=basePath%>/assets/bootstrap3-validation.js"></script>
</head>
<body >
	<jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
		<div class="row">
		<jsp:include page="menu.jsp" flush="true"></jsp:include>
			<div class="col-md-10">
				<h2>工单项目列表</h2>
				<hr>
				<form method="post" action="/AMS/order/list" id="formId" class="form-inline">
					<table class="table table-striped table-bordered">
						<tr>
							<th>维修项目</th>
							<th>标准工时</th>
							<th>附加工时</th>
							<th>所在工位</th>
							<th>预计开始时间</th>
							<th>预计结束时间</th>
							<th>实际开始时间</th>
							<th>实际结束时间</th>
							<th>操作</th>
						</tr>
						<c:if test="${orderItems!=null && fn:length(orderItems) > 0}">
							<c:forEach items="${orderItems}" var="it">
								<tr>
									<td>${it.rep_item_type}</td>
									<td>${it.work_hour}</td>
									<td>${it.add_hour}</td>
									<td>${it.rep_station}</td>
									<td><fmt:formatDate value="${it.pre_start_time}" pattern="MM-dd HH:mm"/></td>
									<td><fmt:formatDate value="${it.pre_end_time}" pattern="MM-dd HH:mm"/></td>
									<td><fmt:formatDate value="${it.start_time}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td><fmt:formatDate value="${it.end_time}" pattern="MM-dd HH:mm"/></td>
									<td>
									<button type="button" class="btn btn-link" onclick="schedule(${it.id});">排程</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${orderItems==null || fn:length(orderItems) < 1}">
							<tr>
								<td class="text-center danger" colspan="9">没有找到相关信息</td>
							</tr>
						</c:if>
					</table>
				</form>
				<h2>工位使用情况</h2>
				<hr>
				<form method="post" action="/AMS/order/list" id="formId" class="form-inline">
					<table class="table table-striped table-bordered">
						<tr>
							<th>所在工位</th>
							<th>预计开始时间</th>
							<th>预计结束时间</th>
							<th>实际开始时间</th>
							<th>实际结束时间</th>
						</tr>
						<c:if test="${allItems!=null && fn:length(allItems) > 0}">
							<c:forEach items="${allItems}" var="it">
								<tr>
									<td>${it.rep_station}</td>
									<td><fmt:formatDate value="${it.pre_start_time}" pattern="MM-dd HH:mm"/></td>
									<td><fmt:formatDate value="${it.pre_end_time}" pattern="MM-dd HH:mm"/></td>
									<td><fmt:formatDate value="${it.start_time}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td><fmt:formatDate value="${it.end_time}" pattern="MM-dd HH:mm"/></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${allItems==null || fn:length(allItems) < 1}">
							<tr>
								<td class="text-center danger" colspan="7">没有找到相关信息</td>
							</tr>
						</c:if>
					</table>
				</form>
			</div>
		</div>
	<%--Add弹框--%>
	<div class="modal fade bs-example-modal-sm" id="addAdd"
		tabindex="-1" role="dialog" aria-labelledby="addItemLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addStationsLabel">排程</h4>
				</div>
				<div class="modal-header">
				<form class="form-horizontal" id="orderAddFm">
					<div class="form-group">
						<label class="col-sm-2 control-label">安排工位</label>
						<div class="col-sm-3">
							<select class="form-control" name="rep_station" id="repSelect" onchange="getCusEmps();" check-type="required">
                                  <option value="">请选择...</option>
                                  <c:forEach items="${stationList }" var="it">
										<option value="${it.id }">${it.w_name}</option>
									</c:forEach>
                                </select>
                                <input type="hidden" name="id" id="itemId"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">安排工人</label>
						<div class="col-sm-8" id="rep_worker">
						</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label">预计开始时间</label>
							<div class="col-sm-5">
								<div class="input-group date form_datetime" data-link-field="start_time">
				                    <input class="form-control" size="16" type="text" readonly placeholder="请选择接车时间" check-type="required">
				                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
									<input type="hidden" id="pre_start_time" name="pre_start_time" value="" /><br/>
				                </div>
			                </div>
		               </div>
		               <div class="form-group">
							<label class="col-sm-2 control-label">预计结束时间</label>
							<div class="col-sm-5">
								<div class="input-group date form_datetime" data-link-field="pre_end_time">
			                    <input class="form-control" size="16" type="text" value="" readonly placeholder="请选择接车时间" check-type="required">
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
								<input type="hidden" id="pre_end_time" name="pre_end_time" value="" /><br/>
			                </div>
							</div>
						</div>
					</form>
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="valiBtn" onclick="addOrderAdd();" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	<%----/弹框--%>
	</div>
</body>
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
    $(document).ready(function() {
        $("#orderAddFm").validation(function(obj,params){  
	      //扩展校验方法
	    });
	    $("#valiBtn").on('click',function(event){
	      // 2.最后要调用 valid()方法。
	      if ($("#orderAddFm").valid('填写信息不正确。')==false){
	        return false;
	      } else {
	      	var load = layer.load();
			$.ajax({  
			   type: "POST",  
			   url: "/AMS/order/insertSchedule",  
			   data: $("#orderAddFm").serializeArray(),  
			   dataType: 'json',  
			   success: function(rst){
				   layer.close(load);
				   if(rst.status == 200){
					   location.reload();
				   } else {
						layer.msg(rst.message);
					}
			   }  
			});
	      }
	    });
    });
    function schedule(id){
    	$('#addAdd').modal();
    	$("#itemId").val(id);
    }
    function getCusEmps(){
    	var load = layer.load();
    	$("#rep_worker").empty();
    	var wpId = $("#repSelect").val();
		  $.ajax({
		   type: "POST",  
		   url: "/AMS/order/getEmpByWpId",  
		   data: {wpId: wpId},
		   dataType: 'json',  
		   success: function(rst){
			   layer.close(load);
			   if(rst.status == 200){
			   		$.each(rst.ewList, function(i,obj){
			   			$("#rep_worker").append("<label class=\"checkbox-inline\">"+
							  "<input type=\"checkbox\" name=\"rep_emp_id\" value=\""+obj.e_id+"\">"+obj.e_name+"</label>");
			   		});
			   } else {
					layer.msg(rst.message);
				}
		   }  
		});
    }
</script>
</html>