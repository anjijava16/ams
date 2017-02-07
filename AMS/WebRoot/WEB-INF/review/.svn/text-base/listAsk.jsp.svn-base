<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<title>系统管理 —回访管理</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<link
	href="<%=basePath%>/js/common/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">

<link href="<%=basePath%>/css/common/base.css" rel="stylesheet" />
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="<%=basePath%>/vendors/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/common/layer/layer.js"></script>
<script src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/shiro.demo.js"></script>
</head>
<body data-target="#one" data-spy="scroll">
	<jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
	<div class="container"
		style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
		<div class="row">
		<jsp:include page="../customer/menu.jsp" flush="true"></jsp:include>
			<div class="col-md-10">
				<h2>回访模版管理</h2>
				<hr>
				<form method="post" action="/AMS/review/listAsk" id="formId" class="form-inline">
					<div clss="well">
						<div class="form-group">
							<input type="text" class="form-control" style="width: 300px;"
								value="${findContent}" name="findContent" id="findContent"
								placeholder="输入模板名 ">
						</div>
						<span class="">
							<button type="submit" class="btn btn-primary">查询</button>
						</span>
					</div>
					<hr>
					<table class="table table-striped table-bordered">
						<tr>
							<th>模板编号</th>
							<th>模板名</th>
							<th>操作</th>
						</tr>
						<c:if test="${page.list!=null && fn:length(page.list) > 0}">
							<c:forEach items="${page.list}" var="it">
								<tr>
									<td>${it.id}</td>
									<td>${it.ask_name}</td>
									<td>
									<a href="javascript:editReview('${it.id}','${it.ask_name}')">编辑</a>
									<a href="javascript:deleteReview([${it.id}]);">删除</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${page.list==null || fn:length(page.list) < 1}">
							<tr>
								<td class="text-center danger" colspan="3">没有找到回访模板信息</td>
							</tr>
						</c:if>
					</table>
					<c:if test="${page.list!=null && fn:length(page.list) > 0}">
						<div class="pagination pull-right">${page.pageHtml}</div>
					</c:if>
				</form>
			</div>
		</div>
	</div>
	<%--Add弹框--%>
	<div class="modal fade bs-example-modal-sm" id="addAsk"
		tabindex="-1" role="dialog" aria-labelledby="addItemLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="addStationsLabel">编辑回访模板</h4>
				</div>
				<div class="modal-header">
				<form id="askFm">
					<div class="form-group">
						<label class="control-label">模板名称</label>
						<div>
							<input type="text" id="ask_name" name="ask_name" class="form-control" placeholder="请填写模板名称" /> 
							<input type="hidden" id="ask_id" name="id" class="form-control"/> 
						</div>
					</div>
					</form>
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="addAsk();" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	<%----/弹框--%>
	<script>
        function deleteReview(id){
			var index = layer.confirm("确定要删除这个模板？这将删除其所属的所有问题！",function(){
			var load = layer.load();
			location.href="<%=basePath %>/review/deleteAsk?id="+id;
			});
        }
        
        function editReview(id, name){
        	$('#addAsk').modal();
        	$('#ask_name').val(name);
        	$('#ask_id').val(id);
        }
        
        //插入工单项目
		function addAsk(){
			var load = layer.load();
			$.ajax({  
			   type: "POST",  
			   url: "/AMS/review/insertAsk",  
			   data: $("#askFm").serializeArray(),  
			   dataType: 'json',  
			   success: function(rst){
				   layer.close(load);
				   if(rst.status == 200){
					   location.reload();
				   } else {
						layer.msg(rst.message);
					}
			   }  
			});
		}
        </script>
</body>
</html>