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
		<title>钣喷中心信息管理 —工位管理-绑定人员列表</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个工位绑定员工信息？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/station/deleteEwplaceById',{ids:ids.join(',')},function(result){
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
			
		  /**
			*获取信息用于设置
			*/
			function toEwplaceById(){
				var load = layer.load();
				$.post("<%=basePath%>/station/toEwplaceById",{id:$('#w_id').val(),centerid:$('#centerid').val()},function(result){
					layer.close(load);
					if(result){
						var html =[];
				html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="col-sm-2 control-label">工位信息:</label>');
						  html.push('<div class="col-sm-5">');
						    html.push("<select id='wid_name' name='wid_name' class='form-control'>");                          	$.each(result.slist,function(){ 
							html.push("<option value='");	
							html.push(this.id+"+"+this.w_name);
							html.push("'>");
							html.push(this.w_name)
							html.push("</option>");
							   });
							
							html.push("</select>");
							html.push('</div>');
							html.push('</div>');
							html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="col-sm-2 control-label">员工信息:</label>');
						  html.push('<div class="col-sm-5">');
						    html.push("<select id='id_name' name='id_name' class='form-control'>");                          	$.each(result.emlist,function(){ 
							html.push("<option value='");	
							html.push(this.id+"+"+this.e_name);
							html.push("'>");
							html.push(this.e_name)
							html.push("</option>");
							   });
							
							html.push("</select>");
							html.push('</div>');
							html.push('</div>');
						

						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxRoleForm').html(html.join('')),
						$('#addEwplace').modal(),!1;
					}else{
						return layer.msg('获取员工信息进行休班设置失败，请重新获取',so.default);
					}
				},'json');
			}
			
			<!--添加工位绑定信息信息-->
			function addEwplace(){
				var id_name = $('#id_name').val(),
				
					wid_name = $('#wid_name').val();
				
				if($.trim(id_name) == ''){
					return layer.msg('员工信息不能为空。',so.default),!1;
				}
				if($.trim(wid_name) == ''){
					return layer.msg('工位信息不能为空。',so.default),!1;
				}
				
				//拆分
				var e_id=id_name.split("+")[0];
				var e_name=id_name.split("+")[1];
				var w_id=wid_name.split("+")[0];
				var w_name=wid_name.split("+")[1];
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/station/addEwplace',{e_id:e_id,e_name:e_name,w_id:w_id,w_name:w_name,centerid:$('#centerid').val()},function(result){
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
					<h2>工位绑定人员列表</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入员工姓名/工位名称">
                                        
					      </div>
                          
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                             <shiro:hasPermission name="/station/toEwplaceById"> <a class="btn btn-success" href="javascript:toEwplaceById();">绑定人员</a></shiro:hasPermission>
				       
				         	 <shiro:hasPermission name="/station/deleteEwplaceById">	<button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectRestId">
                       <input type="hidden" id="centerid" value="${findCenterId}">
                        <input type="hidden" id="w_id" value="${findStationId}">
                        <input type="hidden" id="w_name" value="${w_name}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>员工姓名</th>
							<th>工位名称</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.e_name}</td>
									<td>${it.w_name}</td>
                                   
                                <td>
							
										

										 <shiro:hasPermission name="/station/deleteEwplaceById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="4">没有找到工位绑定人员信息</td>
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
		<div class="modal fade bs-example-modal-sm" id="addEwplace"
		tabindex="-1" role="dialog" aria-labelledby="addItemLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addStationsLabel">绑定员工</h4>
				</div>
				<div class="modal-header">
			        <form id="boxRoleForm" class="form-horizontal">
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addEwplace();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		
			
		</div>
			
	</body>
</html>
