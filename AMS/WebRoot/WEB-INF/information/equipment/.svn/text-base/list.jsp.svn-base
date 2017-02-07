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
		<title>钣喷中心信息管理 —展示器设备管理</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个展示设备吗？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/equipment/deleteViewEquipmentById',{ids:ids.join(',')},function(result){
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
	
			<!--添加权限-->
			function addViewEquipment(){
				var view_name = $('#view_name').val(),
					view_equipment_id  = $('#view_equipment_id').val();
					
				if($.trim(view_name) == ''){
					return layer.msg('展示设备名称不能为空。',so.default),!1;
				}
				if($.trim(view_equipment_id) == ''){
					return layer.msg('展示设备序列号不能为空。',so.default),!1;
				}
				
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/equipment/addViewEquipment',{view_name:view_name,view_equipment_id:view_equipment_id,centerid:$('#centerid').val()},function(result){
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
				$.post("<%=basePath%>/equipment/editViewEquipmentById",{id:id},function(result){
					layer.close(load);
					if(result){
						var html =[];
						  html.push('<div class="form-group">');
						  html.push('<label for="recipient-name" class="control-label">设备名称:</label>');
						  html.push("<input type='text' class='form-control' name='view_name' id='eview_name' value='");
						  html.push(result.view_name);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						  html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">设备序列号:</label>');
						  html.push("<input type='text' class='form-control' id='eview_equipment_id' name='view_equipment_id'  value='");
						  html.push(result.view_equipment_id);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						

						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxEditRoleForm').html(html.join('')),
						$('#editViewEquipment').modal(),$('#selectViewEquipmentId').val(id),!1;
					}else{
						return layer.msg('获取展示设备信息失败，请重新获取。',so.default);
					}
				},'json');
			}
			<!--保存编辑权限-->
			function updateViewEquipment(){
				var view_name = $('#eview_name').val(),
					view_equipment_id  = $('#eview_equipment_id').val();
					if($.trim(view_name) == ''){
					return layer.msg('展示设备名称不能为空。',so.default),!1;
				}
				if($.trim(view_equipment_id) == ''){
					return layer.msg('展示设备序列号不能为空。',so.default),!1;
				}
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath%>/equipment/updateViewEquipment',{id:$('#selectViewEquipmentId').val(),view_name:view_name,view_equipment_id:view_equipment_id},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('编辑展示设备成功。');
					setTimeout(function(){
						$('#formId').submit();
					},1000);
				},'json');
			}
			/*
			*根据设备分配工位操作。
			*/
			function selectViewWplaceById(id){
				var load = layer.load();
				$.post("<%=basePath%>/equipment/selectViewWplaceById",{id:id,centerid:$('#centerid').val()},function(result){
					layer.close(load);
					if(result && result.length){
						var html =[];
						html.push('<div class="checkbox"><label><input type="checkbox"  selectAllBox="">全选</label></div>');
						$.each(result,function(){
							html.push("<div class='checkbox'><label>");
							html.push("<input type='checkbox' selectBox='' id='");
							html.push(this.id);
							html.push("'");
							if(this.check){
								html.push(" checked='checked'");
							}
							html.push("name='");
							html.push(this.w_name);
							html.push("'/>");
							html.push(this.w_name);
							html.push('</label></div>');
						});
						//初始化全选。
						return so.id('boxChickRoleForm').html(html.join('')),
						so.checkBoxInit('[selectAllBox]','[selectBox]'),
						$('#selectViewWplace').modal(),$('#selectViewEquipmentId').val(id),!1;
					}else{
						return layer.msg('没有获取到工位数据，请先添加工位数据。',so.default);
					}
				},'json');
			}
			<!--选择工位后保存-->
			function selectViewWplace(){
				var checked = $("#boxChickRoleForm  :checked");
				var ids=[],names=[];
				$.each(checked,function(){
					ids.push(this.id);
					names.push($.trim($(this).attr('name')));
				});
				var index = layer.confirm("确定操作？",function(){
					<!--loding-->
					var load = layer.load();
					$.post('<%=basePath%>/equipment/addViewWplace',{ids:ids.join(','),viewId:$('#selectViewEquipmentId').val()},function(result){
						layer.close(load);
						if(result && result.status != 200){
							return layer.msg(result.message,so.default),!1;
						}
						layer.msg('绑定成功。');
						setTimeout(function(){
							$('#formId').submit();
						},1000);
					},'json');
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
			<a href="<%=basePath %>/equipment/listViewEquipment">
				<i class="glyphicon glyphicon-chevron-right"></i>展示设备管理
			</a>
		</li>
        
   </shiro:lacksRole>     
	   
	</ul>
</div>
			<div class="col-md-10">
					<h2>展示设备列表</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="设备名称 / 设备序列号">
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                          <shiro:hasPermission name="/equipment/addViewEquipment"><a class="btn btn-success" onclick="$('#addViewEquipment').modal();">增加设备</a></shiro:hasPermission>
				         
				         		<shiro:hasPermission name="/equipment/deleteViewEquipmentById"><button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                    <input type="hidden" id="selectViewEquipmentId">
                     <input type="hidden" id="centerid" value="${findCenterId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>设备名称</th>
							<th>设备序列号</th>
                            <th>绑定工位信息</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.view_name}</td>
									
                                    <td>${it.view_equipment_id}</td>
                                    <td>${it.stationNames}</td>
								
									<td>
										

										<shiro:hasPermission name="/equipment/deleteViewEquipmentById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:deleteById([${it.id}]);">删除</a></shiro:hasPermission> <shiro:hasPermission name="/equipment/editViewEquipmentById"><i class="glyphicon glyphicon-edit"></i><a href="javascript:editById(${it.id});">编辑</a></shiro:hasPermission><shiro:hasPermission name="/equipment/selectViewWplaceById"><i class="glyphicon glyphicon-share-alt"></i><a href="javascript:selectViewWplaceById(${it.id});">选择工位</a></shiro:hasPermission>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="5">没有找到展示设备</td>
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
			<div class="modal fade bs-example-modal-sm"  id="addViewEquipment" tabindex="-1" role="dialog" aria-labelledby="addViewEquipmentLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="addViewEquipmentLabel">添加展示设备</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">设备名称:</label>
			            <input type="text" class="form-control" name="view_name" id="view_name" placeholder="请输入展示设备名称"/>
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">设备序列号:</label>
			            <input type="text" class="form-control" id="view_equipment_id" name="view_equipment_id"  placeholder="请输入设备序列号">
			          </div>
                      
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addViewEquipment();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		  <%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="editViewEquipment" tabindex="-1" role="dialog" aria-labelledby="editViewEquipmentLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="editViewEquipmentLabel">编辑展示设备</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxEditRoleForm">
			       loading....
			         
			           
			    
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="updateViewEquipment();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
            <%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="selectViewWplace" tabindex="-1" role="dialog" aria-labelledby="selectViewWplaceLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="selectViewWplaceLabel">绑定工位</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxChickRoleForm">
			          loading...
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="selectViewWplace();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
				<%----/弹框--%>
			<%----/弹框--%>
			
		</div>
			
	</body>
</html>