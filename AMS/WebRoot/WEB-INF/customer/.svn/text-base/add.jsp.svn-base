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
<script src="<%=basePath%>/assets/distpicker.data.js"></script>
<script src="<%=basePath%>/assets/distpicker.js"></script>
<script src="<%=basePath%>/assets/nation.js"></script>
<script src="<%=basePath%>/assets/bootstrap3-validation.js"></script>
<script>
	//时间选择框
		$(function() {
			$(".datepicker").datepicker();
			  $('#distpicker').distpicker({
				  autoSelect: false,
				  province: '${customer.prov}',
				  city: '${customer.city}',
				  district: '${customer.zone}'
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
				<div class="modal-header">
					<h4 class="modal-title">客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="cusFm" action="<%=basePath %>/customer/insert" method="post" role="form">
						<div class="form-group">
							<label class="col-sm-2 control-label">客户姓名</label>
							<div class="col-sm-3">
								<input type="text" name="cus_name" class="form-control" value="${customer.cus_name }" 
								placeholder="请输入客户姓名" maxlength="10" check-type="required"/>
									<input type="hidden" id="cusId" name="id" value="${customer.id }" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">手机号</label>
								<div class="col-sm-3">
								<input name="tel" id="tel" type="number" class="form-control"
									value="${customer.tel }" placeholder="请输入客户手机号" check-type="mobile" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-3">
								<select class="form-control" name="sex">
									<option value="">请选择...</option>
									<option value="0"
										<c:if test="${customer.sex == '0'}">selected</c:if>>男</option>
									<option value="1"
										<c:if test="${customer.sex == '1'}">selected</c:if>>女</option>
								</select>
							</div>
							<label class="col-sm-2 control-label">EMAIL</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="email" name="email" 
								value="${customer.email }" placeholder="请输入客户电子邮箱" maxlength="20" check-type="email"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">证件类型</label>
							<div class="col-sm-3">
								<select class="form-control" name="id_type">
									<option value="">请选择...</option>
									<c:forEach items="${idTypes }" var="it">
										<option value="${it.data_key }"
											<c:if test="${customer.id_type == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-sm-2 control-label">证件号码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="id_num"
									value="${customer.id_num }" placeholder="请输入证件号码" maxlength="20">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">证件地址</label>
							<div class="col-sm-3">
								<input name="id_addr" type="text" class="form-control"
									value="${customer.id_addr }" placeholder="请输入证件地址" maxlength="50"/>
							</div>
							<label class="col-sm-2 control-label">办公电话</label>
							<div class="col-sm-3">
								<input name="phone" type="number" class="form-control"
									value="${customer.phone }" placeholder="请输入办公电话" maxlength="15"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">省市区</label>
							<div class="col-sm-8" id="distpicker" >
								<div class="col-sm-3 form-group">
									<select class="form-control" id="prov" name="prov" ></select>
								</div>
								<div class="col-sm-3 form-group">
									<select class="form-control" id="city" name="city" ></select>
								</div>
								<div class="col-sm-3 form-group">
									<select class="form-control" id="zone" name="zone"  ></select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">通讯地址</label>
							<div class="col-sm-3">
								<input name="cont_addr" type="text" class="form-control"
									value="${customer.cont_addr }" placeholder="请输入通讯地址" maxlength="50"/>
							</div>
							<label class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-3">
								<input name="zip_code" type="number" class="form-control"
									value="${customer.zip_code }" placeholder="请输入邮政编码" maxlength="6"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">出生日期</label>
							<div class="col-sm-3">
							<input name="birth" type="text" class="input-xlarge datepicker"
									value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${customer.birth}" />" placeholder="请选择出生日期"/>
			                </div>
							<label class="col-sm-2 control-label">民族</label>
							<div class="col-sm-3">
								<select class="form-control" name="nation" id="nation">
									<option value="">请选择...</option>
									<c:forEach items="${nations }" var="it">
										<option value="${it.data_key }"
											<c:if test="${customer.nation == it.data_key}">selected</c:if>>${it.data_value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea name="bak" class="form-control" placeholder="请输入备注">${customer.bak }</textarea>
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
    $(document).ready(function() {
        $("#cusFm").validation(function(obj,params){
        	if (obj.id=='tel'){
        		var cusId = $('#cusId').val();
		       $.post("<%=basePath %>/customer/verifyTel",{tel :$(obj).val()},function(data){
			         if(data.status == 400 && data.id != cusId){
			         	params.err = true;
			         	params.msg = '手机号码已存在';
			         }
		        });
	      }
	      if(obj.id=='email'){
        		if (!isEmail($(obj).val()) && $(obj).val() != '')
				 {
				 	params.err = true;
		         	params.msg = 'email格式不正确';
				 }
        	}
	      }, {reqmark:false});
	    $("#valiBtn").on('click',function(event){
	      // 2.最后要调用 valid()方法。
	      if ($("#cusFm").valid('填写信息不正确。')==false){
	        return false;
	      }
	    });
    });
    function isEmail(str){
	  var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	  return reg.test(str);
	 }
	//民族加载
	jQuery(document).ready(
		function() {
			for ( var i = 0; i < arrayNation.length; i++) {
				var ifSelected = false;
				var nation = '${customer.nation}';
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
</script>
</body>
</html>