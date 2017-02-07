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
		<title>钣喷中心信息管理 —工位管理-工位管理</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个工位？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/station/deleteWorkplaceById',{ids:ids.join(',')},function(result){
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
					<h2>工位管理</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入工位名称/工位类别">
                                        
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                              <shiro:hasPermission name="/station/toSetWorkplace"><shiro:lacksRole name="系统管理员"> <a class="btn btn-success" href="<%=basePath%>/station/toSetWorkplace">添加工位</a></shiro:lacksRole><shiro:hasRole name="系统管理员"> <a class="btn btn-success" href="<%=basePath%>/station/toSetWorkplace?centerid=${findCenterId}">添加工位</a></shiro:hasRole></shiro:hasPermission>
				       
				         		<shiro:hasPermission name="/station/deleteWorkplaceById"><button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectWorkplaceId">
                       <input type="hidden" id="centerid" value="${findCenterId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>分类名称</th>
							<th>子类</th>
                            <th>工位名称</th>
                            <th>工位序号</th>
                             <th>车辆检测器序号</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.place_parent_name}</td>
									<td>${it.place_name}</td>
                                    <td>${it.w_name}</td>
									<td>${it.w_no}</td>
                                    <td>${it.equipment_id}</td><td>
							
										

										<shiro:hasPermission name="/station/deleteWorkplaceById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission>
							<shiro:lacksRole name="系统管理员">  <shiro:hasPermission name="/station/editWorkplaceById"> <i class="glyphicon glyphicon-edit"></i><a href="<%=basePath%>/station/editWorkplaceById?id=${it.id}">编辑</a></shiro:hasPermission> <shiro:hasPermission name="/station/listEwplace"><i class="glyphicon glyphicon-user"></i><a href="<%=basePath%>/station/listEwplace?findStationId=${it.id}&w_name=${it.w_name}">绑定人员</a></shiro:hasPermission></shiro:lacksRole><shiro:hasRole name="系统管理员"> <shiro:hasPermission name="/station/editWorkplaceById"> <i class="glyphicon glyphicon-edit"></i><a href="<%=basePath%>/station/editWorkplaceById?id=${it.id}&centerid=${it.centerid}">编辑</a></shiro:hasPermission><shiro:hasPermission name="/station/listEwplace"><i class="glyphicon glyphicon-user"></i><a href="<%=basePath%>/station/listEwplace?findStationId=${it.id}&centerid=${it.centerid}&w_name=${it.w_name}">绑定人员</a></shiro:hasPermission></shiro:hasRole>			
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="7">没有找到工位</td>
							</tr>
						</c:if>
					</table>
					    <c:if test="${page.list!=null && fn:length(page.list) > 0}">
						<div class="pagination pull-right">
							${page.pageHtml}
						</div>
					</c:if>
					</form>
				</div>
			</div>
		</div>
			
	</body>
</html>