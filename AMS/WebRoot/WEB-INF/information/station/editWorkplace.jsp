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
		<title>钣喷中心信息管理 —工位管理-工位编辑</title>
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
			    		if($.trim($("#workplace_type_id").val()) == ''){
				    		layer.msg('请选择工位类别',function(){});
				    		$("#workplace_type_id").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#workplace_type_id").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#w_name").val()) == ''){
				    		layer.msg('请输入工位名称',function(){});
				    		$("#w_name").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#w_name").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#w_no").val()) == ''){
				    		layer.msg('请输入工位号',function(){});
				    		$("#w_no").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#w_no").parent().removeClass('has-error').addClass('has-success');
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
			<a href="<%=basePath %>/station/listWorkplace">
				<i class="glyphicon glyphicon-chevron-right"></i>工位管理
			</a>
		</li>
         <li>
			<a href="<%=basePath %>/station/listWorkplaceType">
				<i class="glyphicon glyphicon-chevron-right"></i>工位分类管理
			</a>
		</li>
        
   </shiro:lacksRole>     
	   
	</ul>
</div>
			<div class="col-md-10">
					<h2>工位编辑</h2>
					<hr>
				<form id="formId" enctype="multipart/form-data" action="<%=basePath%>/station/updateWorkplace" method="post" class="form-horizontal">
						
                          
                            <div class="form-group">
						  <label for="workplace_type_id" class="col-sm-2 control-label">工位类别</label><div class="col-sm-5">
                                        
                                            <select id="workplace_type_id" name="workplace_type_id" class="form-control">
      <option value="">请选择...</option>             
   <c:forEach items="${listType }" var="it">
      <c:choose>
      <c:when test="${it.id eq station.workplace_type_id}">
       <option value="${it.id}" selected>${it.place_parent_name}-${it.place_name}</option>
      </c:when>
      
      <c:otherwise>   <option value="${it.id}">${it.place_parent_name}-${it.place_name}</option></c:otherwise>
     
</c:choose>
                             </c:forEach>                                       </select></div>
</div>
    <div class="form-group">
						    <label for="w_name" class="col-sm-2 control-label">工位名称</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="w_name" id="w_name" placeholder="工位名称" value="${station.w_name}"/></div>
						  </div><div class="form-group">
						    <label for="w_no" class="col-sm-2 control-label">工位号</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="w_no" id="w_no" placeholder="请输入工位号" value="${station.w_no}"/></div>
						  </div><div class="form-group">
						    <label for="equipment_id" class="col-sm-2 control-label">车辆检测器序号</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="equipment_id" id="equipment_id" placeholder="车辆检测器序号" value="${station.equipment_id}"/></div>
						  </div>                       
						 
	    <div class="form-actions">
							  <button type="submit" class="btn btn-large btn-block btn-primary">保存</button> 
                              
                              
                             
						  </div>
                         <input type="hidden" name="centerid" value="${station.centerid}">
                          <input type="hidden" name="id" value="${station.id}">
						</form>
				</div>
			</div>
			
		</div>
			
	</body>
</html>