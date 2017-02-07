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
<title>系统管理 —管理用户</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<link
	href="<%=basePath%>/js/common/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">

<link href="<%=basePath%>/css/common/base.css" rel="stylesheet" />
<link href="<%=basePath%>/vendors/datepicker.css" rel="stylesheet"
	media="screen">
<link href="<%=basePath%>/vendors/chosen.min.css" rel="stylesheet" media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="<%=basePath%>/vendors/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/common/layer/layer.js"></script>
<script src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/shiro.demo.js"></script>
<script src="<%=basePath%>/vendors/bootstrap-datepicker.js"></script>
<script src="<%=basePath%>/assets/distpicker.data.js"></script>
<script src="<%=basePath%>/assets/distpicker.js"></script>
<script src="<%=basePath%>/assets/nation.js"></script>
<script src="<%=basePath%>/assets/main.js"></script>
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
					<h4 class="modal-title" id="addPermissionLabel">联系人信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="linkFm" action="<%=basePath %>/customer/insertLinkman" method="post">
						<div class="form-group">
							<label class="col-sm-2 control-label">联系人姓名</label>
							<div class="col-sm-3">
								<input type="text" name="link_name" class="form-control"
									value="${link.link_name }" placeholder="请输入联系人姓名" check-type="required"/>
								<input type="hidden" name="id" value="${link.id }" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">所属客户</label>
							<div class="col-sm-2">
								<select id="cus" class="chzn-select" name="cus_id" check-type="required" required-message="请选择所属客户">
                                  <option value="">请选择客户</option>
                                  <c:forEach items="${customers }" var="it">
										<option value="${it.id }"
										<c:if test="${link.cus_id == it.id}">selected</c:if>>${it.cus_name}</option>
									</c:forEach>
                                </select>
							</div>
							<div class="col-sm-1">
								<button type="button" class="btn btn-link" onclick="javascript:addCustomer();">新增客户</button>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机号</label>
							<div class="col-sm-3">
								<input name="link_tel" type="text" class="form-control"
									value="${link.link_tel }" placeholder="请输入联系人手机号" check-type="mobile" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">出生日期</label>
							<div class="col-sm-3">
								<input name="link_birth" type="text" class="input-xlarge datepicker"
									value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${link.link_birth}" />" placeholder="请选择出生日期"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">证件类型</label>
							<div class="col-sm-3">
								<select class="form-control" name="link_idtype">
									<option value="">请选择...</option>
									<c:forEach items="${idTypes }" var="it">
										<option value="${it.data_key }"
											<c:if test="${link.link_idtype == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 control-label">证件号码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="link_idnum"
									value="${link.link_idnum }" placeholder="请输入证件号码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">省市区</label>
							<div class="col-sm-8" id="distpicker" >
								<div class="col-sm-3 form-group">
								<label class="sr-only" for="province">Province</label>
									<select class="form-control" name="link_prov" ></select>
								</div>
								<div class="col-sm-3 form-group">
								<label class="sr-only" for="city">City</label>
									<select class="form-control" name="link_city" ></select>
								</div>
								<div class="col-sm-3 form-group">
								<label class="sr-only" for="district">District</label>
									<select class="form-control" name="link_zone"></select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">通讯地址</label>
							<div class="col-sm-3">
								<input name="link_addr" type="text" class="form-control"
									value="${link.link_addr }" placeholder="请输入通讯地址"/>
							</div>
							<label class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-3">
								<input name="link_zip" type="number" class="form-control"
									value="${link.link_zip }" placeholder="请输入邮政编码"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">民族</label>
							<div class="col-sm-3">
								<select class="form-control" name="link_nation" id="nation">
									<option value="">请选择...</option>
									<c:forEach items="${nations }" var="it">
										<option value="${it.data_key }"
											<c:if test="${link.link_nation == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 control-label">关系</label>
							<div class="col-sm-3">
								<select class="form-control" name="relation">
									<option value="">请选择...</option>
									<c:forEach items="${relationTypes }" var="it">
										<option value="${it.data_key }"
											<c:if test="${link.relation == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea name="bak" class="form-control" placeholder="请输入备注">${link.bak }</textarea>
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
		//民族加载
		jQuery(document).ready(
			function() {
				for ( var i = 0; i < arrayNation.length; i++) {
					var ifSelected = false;
					var nation = '${link.link_nation}';
					if (nation == arrayNation[i]) {
						ifSelected = true;
					}
					if (ifSelected) {
						$("#nation").append(
								"<option value='"+arrayNation[i]+"' selected>"
										+ arrayNation[i] + "</option>");
					} else {
						$("#nation").append(
								"<option value='"+arrayNation[i]+"'>"
										+ arrayNation[i] + "</option>");
					}
				}
			});
			//时间选择框
		$(function() {
			$(".datepicker").datepicker();
			$('#distpicker').distpicker({
				  autoSelect: false,
				  province: '${link.link_prov}',
				  city: '${link.link_city}',
				  district: '${link.link_zone}'
			  });
			  $("#linkFm").validation(function(obj,params){  
		      //扩展校验方法
		      console.log(obj);
		      console.log(params);
		    });
		    $("#valiBtn").on('click',function(event){
		      // 2.最后要调用 valid()方法。
		      if ($("#linkFm").valid('填写信息不正确。')==false){
		        return false;
		      }
		    });
		});
		
		$(".chzn-select").chosen();
		
		function addCustomer(){
		location.href="/AMS/customer/add";
	}
	</script>
</body>
</html>