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
		<title>钣喷中心信息管理 —组织机构-钣喷中心详情</title>
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
					<h2>${centerInfo.c_name}钣喷中心详情</h2>
					<hr>
					<table class="table table-bordered">
						<tr>
							<th>中心名称</th>
							<td>${centerInfo.c_name}</td>
						</tr>
						<tr>
							<th>简称</th>
							<td>${centerInfo.c_shorter_name}</td>
						</tr>
						<tr>
							<th>位置信息</th>
							<td>${centerInfo.c_prov}-${centerInfo.c_city}-${centerInfo.c_zone}</td>
						</tr>
						<tr>
							<th>地址</th>
							<td>${centerInfo.c_address}</td>
						</tr>
						<tr>
							<th>邮编</th>
							<td>${centerInfo.c_zip}</td>
						</tr>
						<tr>
							<th>传真</th>
							<td>${centerInfo.c_fax}</td>
						</tr>
						<tr>
							<th>联系人</th>
							<td>${centerInfo.c_linkman}</td>
						</tr>
						<tr>
							<th>电话</th>
							<td>${centerInfo.c_tel}</td>
						</tr>
						<tr>
							<th>开户行</th>
							<td>${centerInfo.c_bank_deposit}</td>
						</tr>
						<tr>
							<th>开户账号</th>
							<td>${centerInfo.c_account}</td>
						</tr>
                        <tr>
							<th>备注</th>
							<td>${centerInfo.c_remarks}</td>
						</tr>
					</table>
				</div>
			</div><!--/row-->
				
		</div>
			
	</body>
</html>