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
		<title>钣喷中心信息管理 —组织机构-员工添加</title>
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

 
		<script>
		$(function(){
				var load;
				$("#formId").ajaxForm({
			    	success:function (result){
			    		layer.close(load);
			    		if(result && result.status == 300){
			    			layer.msg(result.message,function(){});
			    			return !1;
			    		}
			    		if(result && result.status == 500){
			    			layer.msg("操作失败！",function(){});
			    			return !1;
			    		}
			    		layer.msg('操作成功！');
			    	},
			    	beforeSubmit:function(){
			    		//判断参数
			    		if($.trim($("#e_name").val()) == ''){
				    		layer.msg('请填写员工姓名',function(){});
				    		$("#e_name").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#e_name").parent().removeClass('has-error').addClass('has-success');
			    		}
						//判断参数
			    		if($.trim($("#d_id").val()) == ''){
				    		layer.msg('请选择所属部门',function(){});
				    		$("#d_id").parent().removeClass('has-success').addClass('has-error');
				    		return !1;
			    		}else{
			    			$("#d_id").parent().removeClass('has-error').addClass('has-success');
			    		}
					
						
			    		
			    		load = layer.load('正在提交！！！');
			    	},
			    	dataType:"json",
			    	clearForm:true
				});
			
		});
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
         <li class="active">
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
					<h2>员工添加</h2>
					<hr>
				<form id="formId" enctype="multipart/form-data" action="<%=basePath%>/organiz/addEmployee" method="post" class="form-horizontal">                       
                       <div class="form-group">
<label for="e_name" class="col-sm-2 control-label">员工姓名</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="e_name" id="e_name" placeholder="请输入员工姓名"/></div>
</div>
 <div class="form-group">
						  <label for="e_id_type" class="col-sm-2 control-label">证件类型</label><div class="col-sm-5">
                                        
                                            <select id="e_id_type" name="e_id_type" class="form-control">
      <option value="">请选择...</option>
 <option value="1">身份证</option>
  <option value="2">驾驶证</option>
   <option value="3">军官证</option>
    <option value="4">护照</option>                                                                </select></div>
</div>
    <div class="form-group">
						    <label for="e_id_num" class="col-sm-2 control-label">证件号码</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="e_id_num" id="e_id_num" placeholder="请输入证件号码"/></div></div>
                         	<div class="form-group">
							<label class="col-sm-2 control-label" for="e_birth">出生日期</label>
						  <div class="input-group date col-sm-5" data-date="" data-date-format="yyyy MM dd" data-link-field="e_birth" data-link-format="yyyy-mm-dd" id="form_date">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="e_birth" value=""  name="e_birth"/><br/>
            </div>
				 <div class="form-group">
						  <label for="e_sex" class="col-sm-2 control-label">性别</label><div class="col-sm-5">
                                        
                                            <select id="e_sex" name="e_sex" class="form-control">
      <option value="">请选择...</option>
 <option value="1">男</option>
  <option value="2">女</option>
                                                                  </select></div>
</div>
 <div class="form-group">
						  <label for="e_marry" class="col-sm-2 control-label">婚否</label><div class="col-sm-5">
                                        
                                            <select id="e_marry" name="e_marry" class="form-control">
      <option value="">请选择...</option>
 <option value="1">未婚</option>
  <option value="2">已婚</option>
                                                                  </select></div>
</div>
<div class="form-group">
<label for="e_tel" class="col-sm-2 control-label">电话</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="e_tel" id="e_tel" placeholder="请输入电话"/></div>
</div>
 <div class="form-group">
						  <label for="e_educate" class="col-sm-2 control-label">学历</label><div class="col-sm-5">
                                <input type="text" class="form-control" name="e_educate" id="e_educate" placeholder="请输入学历"/></div>
</div>
 <div class="form-group">
						  <label for="e_political" class="col-sm-2 control-label">政治面貌</label><div class="col-sm-5">
                                        
                                            <select id="e_political" name="e_political" class="form-control">
      <option value="">请选择...</option>
 <option value="1">群众</option>
  <option value="2">团员</option>
   <option value="3">党员</option>
                                                                  </select></div>
</div>
<div class="form-group">
							<label class="col-sm-2 control-label" for="e_entry_time">入职时间</label>
						  <div class="input-group date col-sm-5" data-date="" data-date-format="yyyy MM dd" data-link-field="e_entry_time" data-link-format="yyyy-mm-dd" id="entry_time">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="e_entry_time" value=""  name="e_entry_time"/><br/>
            </div>
            <div class="form-group">
							<label class="col-sm-2 control-label" for="e_leave_time">离职时间</label>
						  <div class="input-group date col-sm-5" data-date="" data-date-format="yyyy MM dd" data-link-field="e_leave_time" data-link-format="yyyy-mm-dd" id="leave_time">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="e_leave_time" value=""  name="e_leave_time"/><br/>
            </div>
             <div class="form-group">
						  <label for="d_id" class="col-sm-2 control-label">选择部门</label><div class="col-sm-5">
                                        
                                            <select id="d_id" name="d_id" class="form-control">
      <option value="">请选择...</option>             
 
                                        <c:forEach items="${listDepartment }" var="it">
         <option value="${it.id}">${it.d_name}</option>
                             </c:forEach>                                       </select></div>
</div>
 <div class="form-group">
						  <label for="s_id" class="col-sm-2 control-label">选择职务</label><div class="col-sm-5">
                                        
                                            <select id="s_id" name="s_id" class="form-control">
      <option value="">请选择...</option>             
 
                                        <c:forEach items="${listStations }" var="it">
         <option value="${it.id}">${it.s_name}</option>
                             </c:forEach>                                       </select></div>
</div>
<div class="form-group">
						  <label for="p_id" class="col-sm-2 control-label">选择工种</label><div class="col-sm-5">
                                        
                                            <select id="p_id" name="p_id" class="form-control">
      <option value="">请选择...</option>             
 
                                        <c:forEach items="${listProfession }" var="it">
         <option value="${it.id}">${it.p_name}</option>
                             </c:forEach>                                       </select></div>
</div>
<div class="form-group">
<label for="seq" class="col-sm-2 control-label">排序</label>
						 <div class="col-sm-5"> <input type="text" class="form-control" name="seq" id="seq" placeholder="请输入排序"/></div>
</div>
  <div class="form-group">
						   <label for="e_remarks" class="col-sm-2 control-label">备注</label><div class="col-sm-5">
						 <textarea name="e_remarks"   id="e_remarks" class="form-control"></textarea>
						</div>
                          </div>
	    <div class="form-actions">
							  <button type="submit" class="btn btn-large btn-block btn-primary">保存</button> 
                              
                              
                             
						  </div>
                         <input type="hidden" name="centerid" value="${centerid}">
						</form>
				</div>
			</div>
			
		</div>
			
	</body>
</html>
 <script src="<%=basePath%>/assets/bootstrap-datetimepicker.js"></script>
 <script src="<%=basePath%>/assets/bootstrap-datetimepicker.fr.js"></script>
     <script src="<%=basePath%>/assets/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">  
	$('#form_date').datetimepicker({
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
	$('#entry_time').datetimepicker({
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
	$('#leave_time').datetimepicker({
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