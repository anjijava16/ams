<%@ page contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>钣喷中心管理平台</title>
<style>
*{
	padding:0;
	margin:0;
}
.body{
	background:url(<%=basePath %>/images/loginbg.jpg) no-repeat top center #0472ae;
}
.loginbg {
    background:url(<%=basePath %>/images/loginline.png) repeat-x left bottom;
    height: 398px;
    left: 0;
    margin-top: -199px;
    position: absolute;
    top: 50%;
    width: 100%;
}
.login{
	background:url(<%=basePath %>/images/login.png) no-repeat bottom center;
	width:850px;
	height:398px;
	margin:0 auto;
}
.loginCon {
    padding: 82px 0 0 600px;
    width: 200px;
}
.loginInput{
	border:1px solid #69b1e3;
	background:#fff;
	height:23px;
	line-height:23px;
	padding-left:5px;
	width:180px;
	font-size:12px;
	margin-bottom:24px;
}
.loginSubmit{
	background:url(<%=basePath %>/images/loginsubmit.jpg) no-repeat;
	width:57px;
	height:23px;
	border:none;
	cursor:pointer;
}
#errorDiv {
    padding-left: 470px;
}
#errorMsg{
	color:#fff;
	font-size:14px;
	font-weight:normal;
}
</style>
 <script src="<%=basePath %>/vendors/jquery-1.9.1.min.js"></script>
   <script src="<%=basePath %>/vendors/MD5.js"></script>
   <script src="<%=basePath %>/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript">
	//将form中的值转换为键值对。
	function getFormJson(frm) {
	    var o = {};
	    var a = $(frm).serializeArray();
	    $.each(a, function () {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	
	    return o;
	}
	
    function submitLogin(){
		 var uname =$('#username').val();
		 var pswd = $('#password').val();
	     var pswd = MD5(uname +"#" + pswd);
    	var dataPara ={password:pswd,username:uname};
    	$.post("<%=basePath %>/u/submitLogin", dataPara, function(data){
    		var status = data.status;
    		if(status == 200){
    			$("#errorDiv").removeClass().addClass("alert alert-success"); 
	    		$("#errorMsg").empty();
	   			$("#errorDiv").show();
	   			$("#errorMsg").append(data.message);
	   			location.href="<%=basePath %>/user/index";
    		} else if(status == 500){
	    		$("#errorMsg").empty();
	   			$("#errorDiv").show();
	   			$("#errorMsg").append(data.message);
    		} else {
    			$("#errorMsg").empty();
    			$("#errorMsg").append("系统错误");
    		}
		});
    }
    </script>
</head>

<body class="body">
	<div class="loginbg">
   		<div class="login">
        <div style="height:120px;">
                <div class="alert alert-error" id="errorDiv" style="display:none;">
                    <button class="close" data-dismiss="alert">&times;</button>
                    <strong id="errorMsg"></strong>
                </div>
            </div>
         <form class="form-signin"id="form-signin" method="post">
        	<div class="loginCon">
            	<input type="text"  class="loginInput" placeholder="请输入用户名" value="liupengfei" name="username" id="username"/>
                <input type="password" name="password" id="password" class="loginInput" value="000000" placeholder="请输入密码" />
              <button type="button" onclick="submitLogin();"  class="loginSubmit"></button>
            </div>
            </form>
        </div>
    </div>
</body>
</html>
