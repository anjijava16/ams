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
		<title>钣喷中心信息管理 —工位管理-工位分类管理</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个工位分类？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/station/deleteWorkplaceTypeById',{ids:ids.join(',')},function(result){
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
			
				<!--添加基础工位分类-->
			function addWorkplaceType(){
				var place_parent_name = $('#place_parent_name').val(),
					place_name  = $('#place_name').val();
				
				if($.trim(place_parent_name) == ''){
					return layer.msg('工位父类名称不能为空。',so.default),!1;
				}
				if($.trim(place_name) == ''){
					return layer.msg('工位子类名称不能为空。',so.default),!1;
				}
				
			
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/station/addWorkplaceType',{place_parent_name:place_parent_name,place_name:place_name,centerid:$('#centerid').val()},function(result){
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
				$.post("<%=basePath%>/station/editWorkplaceTypeById",{id:id},function(result){
					layer.close(load);
					if(result){
						var html =[];
						
						  html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">父类名称:</label>');
						  html.push("<select id='eplace_parent_name' name='place_parent_name' class='form-control'>");
						html.push("<option value='钣金'");
						if(result.place_parent_name =="钣金")  { html.push(" selected");
							} 
					html.push(">钣金</option>");
					html.push("<option value='喷漆'");
						if(result.place_parent_name =="喷漆")  { html.push(" selected");
							} 
					html.push(">喷漆</option>");
					html.push("<option value='机修'");
						if(result.place_parent_name =="机修")  { html.push(" selected");
							} 
					html.push(">机修</option>");
						html.push("</select>"); 
						  html.push('</div>');
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">子类名称:</label>');
						  html.push("<input type='text' class='form-control' id='eplace_name' name='place_name'  value='");
						  html.push(result.place_name);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						


						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxEditRoleForm').html(html.join('')),
						$('#editWorkplaceType').modal(),$('#selectWorkplaceTypeId').val(id),!1;
					}else{
						return layer.msg('获取基础工位分类信息失败，请重新获取。',so.default);
					}
				},'json');
			}
			<!--保存编辑基础工位分类信息-->
			function updateWorkplaceType(){
					var place_parent_name = $('#eplace_parent_name').val(),
					place_name  = $('#eplace_name').val();
				
				if($.trim(place_parent_name) == ''){
					return layer.msg('工位父类名称不能为空。',so.default),!1;
				}
				if($.trim(place_name) == ''){
					return layer.msg('工位子类名称不能为空。',so.default),!1;
				}
				
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath%>/station/updateWorkplaceType',{id:$('#selectWorkplaceTypeId').val(),place_parent_name:place_parent_name,place_name:place_name},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('编辑基础工位分类信息成功。');
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
			<a href="<%=basePath %>/station/listWorkplace">
				<i class="glyphicon glyphicon-chevron-right"></i>工位管理
			</a>
		</li>
         <li class="active">
			<a href="<%=basePath %>/station/listWorkplaceType">
				<i class="glyphicon glyphicon-chevron-right"></i>工位分类管理
			</a>
		</li>
        
   </shiro:lacksRole>     
	   
	</ul>
</div>
			<div class="col-md-10">
					<h2>工位分类管理</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入父类名称/ 子类名称">
                                        
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                              <shiro:hasPermission name="/station/addWorkplaceType"><a class="btn btn-success" onclick="$('#addWorkplaceType').modal();">添加工位类型</a></shiro:hasPermission>
				       
				         		<shiro:hasPermission name="/station/deleteWorkplaceTypeById"><button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectWorkplaceTypeId">
                       <input type="hidden" id="centerid" value="${findCenterId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>父类名称</th>
							<th>子类</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.place_parent_name}</td>
									<td>${it.place_name}</td><td>
							
										

										<shiro:hasPermission name="/station/deleteWorkplaceTypeById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission> <shiro:hasPermission name="/station/editWorkplaceTypeById"><i class="glyphicon glyphicon-edit"></i><a href="javascript:editById(${it.id});">编辑</a></shiro:hasPermission>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="4">没有找到工位分类</td>
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
			<div class="modal fade bs-example-modal-sm"  id="addWorkplaceType" tabindex="-1" role="dialog" aria-labelledby="addWorkplaceTypeLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="addWorkplaceTypeLabel">添加工位分类</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">父类名称:</label>
                         <select id="place_parent_name" name="place_parent_name" class="form-control">
                          <option value="钣金">钣金</option><option value="喷漆">喷漆</option><option value="机修">机修</option>
                         </select>
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">子类名称:</label>
			            <input type="text" class="form-control" id="place_name" name="place_name"  placeholder="请输入子类名称（轻度钣金）">
			          </div>
                      
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addWorkplaceType();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		  <%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="editWorkplaceType" tabindex="-1" role="dialog" aria-labelledby="editWorkplaceTypeLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="editWorkplaceTypeLabel">编辑工位分类</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxEditRoleForm">
			       loading....
			         
			           
			    
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="updateWorkplaceType();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
			
		</div>
			
	</body>
</html>