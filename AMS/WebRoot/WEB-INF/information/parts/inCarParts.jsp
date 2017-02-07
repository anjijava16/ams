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
		<title>钣喷中心信息管理 —配件管理-配件入库</title>
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
			    		if(!/^\d+(\.\d{2})?$/.test($("#partsprice").val())){
				    		layer.msg('请输入正确的配件价格',function(){});
				    		$("#partsprice").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#partsprice").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if(!/^\d+(\.\d{2})?$/.test($("#purchaseprice").val())){
				    		layer.msg('请输入格式正确配件采购价格',function(){});
				    		$("#purchaseprice").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#purchaseprice").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if(!/^\d+$/.test($("#stocknum").val())){
				    		layer.msg('配件入库数量必须是整数',function(){});
				    		$("#stocknum").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#stocknum").parent().removeClass('has-error').addClass('has-success');
			    		}
			    		
			    		load = layer.load('正在提交！！！');
			    	},
			    	dataType:"json",
			    	clearForm:false
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
			<a href="<%=basePath %>/parts/listParts">
				<i class="glyphicon glyphicon-chevron-right"></i>配件管理
			</a>
		</li>
        
   </shiro:lacksRole>     
	   
	</ul>
</div>
			<div class="col-md-10">
					<h2>配件入库</h2>
					<hr>
				<form id="formId" enctype="multipart/form-data" action="<%=basePath%>/parts/inCarParts" method="post" class="form-horizontal">
                 <input type="hidden" name="id" value="${carParts.id}">
                 <input type="hidden" name="centerid" value="${carParts.centerid}">
						  <div class="form-group">
						    <label for="damage_parts_group" class="col-sm-2 control-label">损伤部件分组</label><div class="col-sm-5">
						   <input type="text" class="form-control"   value="${carParts.damage_parts_group}" readonly/>
                           </div>
						  </div>
                           <div class="form-group">
						    <label for="damage_position" class="col-sm-2 control-label">损伤部位</label><div class="col-sm-5">
						  <input type="text" class="form-control"  value="${carParts.damage_position}" readonly/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="damage_parts" class="col-sm-2 control-label">损伤部件</label><div class="col-sm-5">
						  <input type="text" class="form-control"  value="${carParts.damage_parts}" readonly/></div>
						  </div>
                            <div class="form-group">
						    <label for="partsname" class="col-sm-2 control-label">配件名称</label><div class="col-sm-5">
						  <input type="text" class="form-control"  value="${carParts.partsname}" readonly/></div>
						  </div>
                            <div class="form-group">
						    <label for="partsnumber" class="col-sm-2 control-label">配件编号</label><div class="col-sm-5">
						  <input type="text" class="form-control"  value="${carParts.partsnumber}" readonly/></div>
						  </div>
                            <div class="form-group">
						    <label for="firmsnumber" class="col-sm-2 control-label">原厂编号</label><div class="col-sm-5">
						  <input type="text" class="form-control"  value="${carParts.firmsnumber}" readonly/></div>
						  </div>
                            <div class="form-group">
						    <label for="applymodel"class="col-sm-2 control-label">适用车型</label><div class="col-sm-5">
						  <input type="text" class="form-control"  value="${carParts.applymodel}" readonly/></div>
						  </div>
                             <div class="form-group">
						  <label for="partstype" class="col-sm-2 control-label">配件类别</label><div class="col-sm-5">  <input type="text" class="form-control"  value="${carParts.partstype}" readonly/>                                      
</div>
						  </div>                       <div class="form-group">
						    <label for="partsprice"class="col-sm-2 control-label">配件价格</label>
						  <div class="col-sm-5"><input type="text" class="form-control" name="partsprice" id="partsprice" placeholder="请输入配件价格" value="${carParts.partsprice}"/>(输入库存配件价格将统一变更为最新售价)</div>
						  </div>
                         
   <div class="form-group">
						    <label for="partsprice"class="col-sm-2 control-label">配件采购价格</label>
						  <div class="col-sm-5"><input type="text" class="form-control" name="purchaseprice" id="purchaseprice" placeholder="请输入配件采购价格"/>(调整配件销售价格，请在此输入)</div>
						  </div>
                           <div class="form-group">
						    <label for="stocknum"class="col-sm-2 control-label">配件入库数量</label>
						  <div class="col-sm-5"><input type="text" class="form-control" name="stocknum" id="stocknum" placeholder="请输入配件入库数量"/></div>
						  </div>

                      
						 
						  <div class="form-actions">
							  <button type="submit" class="btn btn-large btn-block btn-primary">入库</button>
						  </div>
                        
						</form>
				</div>
			</div>
			
		</div>
			
	</body>
</html>