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
		<title>钣喷中心信息管理 —组织机构-工种管理</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个工种？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/organiz/deleteProfessionById',{ids:ids.join(',')},function(result){
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
			
				<!--添加工种信息-->
			function addProfession(){
				var p_name = $('#p_name').val(),
					p_type  = $('#p_type').val();
					p_level= $('#p_level').val();
				
				if($.trim(p_name) == ''){
					return layer.msg('工种名称不能为空。',so.default),!1;
				}
				if($.trim(p_type) == ''){
					return layer.msg('工种类别不能为空。',so.default),!1;
				}
				if($.trim(p_level) == ''){
					return layer.msg('工种级别不能为空。',so.default),!1;
				}
				
			
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/organiz/addProfession',{p_name:p_name,p_code:$('#p_code').val(),p_type:p_type,p_level:p_level,centerid:$('#centerid').val()},function(result){
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
				$.post("<%=basePath%>/organiz/editProfessionById",{id:id},function(result){
					layer.close(load);
					if(result){
						var html =[];
					   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">工种名称:</label>');
						  html.push("<input type='text' class='form-control' id='ep_name' name='p_name'  value='");
						  html.push(result.p_name);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');	
			
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">工种代码:</label>');
						  html.push("<input type='text' class='form-control' id='ep_code' name='p_code'  value='");
						  html.push(result.p_code);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">工种类别:</label>');
						  html.push("<input type='text' class='form-control' id='ep_type' name='p_type'  value='");
						  html.push(result.p_type);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">工种级别:</label>');
						  html.push("<input type='text' class='form-control' id='ep_level' name='p_level'  value='");
						  html.push(result.p_level);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						   


						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxEditRoleForm').html(html.join('')),
						$('#editProfession').modal(),$('#selectProfessionId').val(id),!1;
					}else{
						return layer.msg('获取工种信息，请重新获取。',so.default);
					}
				},'json');
			}
			<!--保存编辑工种信息-->
			function updateProfession(){
				var p_name = $('#ep_name').val(),
					p_type  = $('#ep_type').val();
					p_level= $('#ep_level').val();
				
				if($.trim(p_name) == ''){
					return layer.msg('工种名称不能为空。',so.default),!1;
				}
				if($.trim(p_type) == ''){
					return layer.msg('工种类别不能为空。',so.default),!1;
				}
				if($.trim(p_level) == ''){
					return layer.msg('工种级别不能为空。',so.default),!1;
				}
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath%>/organiz/updateProfession',{id:$('#selectProfessionId').val(),p_name:p_name,p_code:$('#ep_code').val(),p_type:p_type,p_level:p_level,centerid:$('#centerid').val()},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('编辑工种信息成功。');
					setTimeout(function(){
						$('#formId').submit();
					},1000);
				},'json');
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
   <li>
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
         <li  class="active">
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
					<h2>工种管理</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入工种名称/ 工种代码/工种类别/工种级别">
                                        
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                              <shiro:hasPermission name="/organiz/addProfession"><a class="btn btn-success" onclick="$('#addProfession').modal();">添加工种</a></shiro:hasPermission>
				       
				         		<shiro:hasPermission name="/organiz/deleteProfessionById"><button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectProfessionId">
                       <input type="hidden" id="centerid" value="${findCenterId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>工种名称</th>
							<th>工种代码</th>
                            <th>工种类别</th>
							<th>工种级别</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.p_name}</td>
									<td>${it.p_code}</td>
                                    <td>${it.p_type}</td>
                                    <td>${it.p_level}</td><td>
							
										

										<shiro:hasPermission name="/organiz/deleteProfessionById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission><shiro:hasPermission name="/organiz/editProfessionById"> <i class="glyphicon glyphicon-edit"></i><a href="javascript:editById(${it.id});">编辑</a></shiro:hasPermission>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="6">没有找到职务信息</td>
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
			<div class="modal fade bs-example-modal-sm"  id="addProfession" tabindex="-1" role="dialog" aria-labelledby="addProfessionLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="addStationsLabel">添加职务</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">工种名称:</label>
                         <input type="text" class="form-control" id="p_name" name="p_name"  placeholder="请输入工种名称">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">职务代码:</label>
			            <input type="text" class="form-control" id="p_code" name="p_code"  placeholder="请输入职务代码">
			          </div>
                      <div class="form-group">
			            <label for="recipient-name" class="control-label">工种类别:</label>
			            <input type="text" class="form-control" id="p_type" name="p_type"  placeholder="请输入类别（钣金、油漆、机电）">
			          </div>  
                       <div class="form-group">
			            <label for="recipient-name" class="control-label">工种级别:</label>
			           <input type="text" class="form-control" id="p_level" name="p_level"  placeholder="请输入工种级别">
			          </div>  
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addProfession();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		  <%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="editProfession" tabindex="-1" role="dialog" aria-labelledby="editProfessionLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="editProfessionLabel">编辑工种</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxEditRoleForm">
			       loading....
			         
			           
			    
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="updateProfession();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
			
		</div>
			
	</body>
</html>