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
		<title>钣喷中心信息管理 —组织机构-部门信息管理</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个部门？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/organiz/deleteDepartmentById',{ids:ids.join(',')},function(result){
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
			
				<!--添加部门信息-->
			function addDepartment(){
				var d_name = $('#d_name').val(),
					seq  = $('#seq').val();
				
				if($.trim(d_name) == ''){
					return layer.msg('部门名称不能为空。',so.default),!1;
				}
				if($.trim(seq) == ''){
					return layer.msg('部门排序不能为空。',so.default),!1;
				}
				
			
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/organiz/addDepartment',{d_name:d_name,d_tel:$('#d_tel').val(),seq:seq,d_remarks:$('#d_remarks').val(),centerid:$('#centerid').val()},function(result){
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
				$.post("<%=basePath%>/organiz/editDepartmentById",{id:id},function(result){
					layer.close(load);
					if(result){
						var html =[];
					   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">部门名称:</label>');
						  html.push("<input type='text' class='form-control' id='ed_name' name='d_name'  value='");
						  html.push(result.d_name);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');	
			
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">部门电话:</label>');
						  html.push("<input type='text' class='form-control' id='ed_tel' name='d_tel'  value='");
						  html.push(result.d_tel);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">排序:</label>');
						  html.push("<input type='text' class='form-control' id='eseq' name='seq'  value='");
						  html.push(result.seq);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						     html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">备注:</label>');
						  html.push("<textarea name='d_remarks'   id='ed_remarks' class='form-control'>");
						   html.push(result.d_remarks);
						   html.push('</textarea>');
						  html.push('</div>');


						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxEditRoleForm').html(html.join('')),
						$('#editDepartment').modal(),$('#selectDepartmentId').val(id),!1;
					}else{
						return layer.msg('获取部门信息，请重新获取。',so.default);
					}
				},'json');
			}
			<!--保存编辑部门信息-->
			function updateDepartment(){
					var d_name = $('#ed_name').val(),
					seq  = $('#eseq').val();
				
				if($.trim(d_name) == ''){
					return layer.msg('部门名称不能为空。',so.default),!1;
				}
				if($.trim(seq) == ''){
					return layer.msg('部门排序不能为空。',so.default),!1;
				}
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath%>/organiz/updateDepartment',{id:$('#selectDepartmentId').val(),d_name:d_name,d_tel:$('#ed_tel').val(),seq:seq,d_remarks:$('#ed_remarks').val(),centerid:$('#centerid').val()},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('编辑部门信息成功。');
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
         <li class="active">
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
					<h2>部门信息管理</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入名称/ 描述">
                                        
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                            <shiro:hasPermission name="/organiz/addDepartment"> <a class="btn btn-success" onclick="$('#addDepartment').modal();">添加部门</a></shiro:hasPermission>
				       <shiro:hasPermission name="/organiz/deleteDepartmentById">
				         		<button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectDepartmentId">
                       <input type="hidden" id="centerid" value="${findCenterId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>部门名称</th>
							<th>部门电话</th>
                            <th>排序</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.d_name}</td>
									<td>${it.d_tel}</td>
                                    <td>${it.seq}</td>
                                    <td>${it.d_remarks}</td><td>
							
										

										<shiro:hasPermission name="/organiz/deleteDepartmentById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission><shiro:hasPermission name="/organiz/editDepartmentById"> <i class="glyphicon glyphicon-edit"></i><a href="javascript:editById(${it.id});">编辑</a></shiro:hasPermission>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="6">没有找到部门信息</td>
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
			<div class="modal fade bs-example-modal-sm"  id="addDepartment" tabindex="-1" role="dialog" aria-labelledby="addDepartmentLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="addDepartmentLabel">添加部门</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">部门名称:</label>
                         <input type="text" class="form-control" id="d_name" name="d_name"  placeholder="请输入部门名称">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">部门电话:</label>
			            <input type="text" class="form-control" id="d_tel" name="d_tel"  placeholder="请输入部门电话">
			          </div>
                      <div class="form-group">
			            <label for="recipient-name" class="control-label">排序:</label>
			            <input type="text" class="form-control" id="seq" name="seq"  placeholder="请输入排序">
			          </div>  
                       <div class="form-group">
			            <label for="recipient-name" class="control-label">备注:</label>
			           <textarea name="d_remarks"   id="d_remarks" class="form-control"></textarea>
			          </div>  
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addDepartment();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		  <%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="editDepartment" tabindex="-1" role="dialog" aria-labelledby="editDepartmentLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="editDepartmentLabel">编辑部门</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxEditRoleForm">
			       loading....
			         
			           
			    
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="updateDepartment();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
			
		</div>
			
	</body>
</html>