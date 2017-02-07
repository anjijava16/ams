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
		<title><shiro:hasRole name="系统管理员">系统管理 —管理用户-修改密码</shiro:hasRole><shiro:lacksRole name="系统管理员">钣喷中心信息管理-系统管理-修改密码</shiro:lacksRole></title>
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
<script src="<%=basePath%>/vendors/jquery.form-2.82.js"></script>
		<script>
			$(function(){
				var load;
				$("#formId").ajaxForm({
			    	success:function (result){
			    		layer.close(load);
			    		if(result && result.status != 200){
			    			return layer.msg(result.message,function(){}),!1;
			    		}else{
				    		layer.msg('操作成功！');
				    		$("form :password").val('');
			    		}
			    	},
			    	beforeSubmit:function(){
			    		//判断参数
			    		if($.trim($("#pswd").val()) == ''){
				    		layer.msg('请输入原密码',function(){});
				    		$("#pswd").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#pswd").parent().removeClass('has-error').addClass('has-success');
			    		}
			    		if($.trim($("#newPswd").val()) == ''){
				    		layer.msg('请输入新密码',function(){});
				    		$("#newPswd").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#newPswd").parent().removeClass('has-error').addClass('has-success');
			    		}
			    		if($.trim($("#reNewPswd").val()) == ''){
				    		layer.msg('请再次输入新密码',function(){});
				    		$("#reNewPswd").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#reNewPswd").parent().removeClass('has-error').addClass('has-success');
			    		}
			    		if($("#reNewPswd").val() != $("#newPswd").val()){
			    			return layer.msg('2次新密码输入不一致。',function(){}),!1;
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
		<shiro:hasPermission name="/role/addRole">
        <li class="active">
			<a href="<%=basePath %>/manager/list">
				<i class="glyphicon glyphicon-chevron-right"></i>管理用户列表
			</a>
		</li>
         </shiro:hasPermission>
   <shiro:lacksRole name="系统管理员">
        <li class="active">
			<a href="<%=basePath %>/manager/list">
				<i class="glyphicon glyphicon-chevron-right"></i>管理用户列表
			</a>
		</li>
        <li>
			<a href="<%=basePath %>/role/list">
				<i class="glyphicon glyphicon-chevron-right"></i>角色列表
			</a>
		</li>
         <li>
			<a href="<%=basePath %>/role/allocation">
				<i class="glyphicon glyphicon-chevron-right"></i>角色分配
			</a>
		</li>
           </shiro:lacksRole>  
       
	</ul>
</div>
			<div class="col-md-10">
					<h2>密码修改</h2>
					<hr>
					<form id="formId" enctype="multipart/form-data" action="<%=basePath%>/manager/updatePswd" method="post" class="form-horizontal">
						  <div class="form-group">
						    <label for="pswd" class="col-sm-2 control-label">原密码</label><div class="col-sm-5">
						    <input type="password" class="form-control" autocomplete="off" id="pswd" maxlength="20" name="pswd"  placeholder="请输入原密码"></div>
						  </div>
						  <div class="form-group">
						    <label for="newPswd" class="col-sm-2 control-label">新密码</label>
                            <div class="col-sm-5">
						    <input type="password" class="form-control" autocomplete="off" id="newPswd" maxlength="20" name="newPswd" placeholder="请输入新密码"></div>
						  </div>
						  <div class="form-group">
						    <label for="reNewPswd" class="col-sm-2 control-label">新密码（再输入一次）</label><div class="col-sm-5">
						    <input type="password" class="form-control" autocomplete="off" id="reNewPswd" maxlength="20" name="reNewPswd"placeholder="请再次输入新密码"></div>
						  </div>
						  <div class="form-actions">
							  <button type="submit" class="btn btn-large btn-block btn-primary">确定修改</button>
						  </div>
						</form>
					</form>
				</div>
			</div>
		
			
		</div>
			
	</body>
</html>