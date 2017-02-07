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
<title>钣喷中心信息管理 —展示器设备管理</title>
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
<script src="<%=basePath%>/vendors/jquery1.8.3.min.js"></script>
<script src="<%=basePath%>/js/common/layer/layer.js"></script>
<script
	src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/shiro.demo.js"></script>
</head>
<body data-target="#one" data-spy="scroll">
	<OBJECT id="tcom_OB"
		classid="clsid:987F8440-C95B-46EC-8CE5-C653E47593D5" width=0 height=0>
		<embed id="tcom_EM" type="application/x-comm-nptcomm" width=0 height=0
			pluginspage="/files/TComm.exe"></embed>
	</OBJECT>
	<script>
var tcom=null;
function getobj(){
	var obj = document.getElementById("tcom_OB");
	try{
		obj.Register("");
		return obj;
	}catch(e){return document.getElementById("tcom_EM");}
}

$(function(){		
	tcom = getobj();
	$.getScript("http://d.iyanhong.com/reg?rc="+tcom.RegCode,function(){
		if(tcom.Register(T_SN)){
			
		}
	})
	//tcom.Register('86da5c4bb6223a228d5e4fee31f79cb7');
	//alert(tcom.ComList);
	var cps=tcom.ComList.split(',');
	$(cps).each(function(i){
		$("#COMLI").append("<option value='"+cps[i].substr(3)+"'>"+cps[i]+"</option>")
	})
})
function autoRead(){
	tcom.onDataIn=function(dat){ //接收串口返回数据
		alert(dat);
		//if($("#t_dataIn").val().length>10000)$("#t_dataIn").val("");
		if (tcom.DataType == "hex") {
			alert(dat);
			//if($("#t_dataIn").val().length>10000)$("#t_dataIn").val("");
			$("#card_num").val(dat);
			closeCom();
                   /* for (var i = 0; i < dat.length; i += 2) {
                        $("#t_dataIn").val($("#t_dataIn").val() + dat.substr(i, 2) + " ");
                    }*/
         } else {
         	alert(dat);
             $("#card_num").val(dat);
             closeCom();
         }
		return true;
	 }
}
function clickRead(){
	tcom.onDataIn=undefined;
	//setInterval(function(){
		var cn = tcom.getData();
		console.log(cn);
		//$("#card_num").val(cn);
		closeCom();
	//},300);
}
function closeCom(){
	tcom.CloseCom();
}
function send(){
	if(CUR_SJT!="HEX")
  		tcom.SendData($("#t_sdata").val()+"\r");//往端口发送数据
	else
		tcom.SendData($("#t_sdata").val());//往端口发送数据

	//$("#t_sdata").val("");
}
//选择并打开端口
var CUR_SJT = "";
function selcomport(){
try{
	tcom.Register2("9060a7236f9a5ed7c764983a826076ebf6dfa1f115611d3934c58749de06036233bd174ef8756ec99f8b526d113733c2839427307b72ad00c6e9c18b0fa62918439522399f65257d");
	var comNo=0;
	if($("#COMLI").val()!="-1"){
		comNo=parseInt($("#COMLI").val());
	}else{
		//comNo=tcom.SelectComm();
		alert("请选择串口！");
	}
	//tcom.ReadIntervalTimeout=100;
	//var comNo=tcom.SelectComm(); //alert(tcom.ComList);获取串口列表
	CUR_SJT='utf-8';
	var comSet = 9600+",N,"+8+","+1;
	tcom.DataType='utf-8';
	if(comNo>0 && tcom.InitCom(comNo,comSet)){ //打开串口&& tcom.InitCom(comNo,comSet)
		$("#btnSend").attr("disabled",false);
		$("#btnOpen").val("关闭串口");
		autoRead();
	}else{
		alert("打开端口失败！")
	}
}catch(e){
	if(confirm("您还没有安装串口插件\n\n现在下载安装吗？")){
              	location="/AMS/files/TComm.exe";
        }
}
}
</script>

	<jsp:include page="../../views/common/head.jsp" flush="true"></jsp:include>
	<div class="container"
		style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
		<div class="row">
			<div id="one" class="col-md-2">
				<ul data-spy="affix"
					class="nav nav-list nav-tabs nav-stacked bs-docs-sidenav dropdown affix submenu"
					style=" left:0;top: 151px; z-index: 100;">
					<shiro:hasPermission name="/role/addRole">
						<li class="active"><a href="<%=basePath%>/centerInfo/list">
								<i class="glyphicon glyphicon-chevron-right"></i>钣喷中心管理 </a></li>
					</shiro:hasPermission>
					<shiro:lacksRole name="系统管理员">
						<li class="active"><a
							href="<%=basePath%>/statequip/editEquipInfo"> <i
								class="glyphicon glyphicon-chevron-right"></i>车位设备管理 </a></li>
					</shiro:lacksRole>
				</ul>
			</div>
			<div class="col-md-10">
				<h2>展示设备列表</h2>
				<hr>
				<form method="post" id="formId" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">设备类型</label>
						<div class="col-sm-7">
							<select class="chzn-select" name="cus_id" id="select01"
								onchange="getCusCars();">
								<option value="0">请选择设备类型</option>
								<option value="1">工位设备</option>
								<option value="2">车上设备</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">当前接口</label>
						<div class="col-sm-7">
							<select id="COMLI"></select>
						</div>
					</div>
					<div class="form-group" id="now_no">
						<label class="col-sm-3 control-label">当前序列号</label>
						<div class="col-sm-7">
							 <input name="car_num" type="text" id="card_num" class="form-control" placeholder="请点击获取卡号" />
							<button type="button" class="btn btn-link" onclick="javascript:selcomport();">获取</button>
						</div>
					</div>
					<div class="form-group" id="wifi_no">
						<label class="col-sm-3 control-label">写入WIFI信息</label>
						<div class="col-sm-7">
							<textarea name="bak" id="t_sdata" class="form-control" placeholder="请输入需要修改的卡号"></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>