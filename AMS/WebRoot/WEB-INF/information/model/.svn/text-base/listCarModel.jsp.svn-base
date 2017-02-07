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
		<title>钣喷中心信息管理 —车型管理</title>
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
				var index = layer.confirm("确定这"+ ids.length +"个车型？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/carModel/deleteCarModelById',{ids:ids.join(',')},function(result){
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
			
				<!--添加车型-->
			function addCarModel(){
				var carbrand = $('#carbrand').val(),
					carmodel  = $('#carmodel').val();
					caryear =  $('#caryear').val();                   carprice = $("#carprice").val();
				if($.trim(carbrand) == ''){
					return layer.msg('车辆品牌不能为空。',so.default),!1;
				}
				if($.trim(carmodel) == ''){
					return layer.msg('车辆型号不能为空。',so.default),!1;
				}
				if($.trim(caryear) == ''){
					return layer.msg('车辆年份不能为空。',so.default),!1;
				}
				if(!/^[0-9]{4}$/.test(caryear)){
					return layer.msg('车辆年份为4位数字。',so.default),!1;
				}
					if($.trim(carprice) == ''){
					return layer.msg('车辆价格不能为空。',so.default),!1;
				}
				if(!/^[0-9]/.test(carprice)){
					return layer.msg('车辆价格必须为数字。',so.default),!1;
				}
			
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/model/addCarModel',{carbrand:carbrand,carmodel:carmodel,caryear:caryear,carprice:carprice,centerid:$('#centerid').val()},function(result){
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
				$.post("<%=basePath%>/model/editCarModelById",{id:id},function(result){
					layer.close(load);
					if(result){
						var html =[];
						  html.push('<div class="form-group">');
						  html.push('<label for="recipient-name" class="control-label">车辆品牌:</label>');
						  html.push("<input type='text' class='form-control' name='carbrand' id='ecarbrand' value='");
						  html.push(result.carbrand);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						  html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">车辆型号:</label>');
						  html.push("<input type='text' class='form-control' id='ecarmodel' name='carmodel'  value='");
						  html.push(result.carmodel);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						   html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">车辆年份:</label>');
						  html.push("<input type='text' class='form-control' id='ecaryear' name='caryear'  value='");
						  html.push(result.caryear);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');
						     html.push('<div class="form-group">');
						  html.push(' <label for="recipient-name" class="control-label">车辆价格:</label>');
						  html.push("<input type='text' class='form-control' id='ecarprice' name='carprice'  value='");
						  html.push(result.carprice);
						  html.push("'");
						  html.push("'/>");
						  html.push('</div>');


						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#boxEditRoleForm').html(html.join('')),
						$('#editCarModel').modal(),$('#selectCarModelId').val(id),!1;
					}else{
						return layer.msg('获取车型信息失败，请重新获取。',so.default);
					}
				},'json');
			}
			<!--保存编辑车型-->
			function updateCarModel(){
				var carbrand = $('#ecarbrand').val(),
					carmodel  = $('#ecarmodel').val();
					caryear =  $('#ecaryear').val();                   carprice = $("#ecarprice").val();
				if($.trim(carbrand) == ''){
					return layer.msg('车辆品牌不能为空。',so.default),!1;
				}
				if($.trim(carmodel) == ''){
					return layer.msg('车辆型号不能为空。',so.default),!1;
				}
				if($.trim(caryear) == ''){
					return layer.msg('车辆年份不能为空。',so.default),!1;
				}
				if(!/^[0-9]{4}$/.test(caryear)){
					return layer.msg('车辆年份为4位数字。',so.default),!1;
				}
					if($.trim(carprice) == ''){
					return layer.msg('车辆价格不能为空。',so.default),!1;
				}
				if(!/^[0-9]/.test(carprice)){
					return layer.msg('车辆价格必须为数字。',so.default),!1;
				}
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath%>/model/updateCarModel',{id:$('#selectCarModelId').val(),carbrand:carbrand,carmodel:carmodel,caryear:caryear,carprice:carprice},function(result){
					layer.close(load);
					if(result && result.status != 200){
						return layer.msg(result.message,so.default),!1;
					}
					layer.msg('编辑车型成功。');
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
			<a href="<%=basePath %>/model/listCarModel">
				<i class="glyphicon glyphicon-chevron-right"></i>车型管理
			</a>
		</li>
        
   </shiro:lacksRole>     
	   
	</ul>
</div>
			<div class="col-md-10">
					<h2>车型数据</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入车辆品牌/ 车辆年份/车辆型号">
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                             <shiro:hasPermission name="/model/addCarModel"> <a class="btn btn-success" onclick="$('#addCarModel').modal();">添加车型</a></shiro:hasPermission>
				       
				         		 <shiro:hasPermission name="/model/deleteCarModelById"><button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectCarModelId">
                       <input type="hidden" id="centerid" value="${findCenterId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>车辆品牌</th>
							<th>车辆型号</th>
							<th>年份</th>
							<th>车辆价格</th>
							<th>录入时间</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.carbrand}</td>
									<td>${it.carmodel}</td>
									<td>${it.caryear}</td>
									<td>${it.carprice}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${it.addtime}" /></td>
									<td>
										

										<shiro:hasPermission name="/model/deleteCarModelById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission> <shiro:hasPermission name="/model/editCarModelById"><i class="glyphicon glyphicon-edit"></i><a href="javascript:editById(${it.id});">编辑</a></shiro:hasPermission>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="7">没有找到车型数据</td>
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
			<div class="modal fade bs-example-modal-sm"  id="addCarModel" tabindex="-1" role="dialog" aria-labelledby="addCarModelLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="addCarModelLabel">添加车型</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">车辆品牌:</label>
			            <input type="text" class="form-control" name="carbrand" id="carbrand" placeholder="请输入车辆品牌"/>
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">车辆型号:</label>
			            <input type="text" class="form-control" id="carmodel" name="carmodel"  placeholder="请输入车辆型号">
			          </div>
                       <div class="form-group">
			            <label for="recipient-name" class="control-label">年份:</label>
			            <input type="text" class="form-control" id="caryear" name="caryear"  placeholder="请输入车辆年份(如2016)">
			          </div>
                        <div class="form-group">
			             <label for="recipient-name" class="control-label">车辆价格:</label>
			            <input type="text" class="form-control" id="carprice" name="carprice"  placeholder="请输入车辆价格(如160000)">
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addCarModel();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		  <%--弹框--%>
			<div class="modal fade bs-example-modal-sm"  id="editCarModel" tabindex="-1" role="dialog" aria-labelledby="editCarModelLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="editCarModelLabel">编辑车型</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxEditRoleForm">
			       loading....
			         
			           
			    
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="updateCarModel();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
			
		</div>
			
	</body>
</html>