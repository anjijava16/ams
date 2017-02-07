<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
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
		<title>系统管理 —钣喷中心管理-开设钣喷中心</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<link href="<%=basePath%>/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<%=basePath %>/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
       
     <link href="<%=basePath%>/css/common/base.css" rel="stylesheet"/>
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
      	<script  src="<%=basePath%>/vendors/jquery1.8.3.min.js"></script>
     	<script  src="<%=basePath%>/js/common/layer/layer.js"></script>
		<script  src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script  src="<%=basePath%>/js/shiro.demo.js"></script>
        <script src="<%=basePath%>/vendors/jquery.form-2.82.js"></script>
<script src="<%=basePath%>/vendors/bootstrap-datepicker.js"></script>
<script src="<%=basePath%>/assets/distpicker.data.js"></script>
<script src="<%=basePath%>/assets/distpicker.js"></script>
		<script>
		
		$(function(){
				var load;
				$("#formId").ajaxForm({
			    	success:function (result){
			    		layer.close(load);
			    		if(result && result.status == 300){
			    			layer.msg(result.message,function(){});
			    			return !1;
			    		}
			    		if(result && result.status == 500){
			    			layer.msg("操作失败！",function(){});
			    			return !1;
			    		}
			    		layer.msg('操作成功！');
			    	},
			    	beforeSubmit:function(){
			    		//判断参数
			    		if($.trim($("#c_name").val()) == ''){
				    		layer.msg('请输入钣喷中心名称',function(){});
				    		$("#c_name").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#c_name").parent().removeClass('has-error').addClass('has-success');
			    		}
						
			    		load = layer.load('正在提交！！！');
			    	},
			    	dataType:"json",
			    	clearForm:true
				});
			
		});
		$(function () {
	var $distpicker = $('#distpicker');

  $distpicker.distpicker({
	autoSelect: false,
   province: '—— 省 ——-',
  city: '—— 市 ——-',
  district: '—— 区 ——',	
  });

			});
		</script>
	</head>
	<body data-target="#one" data-spy="scroll">
     <jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<div class="row">
            <div id="one" class="col-md-2">
	<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu" style=" left:0;top: 151px; z-index: 100;">
		<li class="active">
			<a href="<%=basePath %>/centerInfo/list">
				<i class="glyphicon glyphicon-chevron-right"></i>钣喷中心管理
			</a>
		</li>
      
	  
	</ul>
</div>
			<div class="col-md-10">
					<h2>钣喷中心开设</h2>
					<hr>
				<form id="formId" enctype="multipart/form-data" action="<%=basePath%>/centerInfo/addCenterInfo" method="post" class="form-horizontal">
						  <div class="form-group">
						    <label for="c_name" class="col-sm-2 control-label">中心名称</label><div class="col-sm-5">
						   <input type="text" class="form-control"  name="c_name" id="c_name" placeholder="请输入中心名称"/> </div>
						  </div>
                           <div class="form-group">
						    <label for="c_shorter_name" class="col-sm-2 control-label">中心简称</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_shorter_name" id="c_shorter_name" placeholder="请输入中心简称"/>
                          </div>
						  </div>
                          <div class="form-group">
							<label class="col-sm-2 control-label">省市区</label>
							<div class="col-sm-5" id="distpicker">
								<div class="col-sm-6 form-group">
									<select class="form-control" name="c_prov"
										data-province="---- 选择省 ----" id="c_prov"></select>
								</div>
								<div class="col-sm-6 form-group">
									<select class="form-control" name="c_city"
										data-city="---- 选择市 ----" id="c_city"></select>
								</div>
								<div class="col-sm-6 form-group">
									<select class="form-control" name="c_zone"
										data-district="---- 选择区 ----" id="c_zone"></select>
								</div>
							</div>
						</div>
                          <div class="form-group">
						    <label for="c_address" class="col-sm-2 control-label">中心地址</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_address" id="c_address" placeholder="请输入中心地址"/></div>
						  </div>
                           <div class="form-group">
						    <label for="c_zip" class="col-sm-2 control-label">邮编</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_zip" id="c_zip" placeholder="请输入邮编"/></div>
						  </div>
                            <div class="form-group">
						    <label for="firmsnumber" class="col-sm-2 control-label">传真</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_fax" id="c_fax" placeholder="请输入传真"/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="c_linkman" class="col-sm-2 control-label">中心联系人</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_linkman" id="c_linkman" placeholder="请输入中心联系人"/>
                          </div>
						  </div>
                           
                            <div class="form-group">
						    <label for="c_tel" class="col-sm-2 control-label">联系电话</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="c_tel" id="c_tel" placeholder="请输入联系电话"/></div>
						  </div>
                             <div class="form-group">
						    <label for="c_bank_deposit" class="col-sm-2 control-label">开户行</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="c_bank_deposit" id="c_bank_deposit" placeholder="请输入开户行"/></div>
						  </div>
                            <div class="form-group">
						    <label for="c_account" class="col-sm-2 control-label">开户账号</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="c_account" id="c_account" placeholder="请输入开户账号"/></div>
						  </div>
                          
                           <div class="form-group">
						   <label for="c_remarks" class="col-sm-2 control-label">备注</label><div class="col-sm-5">
						 <textarea name="c_remarks"   id="c_remarks" class="form-control"></textarea>
						</div>
                          </div>
						 
						  <div class="form-actions">
							  <button type="submit" class="btn btn-large btn-block btn-primary">保存</button> 
                              
                              
                             
						  </div>
                        
						</form>
				</div>
			</div>
			
		</div>
			
	</body>
</html>