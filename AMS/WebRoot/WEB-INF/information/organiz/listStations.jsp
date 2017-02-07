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
		<title>钣喷中心信息管理 —组织机构-职务信息管理</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个职务？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/organiz/deleteStationsById',{ids:ids.join(',')},function(result){
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
			
				<!--添加职务信息-->
			function addStations(){
				var s_name = $('#s_name').val(),
					seq  = $('#seq').val();
				
				if($.trim(s_name) == ''){
					return layer.msg('职务名称不能为空。',so.default),!1;
				}
				if($.trim(seq) == ''){
					return layer.msg('职务排序不能为空。',so.default),!1;
				}
				
			
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/organiz/addStations',{s_name:s_name,s_code:$('#s_code').val(),seq:seq,s_summary:$('#s_summary').val(),centerid:$('#centerid').val()},function(result){
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
				$.post("<%=basePath%>/organiz/editStationsById",{id:id},function(result){
					layer.close(load);
					if(result){
						var html =[];
					   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">职务名称:</label>');
						  html.push("<input type='text' class='form-control' id='es_name' name='s_name'  value='");
						  html.push(result.s_name);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');	
			
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">职务代码:</label>');
						  html.push("<input type='text' class='form-control' id='es_code' name='s_code'  value='");
						  html.push(result.s_code);
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
						  html.push(' <label for="recipient-name" class="control-label">简介:</label>');
						  html.push("<textarea name='s_summary'   id='es_summary' class='form-control'>");
						   html.push(result.s_summary);
						   html.push('</textarea>');
						  html.push('</div>');


						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxEditRoleForm').html(html.join('')),
						$('#editStations').modal(),$('#selectStationsId').val(id),!1;
					}else{
						return layer.msg('获取职务信息，请重新获取。',so.default);
					}
				},'json');
			}
			<!--保存编辑职务信息-->
			function updateStations(){
					var s_name = $('#es_name').val(),
					seq  = $('#eseq').val();
				
				if($.trim(s_name) == ''){
					return layer.msg('职务名称不能为空。',so.default),!1;
				}
				if($.trim(seq) == ''){
					return layer.msg('职务排序不能为空。',so.default),!1;
				}
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath%>/organiz/updateStations',{id:$('#selectStationsId').val(),s_name:s_name,s_code:$('#es_code').val(),seq:seq,s_summary:$('#es_summary').val(),centerid:$('#centerid').val()},function(result){
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
         <li>
			<a href="<%=basePath %>/organiz/listDepartment">
				<i class="glyphicon glyphicon-chevron-right"></i>部门管理
			</a>
		</li>
         <li class="active">
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
					<h2>职务信息管理</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入名称/ 简介/代码">
                                        
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                             <shiro:hasPermission name="/organiz/addStations"> <a class="btn btn-success" onclick="$('#addStations').modal();">添加职务</a></shiro:hasPermission>
				       
				         		<shiro:hasPermission name="/organiz/deleteStationsById"><button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectStationsId">
                       <input type="hidden" id="centerid" value="${findCenterId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>职务名称</th>
							<th>职务代码</th>
                            <th>排序</th>
							<th>简介</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.s_name}</td>
									<td>${it.s_code}</td>
                                    <td>${it.seq}</td>
                                    <td>${it.s_summary}</td><td>
							
										

										<shiro:hasPermission name="/organiz/deleteStationsById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission> <shiro:hasPermission name="/organiz/editStationsById"> <i class="glyphicon glyphicon-edit"></i><a href="javascript:editById(${it.id});">编辑</a></shiro:hasPermission>
										
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
			<div class="modal fade bs-example-modal-sm"  id="addStations" tabindex="-1" role="dialog" aria-labelledby="addStationsLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="addStationsLabel">添加职务</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">职务名称:</label>
                         <input type="text" class="form-control" id="s_name" name="s_name"  placeholder="请输入职务名称">
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">职务代码:</label>
			            <input type="text" class="form-control" id="s_code" name="s_code"  placeholder="请输入职务代码">
			          </div>
                      <div class="form-group">
			            <label for="recipient-name" class="control-label">排序:</label>
			            <input type="text" class="form-control" id="seq" name="seq"  placeholder="请输入排序">
			          </div>  
                       <div class="form-group">
			            <label for="recipient-name" class="control-label">简介:</label>
			           <textarea name="s_summary"   id="s_summary" class="form-control"></textarea>
			          </div>  
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addStations();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		  <%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="editStations" tabindex="-1" role="dialog" aria-labelledby="editStationsLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="editStationsLabel">编辑职务</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxEditRoleForm">
			       loading....
			         
			           
			    
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="updateStations();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
			
		</div>
			
	</body>
</html>