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
		<title>钣喷中心信息管理 —配件管理</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个配件？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/carParts/deleteCarPartsById',{ids:ids.join(',')},function(result){
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
				/*根据权限ID获取信息用于编辑。
			*/
			function outCarPartsById(id){
					var load = layer.load();
				$.post("<%=basePath%>/parts/outCarPartsById",{id:id},function(result){
					layer.close(load);
					if(result){
				var html =[];
						
						
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">现有库存数:</label>');
						  html.push("<input type='text' class='form-control' id='ostocknum' name='ostocknum'  value='");
						  html.push(result.stocknum);
						  html.push("'");
						  html.push("' readonly/>");
						  html.push('</div>');
						  
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">出库数:</label>');
						  html.push("<input type='text' class='form-control' id='stocknum' name='stocknum' ");
						  html.push("'/>");
						  html.push('</div>');


						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxEditRoleForm').html(html.join('')),
					$('#outCarParts').modal(),$('#selectCarPartsId').val(id),!1;
					}else{
						return layer.msg('获取库存信息失败，请重新获取。',so.default);
					}
				},'json');
			}
			<!--出库信息-->
			function outCarParts(){
					var stocknum  = $('#stocknum').val(),
					ostocknum  = $('#ostocknum').val();
				if(!/^\d+$/.test(stocknum)){
					return layer.msg('出库数量必须为数字',so.default),!1;
				}
				if(eval($.trim(stocknum))>eval($.trim(ostocknum))){
				return layer.msg('出库数量不能超过库存数量。',so.default),!1;	}
				
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath%>/parts/outCarParts',{id:$('#selectCarPartsId').val(),stocknum:stocknum},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('出库成功。');
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
			<a href="<%=basePath %>/parts/listParts">
				<i class="glyphicon glyphicon-chevron-right"></i>配件管理
			</a>
		</li>
        
   </shiro:lacksRole>     
	   
	</ul>
</div>
			<div class="col-md-10">
					<h2>配件数据</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入配件名称/ 配件编号/原厂编号/适用车型">
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                            <shiro:lacksRole name="系统管理员"> <shiro:hasPermission name="/parts/toAddCarParts"> <a class="btn btn-success" href="<%=basePath%>/parts/toAddCarParts">添加配件</a></shiro:hasPermission></shiro:lacksRole><shiro:hasRole name="系统管理员"> <shiro:hasPermission name="/parts/toAddCarParts"><a class="btn btn-success" href="<%=basePath%>/parts/toAddCarParts?centerid=${centerid}">添加配件</a></shiro:hasPermission></shiro:hasRole>
                             
				       
				         		 <shiro:hasPermission name="/parts/deleteCarPartsById"><button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectCarPartsId">  <input type="hidden" id="centerid" value="${findCenterId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>损伤部件分组</th>
							<th>损伤部位</th>
							<th>损伤部件</th>
							<th>配件名称</th>
							<th>配件编号</th>
                            <th>原厂编号</th>
							<th>适用车型</th>
							<th>配件价格</th>
							<th>配件类别</th>
                            <th>库存数量</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.damage_parts_group}</td>
									<td>${it.damage_position}</td>
									<td>${it.damage_parts}</td>
									<td>${it.partsname}</td>
									<td>${it.partsnumber}</td>
								<td>${it.firmsnumber}</td>
									<td>${it.applymodel}</td>
									<td>${it.partsprice}</td>
									<td>${it.partstype}</td>
                                    <td>${it.stocknum}</td>
									<td>${it.remarks}</td>		<td>
										

										<shiro:hasPermission name="/parts/deleteCarPartsById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission><shiro:hasPermission name="/parts/editCarPartsById"> <i class="glyphicon glyphicon-edit"></i><a href="<%=basePath%>/parts/editCarPartsById?id=${it.id}">编辑</a></shiro:hasPermission><shiro:hasPermission name="/parts/inCarPartsById"><i class="glyphicon glyphicon-plus"></i><a href="<%=basePath%>/parts/inCarPartsById?id=${it.id}">配件入库</a></shiro:hasPermission>
                                       <shiro:hasPermission name="/parts/outCarPartsById"> <i class="glyphicon glyphicon-minus"></i><a href="javascript:outCarPartsById(${it.id});">配件出库</a></shiro:hasPermission>
                                       <shiro:hasPermission name="/parts/listPartsRecord"> <i class="glyphicon glyphicon-list-alt"></i> <shiro:lacksRole name="系统管理员"><a href="<%=basePath%>/parts/listPartsRecord?findPartId=${it.id}">出入库明细</a></shiro:lacksRole><shiro:hasRole name="系统管理员"><a href="<%=basePath%>/parts/listPartsRecord?centerid=${it.centerid}&findPartId=${it.id}">出入库明细</a></shiro:hasRole></shiro:hasPermission>
                                        
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="13">没有找到配件</td>
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
			<div class="modal fade bs-example-modal-sm"  id="outCarParts" tabindex="-1" role="dialog" aria-labelledby="outCarPartsLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="outCarPartsLabel">配件出库</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxEditRoleForm">
			         
			         loading....
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    
			        <button type="button" onclick="outCarParts();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>	
		</div>
			
	</body>
</html>