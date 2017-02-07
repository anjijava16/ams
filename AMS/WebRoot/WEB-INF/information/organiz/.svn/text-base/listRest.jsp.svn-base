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
		<title>钣喷中心信息管理 —组织机构-员工管理-休班管理</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<link href="<%=basePath%>/js/common/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<%=basePath %>/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
       
     <link href="<%=basePath%>/css/common/base.css" rel="stylesheet"/>
       <link href="<%=basePath%>/assets/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
      	<script  src="<%=basePath%>/vendors/jquery1.8.3.min.js"></script>
     	<script  src="<%=basePath%>/js/common/layer/layer.js"></script>
		<script  src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script  src="<%=basePath%>/js/shiro.demo.js"></script>
          <script src="<%=basePath%>/vendors/jquery.form-2.82.js"></script>
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
				var index = layer.confirm("确定这"+ ids.length +"个休班信息？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/organiz/deleteRestById',{ids:ids.join(',')},function(result){
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
			function toRestById(){
				var load = layer.load();
				$.post("<%=basePath%>/organiz/toRestById",{id:$('#e_id').val(),centerid:$('#centerid').val()},function(result){
					layer.close(load);
					if(result){
						var html =[];
				
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
						

						//return so.id('boxRoleForm').html(html.join('')),
					     return $('#addTime').html(html.join('')),
						$('#addRest').modal(),!1;
					}else{
						return layer.msg('获取员工信息进行休班设置失败，请重新获取',so.default);
					}
				},'json');
			}
			
			<!--添加休班信息信息-->
			function addRest(){
				var id_name = $('#id_name').val(),
					e_start_time  = $('#e_start_time').val(),
					e_end_time= $('#e_end_time').val();
				
				if($.trim(id_name) == ''){
					return layer.msg('员工信息不能为空。',so.default),!1;
				}
				if($.trim(e_start_time) == ''){
					return layer.msg('开始时间不能为空。',so.default),!1;
				}
				if($.trim(e_end_time) == ''){
					return layer.msg('结束时间不能为空。',so.default),!1;
				}
				//拆分
				var e_id=id_name.split("+")[0];
				var e_name=id_name.split("+")[1];
			
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/organiz/addRest',{e_id:e_id,e_name:e_name,e_start_time:e_start_time,e_end_time:e_end_time,centerid:$('#centerid').val()},function(result){
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
         <li class="active">
			<a href="<%=basePath %>/organiz/listRest">
				<i class="glyphicon glyphicon-chevron-right"></i>员工休班管理
			</a>
		</li>
   </shiro:lacksRole>     
	   
	</ul>
</div>
			<div class="col-md-10">
					<h2>休班管理</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入员工姓名">
                                        
					      </div>
                          
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                              <shiro:hasPermission name="/organiz/toRestById"><a class="btn btn-success" href="javascript:toRestById();">添加休班记录</a></shiro:hasPermission> <shiro:hasPermission name="/organiz/deleteRestById">
				       
				         		<button type="button" id="deleteAll" class="btn  btn-danger">删除</button></shiro:hasPermission>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectRestId">
                       <input type="hidden" id="centerid" value="${findCenterId}">
                        <input type="hidden" id="e_id" value="${findEmployeeId}">
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>员工姓名</th>
							<th>休班开始时间</th>
                            <th>休班结束时间</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.e_name}</td>
									<td>${it.e_start_time}</td>
                                    <td>${it.e_end_time}</td>
                                <td>
							
										

										<shiro:hasPermission name="/organiz/deleteRestById"><i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a></shiro:hasPermission>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="5">没有找到休班信息</td>
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
		<div class="modal fade bs-example-modal-sm" id="addRest"
		tabindex="-1" role="dialog" aria-labelledby="addItemLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addStationsLabel">添加休班信息</h4>
				</div>
				<div class="modal-header">
			        <form id="boxRoleForm" class="form-horizontal">
                  <div class="form-group" id="addTime">
                     loading....
                    </div>
			      <div class="form-group"><label for="e_start_time" class="col-sm-2 control-label">开始时间:</label><div class="col-sm-5"><div class="input-group date" data-date="" data-date-format="yyyy MM dd" data-link-field="e_start_time" data-link-format="yyyy-mm-dd" id="start_time"><input class="form-control" size="16" type="text" value="" readonly><span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span></div><input type="hidden" id="e_start_time" value=""  name="e_start_time"/><br/></div></div>
                      <div class="form-group"><label for="e_end_time" class="col-sm-2 control-label">结束时间:</label><div class="col-sm-5"><div class="input-group date" data-date="" data-date-format="yyyy MM dd" data-link-field="e_end_time" data-link-format="yyyy-mm-dd" id="end_time"><input class="form-control" size="16" type="text" value="" readonly><span 
class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span><span class="input-group-addon"><span 
class="glyphicon glyphicon-calendar"></span></span></div><input type="hidden" id="e_end_time" value=""  name="e_end_time"/><br/></div>	</div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addRest();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		
			
		</div>
			
	</body>
</html>
<script src="<%=basePath%>/assets/bootstrap-datetimepicker.js"></script>
 <script src="<%=basePath%>/assets/bootstrap-datetimepicker.fr.js"></script>
     <script src="<%=basePath%>/assets/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">  
	
	$('#start_time').datetimepicker({
        weekStart: 1,
        todayBtn:  false,
		autoclose: true,
		todayHighlight: 1,
		startView: 3,
		minView: 2,
		forceParse: true,
	    format:'yyyy-mm-dd',
	    language: 'zh-CN'
    });
$('#end_time').datetimepicker({
        weekStart: 1,
        todayBtn:  false,
		autoclose: true,
		todayHighlight: 1,
		startView: 3,
		minView: 2,
		forceParse: true,
	    format:'yyyy-mm-dd',
	    language: 'zh-CN'
    });
	

	
</script>