package com.mit.order.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.EmployeeWplace;
import com.mit.core.mybatis.page.Pagination;
import com.mit.order.bo.Order;
import com.mit.order.bo.OrderAdd;
import com.mit.order.bo.OrderItem;
import com.mit.order.bo.OrderParts;
import com.mit.order.bo.UploadInfo;

/**
 * @author 刘鹏飞
 * @date 2016-11-02
 */
public interface OrderService {

	int insertSelective(Order order);

	Order selectByPrimaryKey(Long id);

	int updateBySelective(Order order);
	
	int updateOrderPrice(Order order);
	
	Pagination<Order> findByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	List<Order> getRunningOrder(Map<String, Object> resultMap);
	
	int insertOrderItem(OrderItem orderItem);
	
	OrderItem selectOrderItem(Long id);
	
	int updateOrderItem(OrderItem orderItem);
	
	Pagination<OrderItem> findOrderItemByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	List<OrderItem> findOrderItemByOrderId(Long orderId);
	
	int insertOrderParts(OrderParts orderParts);
	
	OrderParts selectOrderParts(Long id);
	
	int updateOrderParts(OrderParts orderParts);
	
	Pagination<OrderParts> findOrderPartsByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	int insertOrderAdd(OrderAdd orderAdd);
	
	OrderAdd selectOrderAdd(Long id);
	
	int updateOrderAdd(OrderAdd orderAdd);
	
	Pagination<OrderAdd> findOrderAddByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	List<EmployeeWplace> getEmpByWpId(Long wpId);
	
	List<UploadInfo> getUploadInfos(Map<String, Object> resultMap);
	
	int updateUploadInfo(Map<String, Object> resultMap);
	
}