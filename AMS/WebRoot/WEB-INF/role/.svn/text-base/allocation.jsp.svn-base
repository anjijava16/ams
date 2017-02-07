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
		<title> <shiro:hasRole name="系统管理员">系统管理 —角色分配</shiro:hasRole><shiro:lacksRole name="系统管理员">钣喷中心信息管理-系统管理</shiro:lacksRole></title>
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
						return layer.msg('请选择要清除的用户。',so.default),!0;
					}
					var array = [];
					checkeds.each(function(){
						array.push(this.value);
					});
					return deleteById(array);
				});

			});
			<!--根据ID数组清空用户的角色-->
			function deleteById(ids){
				var index = layer.confirm("确定清除这"+ ids.length +"个用户的角色？",function(){
					var load = layer.load();
					$.post('<%=basePath%>/role/clearRoleByUserIds',{userIds:ids.join(',')},function(result){
						layer.close(load);
						if(result && result.status != 200){
							return layer.msg(result.message,so.default),!0;
						}else{
							layer.msg(result.message);
							setTimeout(function(){
								$('#formId').submit();
							},1000);
						}
					},'json');
					layer.close(index);
				});
			}
			<!--选择角色后保存-->
			function selectRole(){
				var checked = $("#boxRoleForm  :checked");
				var ids=[],names=[];
				$.each(checked,function(){
					ids.push(this.id);
					names.push($.trim($(this).attr('name')));
				});
				var index = layer.confirm("确定操作？",function(){
					<!--loding-->
					var load = layer.load();
					$.post('<%=basePath%>/role/addRole2User',{ids:ids.join(','),userId:$('#selectUserId').val()},function(result){
						layer.close(load);
						if(result && result.status != 200){
							return layer.msg(result.message,so.default),!1;
						}
						layer.msg('添加成功。');
						setTimeout(function(){
							$('#formId').submit();
						},1000);
					},'json');
				});
			}
			/*
			*根据角色ID选择权限，分配权限操作。
			*/
			function selectRoleById(id){
				var load = layer.load();
				$.post("<%=basePath%>/role/selectRoleByUserId",{id:id},function(result){
					layer.close(load);
					if(result && result.length){
						var html =[];
						$.each(result,function(){
							html.push("<div class='checkbox'><label>");
							html.push("<input type='checkbox' id='");
							html.push(this.id);
							html.push("'");
							if(this.check){
								html.push(" checked='checked'");
							}
							html.push("name='");
							html.push(this.name);
							html.push("'/>");
							html.push(this.name);
							html.push('</label></div>');
						});
						return so.id('boxRoleForm').html(html.join('')) & $('#selectRole').modal(),$('#selectUserId').val(id),!1;
					}else{
						return layer.msg('没有获取到用户数据，请先注册数据。',so.default);
					}
				},'json');
			}
		</script>
	</head>
	<body data-target="#one" data-spy="scroll">
     <jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<div class="row">
            <div id="one" class="col-md-2">
	<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu" style=" left:0;top: 151px; z-index: 100;">
    <shiro:hasRole name="系统管理员">
     <li>
			<a href="<%=basePath %>/permission/list">
				<i class="glyphicon glyphicon-chevron-right"></i>权限列表
			</a>
		</li>   
         <li>
			<a href="<%=basePath %>/permission/allocation">
				<i class="glyphicon glyphicon-chevron-right"></i>权限分配
			</a>
		</li>   
    <li>
			<a href="<%=basePath %>/role/list">
				<i class="glyphicon glyphicon-chevron-right"></i>角色列表
			</a>
		</li>
		<li class="active">
			<a href="<%=basePath %>/role/allocation">
				<i class="glyphicon glyphicon-chevron-right"></i>角色分配
			</a>
		</li>      
    </shiro:hasRole>
    <shiro:lacksRole name="系统管理员">
    <li>
			<a href="<%=basePath %>/manager/list">
				<i class="glyphicon glyphicon-chevron-right"></i>管理用户列表
			</a>
		</li>
         <li>
			<a href="<%=basePath %>/role/list">
				<i class="glyphicon glyphicon-chevron-right"></i>角色列表
			</a>
		</li>
    <li class="active">
			<a href="<%=basePath %>/role/allocation">
				<i class="glyphicon glyphicon-chevron-right"></i>角色分配
			</a>
		</li>     
    </shiro:lacksRole>
    
	</ul>
</div>
			<div class="col-md-10">
					<h2>用户角色分配</h2>
					<hr>
					<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入用户名 / 真实姓名">
					      </div>
					     <span class="">
				         	<button type="submit" class="btn btn-primary">查询</button>
				         
				         		<button type="button" id="deleteAll" class="btn  btn-danger">清空用户角色</button>
			         	
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
						<input type="hidden" id="selectUserId">
						<tr>
							<th width="5%"><input type="checkbox" id="checkAll"/></th>
							<th width="10%">用户名</th>
						
							<th width="10%">状态</th>
							<th width="55%">拥有的角色</th>
							<th width="10%">操作</th>
						</tr>
					    <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.username}</td>
									
									<td><c:choose>
      <c:when test="${it.status==1}">
      有效
      </c:when>
      
      <c:otherwise>禁止</c:otherwise>
     
</c:choose></td>
									<td roleIds="${it.roleIds}">${it.roleNames}</td>
									<td>
									
											<i class="glyphicon glyphicon-share-alt"></i><a href="javascript:selectRoleById(${it.id});">选择角色</a>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                              <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="5">没有找到用户</td>
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
			</div><%--/row--%>
			<%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="selectRole" tabindex="-1" role="dialog" aria-labelledby="selectRoleLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="selectRoleLabel">分配角色</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          loading...
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="selectRole();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
				<%----/弹框--%>
			
		</div>
			
	</body>
</html>