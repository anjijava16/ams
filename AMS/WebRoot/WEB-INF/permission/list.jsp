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
		<title>系统管理 —权限列表</title>
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
					return deleteById(array);
				});
	
			});
	
			function deleteById(ids){
				var index = layer.confirm("确定这"+ ids.length +"个权限？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/permission/deletePermissionById',{ids:ids.join(',')},function(result){
						layer.close(load);
						if(result && result.status != 200){
							return layer.msg(result.message,so.default),!0;
						}else{
							layer.msg(result.resultMsg);
							setTimeout(function(){
								$('#formId').submit();
							},1000);
						}
					},'json');
					layer.close(index);
				});
			}
	
			<!--添加权限-->
			function addPermission(){
				var name = $('#name').val(),
					url  = $('#url').val();
					modename =  $('#modename').val();
				if($.trim(name) == ''){
					return layer.msg('权限名称不能为空。',so.default),!1;
				}
				if($.trim(url) == ''){
					return layer.msg('权限Url不能为空。',so.default),!1;
				}
				if($.trim(modename) == ''){
					return layer.msg('所属功能不能为空。',so.default),!1;
				}
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/permission/addPermission',{name:name,url:url,modename:modename},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('添加成功。');
					setTimeout(function(){
						$('#formId').submit();
					},1000);
				},'json');
			}
				/*
			*根据权限ID获取信息用于编辑。
			*/
			function editById(id){
				var load = layer.load();
				$.post("<%=basePath%>/permission/editPermissionById",{id:id},function(result){
					layer.close(load);
					if(result){
						var html =[];
						  html.push('<div class="form-group">');
						  html.push('<label for="recipient-name" class="control-label">权限名称:</label>');
						  html.push("<input type='text' class='form-control' name='name' id='ename' value='");
						  html.push(result.name);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						  html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">权限链接:</label>');
						  html.push("<input type='text' class='form-control' id='eurl' name='url'  value='");
						  html.push(result.url);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">所属功能:</label>');
						  html.push("<input type='text' class='form-control' id='emodename' name='modename'  value='");
						  html.push(result.modename);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');

						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxEditRoleForm').html(html.join('')),
						$('#editPermission').modal(),$('#selectPermissionId').val(id),!1;
					}else{
						return layer.msg('获取权限信息失败，请重新获取。',so.default);
					}
				},'json');
			}
			<!--保存编辑权限-->
			function updatePermission(){
				var name = $('#ename').val(),
					url  = $('#eurl').val();
					modename =  $('#emodename').val();
				if($.trim(name) == ''){
					return layer.msg('权限名称不能为空。',so.default),!1;
				}
				if($.trim(url) == ''){
					return layer.msg('权限Url不能为空。',so.default),!1;
				}
				if($.trim(modename) == ''){
					return layer.msg('所属功能不能为空。',so.default),!1;
				}
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath%>/permission/updatePermission',{id:$('#selectPermissionId').val(),name:name,url:url,modename:modename},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('编辑权限成功。');
					setTimeout(function(){
						$('#formId').submit();
					},1000);
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
    <li class="active">
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
		<li>
			<a href="<%=basePath %>/role/allocation">
				<i class="glyphicon glyphicon-chevron-right"></i>角色分配
			</a>
		</li>      
	</ul>
</div>
			<div class="col-md-10">
					<h2>权限列表</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="权限名称 / 权限链接">
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                         <a class="btn btn-success" onclick="$('#addPermission').modal();">增加权限</a>
				         
				         		<button type="button" id="deleteAll" class="btn  btn-danger">删除</button>
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                    <input type="hidden" id="selectPermissionId">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>权限名称</th>
							<th>权限链接</th>
                            <th>所属功能</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.name}</td>
									<td>${it.url}</td>
                                    <td>${it.modename}</td>
								
									<td>
										

										<i class="glyphicon glyphicon-remove"></i><a href="javascript:deleteById([${it.id}]);">删除</a> <i class="glyphicon glyphicon-edit"></i><a href="javascript:editById(${it.id});">编辑</a>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="5">没有找到权限</td>
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
			<div class="modal fade bs-example-modal-sm"  id="addPermission" tabindex="-1" role="dialog" aria-labelledby="addPermissionLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="addPermissionLabel">添加权限</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">权限名称:</label>
			            <input type="text" class="form-control" name="name" id="name" placeholder="请输入权限名称"/>
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">权限链接:</label>
			            <input type="text" class="form-control" id="url" name="url"  placeholder="请输入权限URL地址">
			          </div>
                       <div class="form-group">
			            <label for="recipient-name" class="control-label">所属功能:</label>
			            <input type="text" class="form-control" id="modename" name="modename"  placeholder="请输入权限所属功能">
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addPermission();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		  <%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="editPermission" tabindex="-1" role="dialog" aria-labelledby="editPermissionLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="editPermissionLabel">编辑权限</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxEditRoleForm">
			       loading....
			         
			           
			    
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="updatePermission();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
			
		</div>
			
	</body>
</html>