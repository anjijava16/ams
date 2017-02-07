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
<title>钣喷中心管理平台</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<link
	href="<%=basePath%>/js/common/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="<%=basePath%>/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet" media="screen">

<link href="<%=basePath%>/css/common/base.css" rel="stylesheet" />
<link href="<%=basePath%>/vendors/datepicker.css" rel="stylesheet" />
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="<%=basePath%>/vendors/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>/js/common/layer/layer.js"></script>
<script
	src="<%=basePath%>/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/shiro.demo.js"></script>
<script src="<%=basePath%>/vendors/bootstrap-datepicker.js"></script>
<script src="<%=basePath%>/vendors/flot/jquery.flot.js"></script>
<script src="<%=basePath%>/vendors/flot/jquery.flot.categories.js"></script>
<script src="<%=basePath%>/vendors/flot/jquery.flot.pie.js"></script>
<script>
	//时间选择框
	$(function() {
		var order = ${orderList};
		var data;
		$.each(order, function(i,obj){
			data = [ ["工时费", obj.hour_total], ["备件费", obj.parts_total], ["附加费", obj.add_total],
			 ["优惠费", obj.dis_total], ["总收入", obj.total_price] ];
		});
        $.plot("#catchart", [ data ], {
            series: {
                bars: {
                    show: true,
                    barWidth: 0.6,
                    align: "center"
                }
            },
            xaxis: {
                mode: "categories",
                tickLength: 0
            }
        });
        
        var partsList = ${partsList};
		var numData = [];
		var priceData = [];
		var totalNum = 0;
		var totalPrice = 0;
		$.each(partsList, function(i,obj){
   			totalNum += parseFloat(obj.num);
   			totalPrice += parseFloat(obj.price);
   		});
		$.each(partsList, function(i,obj){
   			numData[i] = {
                label: obj.parts_name,
                data: (obj.num / totalNum) * 100
            };
   			priceData[i] = {
                label: obj.parts_name,
                data: (obj.price / totalPrice) * 100
            };
   		});
        $.plot('#piechart1', numData, {
            series: {
                pie: { 
                    show: true,
                    radius: 1,
                    label: {
                        show: true,
                        radius: 3/4,
                        formatter: labelFormatter,
                        background: { 
                            opacity: 0.5,
                            color: '#000'
                        }
                    }
                }
            },
            legend: {
                show: false
            }
        });
           
        $.plot('#piechart2', priceData, {
            series: {
                pie: {
                    show: true,
                    radius: 1,
                    tilt: 0.5,
                    label: {
                        show: true,
                        radius: 1,
                        formatter: labelFormatter,
                        background: {
                            opacity: 0.8
                        }
                    },
                    combine: {
                        color: '#999',
                        threshold: 0.1
                    }
                }
            },
            legend: {
                show: false
            }
        });
        
        var oiList = ${oiList};
		var data2 = [${empNum}];
		$.each(oiList, function(i,obj){
			data2[i] = [obj.rep_emp_name, obj.hour_total];
		});
        $.plot("#catchart2", [ data2 ], {
            series: {
                bars: {
                    show: true,
                    barWidth: 0.6,
                    align: "center"
                }
            },
            xaxis: {
                mode: "categories",
                tickLength: 0
            }
        });
	});
	
	function labelFormatter(label, series) {
            return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
    }
</script>
</head>
<body data-target="#one" data-spy="scroll">
	<jsp:include page="../views/common/head.jsp" flush="true"></jsp:include>
	<div class="container"
		style="padding-bottom: 15px;min-height: 300px; margin-top: 40px;">
		<div class="row">
			<div class="col-md-10">
				<h2>工作情况总览</h2>
				<div class="row-fluid">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">工单实时柱状图</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<div id="catchart" style="width:100%;height:300px"></div>
						</div>
					</div>
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">销售数量</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<div id="piechart1" style="width:100%;height:200px"></div>
						</div>
					</div>
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">销售收入</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<div id="piechart2" style="width:100%;height:200px"></div>
						</div>
					</div>
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">工作量实时柱状图</div>
					</div>
					<div class="block-content collapse in">
						<div class="span12">
							<div id="catchart2" style="width:100%;height:300px"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>