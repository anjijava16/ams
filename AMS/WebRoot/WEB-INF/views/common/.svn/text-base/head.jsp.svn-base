<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<script>
function logout(){
	var load = layer.load();
	$.getJSON("<%=basePath%>/u/logout",{},function(result){
		layer.close(load);
		if(result && result.status == 200){
			$(".qqlogin").html('').next('ul').remove();
			layer.msg('退出成功');
			window.location.href= "<%=basePath%>/u/login";
			return !1;
		}else{
			layer.msg('退出失败，重试！');
		}
	});
}
</script>
<style>
.head{
	background:url(<%=basePath%>/images/head.jpg) no-repeat left top #003354;
	height:110px;
}
</style>
<base href="<%=basePath%>">

<div class="navbar navbar-inverse navbar-fixed-top animated fadeInDown" style="z-index: 101;height: 151px;">
	  <div class="head"></div>
      <div class="container" style="padding-left: 0px; padding-right: 0px;">
        <div class="navbar-header">
        
	     </div>
	     <div role="navigation" class="navbar-collapse collapse">
	     		
	          <ul class="nav navbar-nav" id="topMenu">
			   <li>
                        <a href="<%=basePath%>/user/index">首页</a>
                    </li>
                     <shiro:hasPermission name="/role/addRole">
                       <li class="dropdown">
                      
                    
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">系统管理 <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu1">
                            <li>
                                <a href="<%=basePath%>/manager/list">管理用户</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/permission/list">权限管理</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/carModel/list">数据字典</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/centerInfo/list">钣喷中心管理</a>
                            </li>
                        </ul>
                    </li>
                       </shiro:hasPermission>
                        <shiro:lacksRole name="系统管理员">  <li class="dropdown">
                      
                    
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">钣喷中心信息管理 <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="menu1">
                            <li>
                                <a href="<%=basePath%>/manager/list">系统权限</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/centerInfo/list">组织机构</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/model/listCarModel">车型管理</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>/parts/listParts">配件管理</a>
                            </li>
                             <li>
                                <a href="<%=basePath%>/station/listWorkplace">工位管理</a>
                            </li>
                             <li>
                                <a href="<%=basePath%>/tasktime/listTasktime">维修方法工时管理</a>
                            </li>
                             <li>
                                <a href="<%=basePath%>/equipment/listViewEquipment">展示设备管理</a>
                            </li>
                             <li>
                                <a href="<%=basePath%>/statequip/editEquipInfo">车位设备管理</a>
                            </li>
                        </ul>
                    </li></shiro:lacksRole>
                     <li class="dropdown">
                        <a href="/AMS/customer/list" >客户管理 </b>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="/AMS/order/list">维修管理 </b>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="/AMS/statistics/orderSta">统计功能 </i>
                        </a>
                    </li>
			</ul>
	         <ul class="nav navbar-nav  pull-right" ><li class="dropdown " style="color:#fff;">
						<!--已经登录（包括记住我的）-->
					<shiro:user>  
						<a aria-expanded="false" aria-haspopup="true"  role="button" data-toggle="dropdown" class="dropdown-toggle qqlogin" > 
						<shiro:principal property="trueName"/>
						<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=basePath%>/manager/editPswd">修改密码</a></li>
							<li><a href="<%=basePath%>/manager/editManager?userid=<shiro:principal property="id"/>">编辑信息</a></li>
							<li><a href="javascript:void(0);" onclick="logout();">退出登录</a></li>
						</ul>
					</shiro:user>   
						
			

					<!--没有登录(游客)-->
					<shiro:guest>  

						 <a href="<%=basePath%>/u/login" class="dropdown-toggle qqlogin" >
						&nbsp;登录</a>
					</shiro:guest>  
				</li>	
	          </ul>
	          <style>#topMenu>li>a{padding:10px 13px}</style>
	    </div>
  	</div>
</div>
<div style="height:80px;"></div>