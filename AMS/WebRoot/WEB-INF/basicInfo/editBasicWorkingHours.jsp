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
		<title>系统管理 —数据字典-编辑基础标准工时信息</title>
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
			    		if($.trim($("#damage_parts_group").val()) == ''){
				    		layer.msg('请输入损伤部件分组',function(){});
				    		$("#damage_parts_group").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#damage_parts_group").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#damage_position").val()) == ''){
				    		layer.msg('请输入损伤部位',function(){});
				    		$("#damage_position").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#damage_position").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#damage_parts").val()) == ''){
				    		layer.msg('请输入损伤部件',function(){});
				    		$("#damage_parts").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#damage_parts").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#repairtype").val()) == ''){
				    		layer.msg('请输入维修类型',function(){});
				    		$("#repairtype").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#repairtype").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#repairmethod").val()) == ''){
				    		layer.msg('请输入维修方法',function(){});
				    		$("#repairmethod").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#repairmethod").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#taskproject").val()) == ''){
				    		layer.msg('请输入作业项目',function(){});
				    		$("#taskproject").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#taskproject").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#repairlevel").val()) == ''){
				    		layer.msg('请输入作业级别',function(){});
				    		$("#repairlevel").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#repairlevel").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#pricerange").val()) == ''){
				    		layer.msg('请输入价格区间',function(){});
				    		$("#pricerange").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#pricerange").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#hours").val()) == ''){
				    		layer.msg('请输入所需工时(分钟)',function(){});
				    		$("#hours").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#hours").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#price").val()) == ''){
				    		layer.msg('请输入所需费用',function(){});
				    		$("#price").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#price").parent().removeClass('has-error').addClass('has-success');
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
     <jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<div class="row">
             <div id="one" class="col-md-2">
	<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu" style=" left:0;top: 151px; z-index: 100;">
		<li>
			<a href="<%=basePath %>/carModel/list">
				<i class="glyphicon glyphicon-chevron-right"></i>基础车型数据列表
			</a>
		</li>
        <li>	    
	    	<a href="<%=basePath%>/carParts/list"><i class="glyphicon glyphicon-chevron-right"></i>基础配件数据列表</a>   
	    </li>
         <li>	    
	    	<a href="<%=basePath%>/workplaceType/list"><i class="glyphicon glyphicon-chevron-right"></i>基础工位类型数据列表</a>   
	    </li>
         <li class="active">	    
	    	<a href="<%=basePath%>/workingHours/list"><i class="glyphicon glyphicon-chevron-right"></i>基础标准工时数据列表</a>   
	    </li>
      
	</ul>
</div>
			<div class="col-md-10">
					<h2>基础标准工时信息编辑</h2>
					<hr>
				<form id="formId" enctype="multipart/form-data" action="<%=basePath%>/workingHours/updateWorkingHours" method="post" class="form-horizontal">
                <input type="hidden" name="id" value="${workingHours.id}">
						  <div class="form-group">
						    <label for="damage_parts_group" class="col-sm-2 control-label">损伤部件分组</label><div class="col-sm-5">
						   <input type="text" class="form-control"  name="damage_parts_group" id="damage_parts_group" placeholder="请输入损伤部件分组" value="${workingHours.damage_parts_group}"/> </div>
						  </div>
                           <div class="form-group">
						    <label for="damage_position" class="col-sm-2 control-label">损伤部位</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="damage_position" id="damage_position" placeholder="请输入损伤部位" value="${workingHours.damage_position}"/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="damage_parts" class="col-sm-2 control-label">损伤部件</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="damage_parts" id="damage_parts" placeholder="请输入损伤部件" value="${workingHours.damage_parts}"/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="repairtype" class="col-sm-2 control-label">维修类型</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="repairtype" id="repairtype" placeholder="请输入维修类型" value="${workingHours.repairtype}"/></div>
						  </div>
                            <div class="form-group">
						    <label for="repairmethod" class="col-sm-2 control-label">维修方法</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="repairmethod" id="repairmethod" placeholder="请输入维修方法" value="${workingHours.repairmethod}"/></div>
						  </div>
                            <div class="form-group">
						    <label for="taskproject" class="col-sm-2 control-label">作业项目</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="taskproject" id="taskproject" placeholder="请输入作业项目" value="${workingHours.taskproject}"/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="repairlevel" class="col-sm-2 control-label">作业级别</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="repairlevel" id="repairlevel" placeholder="请输入作业级别" value="${workingHours.repairlevel}"/></div>
						  </div>
                            <div class="form-group">
						    <label for="pricerange" class="col-sm-2 control-label">价格区间</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="pricerange" id="pricerange" placeholder="请输入价格区间" value="${workingHours.pricerange}"/></div>
						  </div>
                           <div class="form-group">
						    <label for="hours" class="col-sm-2 control-label">所需工时(分钟)</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="hours" id="hours" placeholder="请输入所需工时(分钟)" value="${workingHours.hours}"/></div>
						  </div>
                           <div class="form-group">
						    <label for="price" class="col-sm-2 control-label">所需费用</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="price" id="price" placeholder="请输入所需费用" value="${workingHours.price}"/></div>
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