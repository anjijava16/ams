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
		<title>系统管理 —数据字典-添加基础配件信息</title>
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
			    		if($.trim($("#partsname").val()) == ''){
				    		layer.msg('请输入配件名称',function(){});
				    		$("#partsname").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#partsname").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#partsnumber").val()) == ''){
				    		layer.msg('请输入配件编号',function(){});
				    		$("#partsnumber").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#partsnumber").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#firmsnumber").val()) == ''){
				    		layer.msg('请输入原厂编号',function(){});
				    		$("#firmsnumber").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#firmsnumber").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#applymodel").val()) == ''){
				    		layer.msg('请输入适用车型',function(){});
				    		$("#applymodel").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#applymodel").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#partsprice").val()) == ''){
				    		layer.msg('请输入配件价格',function(){});
				    		$("#partsprice").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#partsprice").parent().removeClass('has-error').addClass('has-success');
			    		}
			    		
			    		load = layer.load('正在提交！！！');
			    	},
			    	dataType:"json",
			    	clearForm:true
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
        <li class="active">	    
	    	<a href="<%=basePath%>/carParts/list"><i class="glyphicon glyphicon-chevron-right"></i>基础配件数据列表</a>   
	    </li>
         <li>	    
	    	<a href="<%=basePath%>/workplaceType/list"><i class="glyphicon glyphicon-chevron-right"></i>基础工位类型数据列表</a>   
	    </li>
         <li>	    
	    	<a href="<%=basePath%>/workingHours/list"><i class="glyphicon glyphicon-chevron-right"></i>基础标准工时数据列表</a>   
	    </li>
      
	</ul>
</div>
			<div class="col-md-10">
					<h2>基础配件信息添加</h2>
					<hr>
				<form id="formId" enctype="multipart/form-data" action="<%=basePath%>/carParts/addCarParts" method="post" class="form-horizontal">
						  <div class="form-group">
						    <label for="damage_parts_group" class="col-sm-2 control-label">损伤部件分组</label><div class="col-sm-5">
						   <input type="text" class="form-control"  name="damage_parts_group" id="damage_parts_group" placeholder="请输入损伤部件分组"/> </div>
						  </div>
                           <div class="form-group">
						    <label for="damage_position" class="col-sm-2 control-label">损伤部位</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="damage_position" id="damage_position" placeholder="请输入损伤部位"/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="damage_parts" class="col-sm-2 control-label">损伤部件</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="damage_parts" id="damage_parts" placeholder="请输入损伤部件"/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="partsname" class="col-sm-2 control-label">配件名称</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="partsname" id="partsname" placeholder="请输入配件名称"/></div>
						  </div>
                            <div class="form-group">
						    <label for="partsnumber" class="col-sm-2 control-label">配件编号</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="partsnumber" id="partsnumber" placeholder="请输入配件编号"/></div>
						  </div>
                            <div class="form-group">
						    <label for="firmsnumber" class="col-sm-2 control-label">原厂编号</label><div class="col-sm-5">
						  <input type="text" class="form-control" name="firmsnumber" id="firmsnumber" placeholder="请输入原厂编号"/>
                          </div>
						  </div>
                            <div class="form-group">
						    <label for="applymodel" class="col-sm-2 control-label">适用车型</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="applymodel" id="applymodel" placeholder="请输入适用车型"/></div>
						  </div>
                            <div class="form-group">
						    <label for="partsprice" class="col-sm-2 control-label">配件价格</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="partsprice" id="partsprice" placeholder="请输入配件价格"/></div>
						  </div>
                            <div class="form-group">
						  <label for="partstype" class="col-sm-2 control-label">配件类别</label><div class="col-sm-5">
                                        
                                            <select id="partstype" name="partstype" class="form-control">
      <option value="">请选择...</option>             
 
                                        <c:forEach items="${partstypeList }" var="it">
         <option value="${it}">${it}</option>
                             </c:forEach>                                       </select></div>
</div>
                           <div class="form-group">
						   <label for="damage_position" class="col-sm-2 control-label">备注</label><div class="col-sm-5">
						 <textarea name="remarks"   id="remarks" class="form-control"></textarea>
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