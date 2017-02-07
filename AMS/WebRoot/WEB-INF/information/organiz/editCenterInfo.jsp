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
		<title>钣喷中心信息管理 —组织机构--钣喷中心编辑</title>
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
						//判断省份城市信息
						
			    		load = layer.load('正在提交！！！');
			    	},
			    	dataType:"json",
			    	clearForm:false
				});
			
		});
		$(function () {
			var o_prov=$("#o_prov").val();
		var o_city=$("#o_city").val();
		var o_zone=$("#o_zone").val();
		if(o_prov==''){
			o_prov='—— 省 ——-';
			}
			if(o_city==''){
				o_city='—— 市 ——-';
				}
		if(o_zone==''){
				o_zone='—— 区 ——';
				}	
				var $distpicker = $('#distpicker');

  $distpicker.distpicker({
	autoSelect: false,
   province: o_prov,
  city: o_city,
  district: o_zone,	
  });

			});
		
		
	
	
		</script>
	</head>
	<body data-target="#one" data-spy="scroll">
     <jsp:include page="../../views/common/head.jsp" flush="true"></jsp:include>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<div class="row">
           <div id="one" class="col-md-2">
	<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu" style=" left:0;top: 151px; z-index: 100;">
     <shiro:hasPermission name="/role/addRole">
		<li class="active">
			<a href="<%=basePath %>/centerInfo/list">
				<i class="glyphicon glyphicon-chevron-right"></i>钣喷中心管理
			</a>
		</li>
  </shiro:hasPermission>
   <shiro:lacksRole name="系统管理员">
   <li class="active">
			<a href="<%=basePath %>/centerInfo/list">
				<i class="glyphicon glyphicon-chevron-right"></i>中心信息管理
			</a>
		</li>
         <li>
			<a href="<%=basePath %>/organiz/listDepartment">
				<i class="glyphicon glyphicon-chevron-right"></i>部门管理
			</a>
		</li>
         <li>
			<a href="<%=basePath %>/organiz/listStations">
				<i class="glyphicon glyphicon-chevron-right"></i>职务管理
			</a>
		</li>
         <li>
			<a href="<%=basePath %>/organiz/listProfession">
				<i class="glyphicon glyphicon-chevron-right"></i>工种管理
			</a>
		</li>
         <li>
			<a href="<%=basePath %>/organiz/listEmployee">
				<i class="glyphicon glyphicon-chevron-right"></i>员工管理
			</a>
		</li>
         <li>
			<a href="<%=basePath %>/organiz/listRest">
				<i class="glyphicon glyphicon-chevron-right"></i>员工休班管理
			</a>
		</li>
   </shiro:lacksRole>     
	   
	</ul>
</div>
			<div class="col-md-10">
					<h2><shiro:lacksRole name="系统管理员"> 中心信息编辑</shiro:lacksRole><shiro:hasRole name="系统管理员">钣喷中心编辑</shiro:hasRole></h2>
					<hr>
				<form id="formId" enctype="multipart/form-data" action="<%=basePath%>/organiz/updateCenterInfo" method="post" class="form-horizontal">
                <input type="hidden" name="id" value="${centerInfo.id}">
                <input type="hidden" name="o_prov" value="${centerInfo.c_prov}" id="o_prov">
                 <input type="hidden" name="o_city" value="${centerInfo.c_city}" id="o_city">
                  <input type="hidden" name="o_zone" value="${centerInfo.c_zone}" id="o_zone">
						  <div class="form-group">
						    <label for="c_name" class="col-sm-2 control-label">中心名称</label><div class="col-sm-5">
						   <input type="text" class="form-control"  name="c_name" id="c_name" placeholder="请输入中心名称" value="${centerInfo.c_name}"/> </div>
						  </div>
                           <div class="form-group">
						    <label for="c_shorter_name" class="col-sm-2 control-label">中心简称</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_shorter_name" id="c_shorter_name" placeholder="请输入中心简称" value="${centerInfo.c_shorter_name}"/>
                          </div>
						  </div>
                        
						 <div class="form-group">
							<label class="col-sm-2 control-label">省市区</label>
							<div class="col-sm-5" id="distpicker">
								<div class="col-sm-6 form-group">
									<select class="form-control" name="c_prov"
										 id="c_prov" ></select>
								</div>
								<div class="col-sm-6 form-group">
									<select class="form-control" name="c_city"
										 id="c_city" ></select>
								</div>
								<div class="col-sm-6 form-group">
									<select class="form-control" name="c_zone"
										 id="c_zone" ></select>
								</div>
							</div>
						</div>
                          <div class="form-group">
						    <label for="c_address" class="col-sm-2 control-label">中心地址</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_address" id="c_address" placeholder="请输入中心地址" value="${centerInfo.c_address}"/></div>
						  </div>
                           <div class="form-group">
						    <label for="c_zip" class="col-sm-2 control-label">邮编</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_zip" id="c_zip" placeholder="请输入邮编" value="${centerInfo.c_zip}"/></div>
						  </div>
                            <div class="form-group">
						    <label for="firmsnumber" class="col-sm-2 control-label">传真</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_fax" id="c_fax" placeholder="请输入传真" value="${centerInfo.c_fax}"/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="c_linkman" class="col-sm-2 control-label">中心联系人</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="c_linkman" id="c_linkman" placeholder="请输入中心联系人" value="${centerInfo.c_linkman}"/>
                          </div>
						  </div>
                           
                            <div class="form-group">
						    <label for="c_tel" class="col-sm-2 control-label">联系电话</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="c_tel" id="c_tel" placeholder="请输入联系电话" value="${centerInfo.c_tel}"/></div>
						  </div>
                             <div class="form-group">
						    <label for="c_bank_deposit" class="col-sm-2 control-label">开户行</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="c_bank_deposit" id="c_bank_deposit" placeholder="请输入开户行" value="${centerInfo.c_bank_deposit}"/></div>
						  </div>
                            <div class="form-group">
						    <label for="c_account" class="col-sm-2 control-label">开户账号</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="c_account" id="c_account" placeholder="请输入开户账号" value="${centerInfo.c_account}"/></div>
						  </div>
                          
                           <div class="form-group">
						   <label for="c_remarks" class="col-sm-2 control-label">备注</label><div class="col-sm-5">
 <textarea name="c_remarks"   id="c_remarks" class="form-control">${centerInfo.c_remarks}</textarea>
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