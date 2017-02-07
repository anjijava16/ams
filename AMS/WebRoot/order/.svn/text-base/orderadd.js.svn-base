function addCustomer(){
	window.location.href="/AMS/customer/add";
}
//查询工时列表
function listWorkingHours(){
	var load = layer.load();
	$(".whTr").remove();
	$.ajax({  
	   type: "POST",  
	   url: "/AMS/order/listWorkingHours",  
	   data: $("#wh").serializeArray(),
	   dataType: 'json',  
	   success: function(rst){
		   layer.close(load);
		   if(rst.status == 200){
			   if(rst.whList.length > 0){
				   $("#whNone").addClass("none");
				   $.each(rst.whList, function(i,obj){
					   $("#whTb").append("<tr class=\"whTr\" onclick=\"putItem('"+obj.hours+"','"+obj.price+"','"+obj.taskproject+"');\"><td>"+obj.damage_parts_group+"</td>"
					   +"<td>"+obj.damage_position+"</td>"
					   +"<td>"+obj.damage_parts+"</td>"
					   +"<td>"+obj.repairtype+"</td>"
					   +"<td>"+obj.repairmethod+"</td>"
					   +"<td>"+obj.taskproject+"</td>"
					   +"<td>"+obj.repairlevel+"</td>"
					   +"<td>"+obj.pricerange+"</td>"
					   +"<td>"+obj.hours+"</td>"
					   +"<td>"+obj.price+"</td></tr>");
				   });
			   }
		   } else {
				layer.msg(rst.message);
			}
	   }  
	});  
}
//为工单项目赋值
function putItem(hours, price, taskproject){
	$("#rep_item_type").val(taskproject);
	$("#work_hour").val(hours);
	$("#hour_price").val(price);
	var add_hour = $("#add_hour").val();
	var discount = $("#discount").val();
	var hour_total = (price / 60 * hours + add_hour * price / 60) * discount / 100;
	$("#hour_total").val(hour_total.toFixed(2));
	
}
//计算工单项目总价
function calcItem(){
	var price = $("#hour_price").val();
	var hours = $("#work_hour").val();
	var add_hour = $("#add_hour").val();
	var discount = $("#discount").val();
	var hour_total = (price / 60 * hours + add_hour * price / 60) * discount / 100;
	$("#hour_total").val(hour_total.toFixed(2));
}
//插入工单项目
function addItems(){
	var load = layer.load();
	$.ajax({  
	   type: "POST",  
	   url: "/AMS/order/insertItem",  
	   data: $("#orderItemFm").serializeArray(),  
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
//查询备件列表
function listCarParts(){
	var load = layer.load();
	$(".cpTr").remove();
	$.ajax({  
		type: "POST",  
		url: "/AMS/order/listCarParts",  
		data: $("#cpFm").serializeArray(),  
		dataType: 'json',  
		success: function(rst){
			layer.close(load);
			if(rst.status == 200){
				if(rst.cpList.length > 0){
					$("#cpNone").addClass("none");
					$.each(rst.cpList, function(i,obj){
						$("#cpTb").append("<tr class=\"cpTr\" onclick=\"putParts('"+obj.partsname+"','"+obj.partsprice+"','"+obj.partsnumber+"');\">"
								+"<td>"+obj.damage_parts_group+"</td>"
								+"<td>"+obj.damage_position+"</td>"
								+"<td>"+obj.damage_parts+"</td>"
								+"<td>"+obj.partsname+"</td>"
								+"<td>"+obj.partsnumber+"</td>"
								+"<td>"+obj.firmsnumber+"</td>"
								+"<td>"+obj.applymodel+"</td>"
								+"<td>"+obj.partsprice+"</td>"
								+"<td>"+obj.partstype+"</td>"
								+"<td>"+obj.stocknum+"</td></tr>");
					});
				}
			} else {
				layer.msg(rst.message);
			}
		}  
	});  
}
//为工单项目赋值
function putParts(partsname, price, partsnumber){
	$("#parts_name").val(partsname);
	$("#price").val(price);
	$("#parts_no").val(partsnumber);
	var discount = $("#discountParts").val();
	var num = $("#num").val();
	var parts_total = (price * num) * discount / 100;
	$("#total").val(parts_total.toFixed(2));
	
}

function calcParts(){
	var price = $("#price").val();
	var discount = $("#discountParts").val();
	var num = $("#num").val();
	var parts_total = (price * num) * discount / 100;
	$("#total").val(parts_total.toFixed(2));
}

function addParts(){
	var load = layer.load();
	$.ajax({  
		type: "POST",  
		url: "/AMS/order/insertParts",  
		data: $("#orderPartsFm").serializeArray(),  
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

function addOrderAdd(){
	var load = layer.load();
	$.ajax({  
		type: "POST",  
		url: "/AMS/order/insertAdd",  
		data: $("#orderAddFm").serializeArray(),  
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

