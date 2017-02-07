<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<div id="one" class="col-md-2">
	<ul data-spy="affix" class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu" style=" left:0;top: 151px; z-index: 100;">
		<li>
			<a href="<%=basePath %>/manager/list">
				<i class="glyphicon glyphicon-chevron-right"></i>管理用户
			</a>
		</li>
        <li class="active">	    
	    	<a href="<%=basePath%>/role/list"><i class="glyphicon glyphicon-chevron-right"></i>权限管理	</a>   
           	<ul class="dropdown-menu" aria-labelledby="dLabel">
            	<li><a href="<%=basePath%>/role/list">- 角色列表</a></li>
            	<li><a href="<%=basePath%>/role/allocation">- 角色分配</a></li>
            	<li><a href="<%=basePath%>/permission/list">- 权限列表</a></li>
            	<li><a href="<%=basePath%>/permission/allocation">- 权限分配</a></li>
            </ul>
	    </li>
        <li>	    
			<a href="<%=basePath%>/carModel/list"><i class="glyphicon glyphicon-chevron-right"></i>数据字典	</a>   
            <ul class="dropdown-menu" aria-labelledby="dLabel">
            	<li><a href="<%=basePath%>/carModel/list">- 基础车型</a></li>
            	<li><a href="<%=basePath%>/carParts/list">- 基础配件</a></li>
            	<li><a href="<%=basePath%>/workingHours/list">- 基础标准工时</a></li>
           		<li><a href="<%=basePath%>/workplaceType/list">- 基础工位类型</a></li>  
          </ul>
	    </li>
        <li>	    
	    	 <a href="<%=basePath%>/centerInfo/list"><i class="glyphicon glyphicon-chevron-right"></i>开设钣喷中心</a>   
             <ul class="dropdown-menu" aria-labelledby="dLabel">
             	<li><a href="<%=basePath%>/centerInfo/list">- 已开中心</a></li>
            	 <li><a href="<%=basePath%>/centerInfo/toAddCenterInfo">- 开设新钣喷中心</a></li>
             </ul>
	    </li>
	</ul>
</div>