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
		<title><shiro:hasRole name="系统管理员">系统管理 —管理用户</shiro:hasRole><shiro:lacksRole name="系统管理员">钣喷中心信息管理-系统管理</shiro:lacksRole></title>
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
				var index = layer.confirm("确定这"+ ids.length +"个用户？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/manager/deleteManagerById',{ids:ids.join(',')},function(result){
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
			/*
			*激活 | 禁止用户登录
			*/
			function forbidManagerById(status,id){
				var text = status>0?'激活':'禁止';
				var index = layer.confirm("确定"+text+"这个用户？",function(){
					var load = layer.load();
					$.post('<%=basePath %>/manager/forbidManagerById',{status:status,id:id},function(result){
						layer.close(load);
						if(result && result.status != 200){
							return layer.msg(result.message,so.default),!0;
						}else{
							layer.msg(text +'成功');
							setTimeout(function(){
								$('#formId').submit();
							},1000);
						}
					},'json');
					layer.close(index);
				});
			}
				<!--添加管理用户-->
			function addManager(){
				var username = $('#username').val(),
					trueName  = $('#trueName').val();
					password =  $('#password').val();                   re_password = $("#re_password").val();
					 centerid = $("#centerid").val();
				if($.trim(username) == ''){
					return layer.msg('登录用户名称不能为空。',so.default),!1;
				}
				if($.trim(trueName) == ''){
					return layer.msg('真实姓名不能为空。',so.default),!1;
				}
				if($.trim(password) == ''){
					return layer.msg('登录密码不能为空。',so.default),!1;
				}
				if($.trim(re_password) == ''){
					return layer.msg('确认密码不能为空。',so.default),!1;
				}
				if(password != re_password){
			    		return layer.msg('2次密码输出不一样！',so.default),!1;
			    	}
				<!--loding-->
				var load = layer.load();
				$.post('<%=basePath %>/manager/insert',{username:username,trueName:trueName,password:password,centerid:centerid},function(result){
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
     <jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<div class="row">
           <div id="one" class="col-md-2">
	<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu" style=" left:0;top: 151px; z-index: 100;">
		<shiro:hasPermission name="/role/addRole">
        <li class="active">
			<a href="<%=basePath %>/manager/list">
				<i class="glyphicon glyphicon-chevron-right"></i>管理用户列表
			</a>
		</li>
         </shiro:hasPermission>
   <shiro:lacksRole name="系统管理员">
        <li class="active">
			<a href="<%=basePath %>/manager/list">
				<i class="glyphicon glyphicon-chevron-right"></i>管理用户列表
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
           </shiro:lacksRole>  
	</ul>
</div>
			<div class="col-md-10">
					<h2>管理用户列表</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入用户名 / 真实姓名/所属中心">
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                             <a class="btn btn-success" onclick="$('#addManager').modal();">添加用户</a>
				       
				         		<button type="button" id="deleteAll" class="btn  btn-danger">删除</button>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      
						<tr>
							<th><input type="checkbox" id="checkAll"/></th>
							<th>用户名</th>
							<th>真实姓名</th>
							<th>登录状态</th>
                            <th>所属中心</th>
							<th>创建时间</th>
							<th>最后登录时间</th>
							<th>操作</th>
						</tr>
                      <c:if test="${page.list!=null && fn:length(page.list) > 0}">
					<c:forEach items="${page.list}" var="it">
								<tr>
									<td><input value="${it.id}" check='box' type="checkbox" /></td>
									<td>${it.username}</td>
									<td>${it.trueName}</td>
									<td><c:choose>
      <c:when test="${it.status==1}">
      有效
      </c:when>
      
      <c:otherwise>禁止</c:otherwise>
     
</c:choose></td><td>${it.c_name}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${it.addtime}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${it.lastLoginTime}" /></td>
									<td>
										
<c:choose>
      <c:when test="${it.status==1}">
      <i class="glyphicon glyphicon-eye-close"></i><a href="javascript:forbidManagerById('0',${it.id})">
											禁止登录
										</a>
      </c:when>
      
      <c:otherwise><i class="glyphicon glyphicon-eye-open"></i> <a href="javascript:forbidManagerById('1',${it.id})">
											激活登录
										</a></c:otherwise>
     
</c:choose>										

										<i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a> <i class="glyphicon glyphicon-edit"></i><a href="<%=basePath%>/manager/editManager?userid=${it.id}">编辑</a>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="8">没有找到用户</td>
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
			<div class="modal fade bs-example-modal-sm"  id="addManager" tabindex="-1" role="dialog" aria-labelledby="addManagerLabel">
			  <div class="modal-dialog modal-sm" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="addManagerLabel">添加管理用户</h4>
			      </div>
			      <div class="modal-body">
			        <form id="boxRoleForm">
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">用户名:</label>
			            <input type="text" class="form-control" name="username" id="username" placeholder="请输入登录用户名"/>
			          </div>
			          <div class="form-group">
			            <label for="recipient-name" class="control-label">真实姓名:</label>
			            <input type="text" class="form-control" id="trueName" name="trueName"  placeholder="请输入真实姓名">
			          </div>
                      <shiro:hasRole name="系统管理员">  <div class="form-group">
			            <label for="recipient-name" class="control-label">选择所属中心:</label>
			            <select id="centerid" name="centerid" class="form-control">
      <option value="">请选择...</option>             
 
                                        <c:forEach items="${centerList}" var="it">
         <option value="${it.id}">${it.c_name}</option>
                             </c:forEach>                                       </select>
			          </div>
                      
                      </shiro:hasRole>
                      <shiro:lacksRole name="系统管理员"> 
                      <input type="hidden" name="centerid" id="centerid" value="${findCenterId}">
                       </shiro:lacksRole>
                       <div class="form-group">
			            <label for="recipient-name" class="control-label">登录密码:</label>
			            <input type="password" class="form-control" id="password" name="password"  placeholder="请输入登录密码">
			          </div>
                        <div class="form-group">
			            <label for="recipient-name" class="control-label">确认密码:</label>
			            <input type="password" class="form-control" id="re_password" name="re_password"  placeholder="请输入确认密码">
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			        <button type="button" onclick="addManager();" class="btn btn-primary">保存</button>
			      </div>
			    </div>
			  </div>
			</div>
			<%----/弹框--%>
		
			
		</div>
			
	</body>
</html>