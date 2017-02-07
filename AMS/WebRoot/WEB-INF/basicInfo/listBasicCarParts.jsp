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
		<title>系统管理 —数据字典-基础配件管理</title>
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
			
		
		</script>
	</head>
	<body data-target="#one" data-spy="scroll">
     <jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
		<div class="container" style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
			<div class="row">
            <div id="one" class="col-md-2">
	<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu" style=" left:0;top: 151px; z-index: 100;">
		<li>
			<a href="<%=basePath %>/carModel/list">
				<i class="glyphicon glyphicon-chevron-right"></i>基础车型数据列表
			</a>
		</li>
        <li class="active">	    
	    	<a href="<%=basePath%>/carParts/list"><i class="glyphicon glyphicon-chevron-right"></i>基础配件数据列表</a>   
	    </li>
         <li>	    
	    	<a href="<%=basePath%>/workplaceType/list"><i class="glyphicon glyphicon-chevron-right"></i>基础工位类型数据列表</a>   
	    </li>
         <li>	    
	    	<a href="<%=basePath%>/workingHours/list"><i class="glyphicon glyphicon-chevron-right"></i>基础标准工时数据列表</a>   
	    </li>
      
	</ul>
</div>
			<div class="col-md-10">
					<h2>基础配件数据</h2>
					<hr>
				<form method="post" action="" id="formId" class="form-inline">
						<div clss="well">
					      <div class="form-group">
					        <input type="text" class="form-control" style="width: 300px;" value="${findContent}" 
					        			name="findContent" id="findContent" placeholder="输入配件名称/ 配件编号/原厂编号/适用车型">
					      </div>
					     <span class=""> 
				         	<button type="submit" class="btn btn-primary">查询</button>
                             <a class="btn btn-success" href="<%=basePath%>/carParts/toAddCarParts">添加基础配件</a>
				       
				         		<button type="button" id="deleteAll" class="btn  btn-danger">删除</button>
				       
                            
				         </span>    
				        </div>
					<hr>
					<table class="table table-striped table-bordered">
                      <input type="hidden" id="selectCarPartsId">
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
									<td>${it.remarks}</td>		<td>
										

										<i class="glyphicon glyphicon-remove"></i><a href="javascript:_delete([${it.id}]);">删除</a> <i class="glyphicon glyphicon-edit"></i><a href="<%=basePath%>/carParts/editCarPartsById?id=${it.id}">编辑</a>
										
									</td>
								</tr>
							</c:forEach>
                            </c:if>
                        <c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="12">没有找到基础配件</td>
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
				
		</div>
			
	</body>
</html>