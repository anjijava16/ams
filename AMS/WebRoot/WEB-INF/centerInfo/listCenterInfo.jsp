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
		<title>系统管理 —钣喷中心管理-钣喷中心列表</title>
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
		<script >
			so.init(function(){
				//初始化全选。
				so.checkBoxInit('#checkAll','[check=box]');
				
				//全选
				so.id('deleteAll').on('click',function(){
					var checkeds = $('[check=box]:checked');
					if(!checkeds.length){
						return layer.msg('请选择要删除的选项。',so.default),!0;
					}
					var array = [];
					checkeds.each(function(){
						array.push(this.value);
					});
					return _delete(array);
				});
				
			});
		
			//根据ID数组，删除
			function _delete(ids){
				var index = layer.confirm("确定这"+ ids.length +"个钣喷中心？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/centerInfo/deleteCenterInfoById',{ids:ids.join(',')},function(result){
						layer.close(load);
						if(result && result.status != 200){
							return layer.msg(result.message,so.default),!0;
						}else{
							layer.msg('删除成功');
							setTimeout(function(){
								$('#formId').submit();
							},1000);
						}
					},'json');
					layer.close(index);
				});
			}
			
		
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
					<h2> <shiro:lacksRole name="系统管理员"> 中心信息管理</shiro:lacksRole><shiro:hasRole name="系统管理员">钣喷中心列表</shiro:hasRole></h2>
					<hr>
                    <shiro:hasRole name="系统管理员">
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="中心名称/ 简称/省份/城市/区县">
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                           <shiro:hasPermission name="/centerInfo/toAddCenterInfo"> <a class="btn btn-success" href="<%=basePath%>/centerInfo/toAddCenterInfo">开设钣喷中心</a></shiro:hasPermission>
				        <shiro:hasPermission name="/centerInfo/deleteCenterInfoById">
				         		<button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
                        </shiro:hasRole>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectCenterInfoId">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>中心名称</th>
							<th>简称</th>
							<th>位置信息</th>
							<th>开设时间</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.c_name}</td>
									<td>${it.c_shorter_name}</td>
									<td>${it.c_prov}-${it.c_city}-${it.c_zone}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${it.c_addtime}" /></td>
		<td>
										

										 <shiro:hasPermission name="/organiz/getCenterInfo"><i class="glyphicon glyphicon-search"></i><a href="<%=basePath%>/organiz/getCenterInfo?id=${it.id}">查看</a></shiro:hasPermission> <shiro:hasPermission name="/organiz/editCenterInfo"><i class="glyphicon glyphicon-edit"></i><a href="<%=basePath%>/organiz/editCenterInfo?id=${it.id}">编辑</a>  </shiro:hasPermission><shiro:hasRole name="系统管理员"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a><li class="dropdown" style="list-style-type:none;">
                                       
                        <i class="glyphicon glyphicon-th-list"></i><a href="#" data-toggle="dropdown" class="dropdown-toggle">中心管理 <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu1">
                            <li>
                               <a  href="<%=basePath%>/station/listWorkplaceType?centerid=${it.id}">工位分类管理</a>
                            </li>
                            <li>
                               <a href="<%=basePath%>/station/listWorkplace?centerid=${it.id}">工位管理</a>
                            </li>
                              <li>
                               <a href="<%=basePath%>/station/listEwplace?centerid=${it.id}">绑定人员</a>
                            </li>
                           
                            <li>
                                <a href="<%=basePath%>/model/listCarModel?centerid=${it.id}">车型管理</a>
                            </li>
                              <li>
                                <a href="<%=basePath%>/parts/listParts?centerid=${it.id}">配件管理</a>
                            </li>
                             <li>
                                <a href="<%=basePath%>/tasktime/listTasktime?centerid=${it.id}">维修方法管理</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/organiz/listDepartment?centerid=${it.id}">部门管理</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/organiz/listStations?centerid=${it.id}">职务管理</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/organiz/listProfession?centerid=${it.id}">工种管理</a>
                            </li>
                             <li>
                                <a href="<%=basePath%>/organiz/listEmployee?centerid=${it.id}">员工管理</a>
                            </li>
                             <li>
                                <a href="<%=basePath%>/organiz/listRest?centerId=${it.id}">员工休班管理</a>
                            </li>
                             <li>
                                <a href="<%=basePath%>/equipment/listViewEquipment?centerid=${it.id}">展示器管理</a>
                            </li>
                        </ul>
                    </li></shiro:hasRole>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="6">没有找到已开钣喷中心数据</td>
							</tr>
						</c:if>
					</table>
                     <shiro:hasRole name="系统管理员">
					    <c:if test="${page.list!=null && fn:length(page.list) > 0}">
						<div class="pagination pull-right">
							${page.pageHtml}
						</div>
					</c:if>
					</form>
                    </shiro:hasRole>
				</div>
			</div><%--/row--%>
				
		</div>
			
	</body>
</html>