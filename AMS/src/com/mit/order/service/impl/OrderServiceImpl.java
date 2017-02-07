package com.mit.order.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.OrderMapper;
import com.mit.common.model.EmployeeWplace;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.order.bo.Order;
import com.mit.order.bo.OrderAdd;
import com.mit.order.bo.OrderItem;
import com.mit.order.bo.OrderParts;
import com.mit.order.bo.UploadInfo;
import com.mit.order.service.OrderService;

/**
 * @author 刘鹏飞
 * @date 2016-11-02
 */

@Service
public class OrderServiceImpl extends BaseMybatisDao<OrderMapper> implements
		OrderService {
	@Autowired
	OrderMapper orderMapper;

	@Override
	public int insertSelective(Order order) {
		return orderMapper.insertSelective(order);
	}

	@Override
	public Order selectByPrimaryKey(Long id) {
		return orderMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateBySelective(Order order) {
		return orderMapper.updateBySelective(order);
	}
	
	@Override
	public int updateOrderPrice(Order order) {
		return orderMapper.updateOrderPrice(order);
	}

	@Override
	public Pagination<Order> findByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage(resultMap, pageNo, pageSize);
	}
	
	@Override
	public int insertOrderItem(OrderItem orderItem) {
		return orderMapper.insertOrderItem(orderItem);
	}

	@Override
	public OrderItem selectOrderItem(Long id) {
		return orderMapper.selectOrderItem(id);
	}

	@Override
	public int updateOrderItem(OrderItem orderItem) {
		return orderMapper.updateOrderItem(orderItem);
	}

	@Override
	public Pagination<OrderItem> findOrderItemByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage("findAllOrderItem", "findOrderItemCount", resultMap, pageNo, pageSize);
	}
	
	@Override
	public int insertOrderParts(OrderParts orderParts) {
		return orderMapper.insertOrderParts(orderParts);
	}

	@Override
	public OrderParts selectOrderParts(Long id) {
		return orderMapper.selectOrderParts(id);
	}

	@Override
	public int updateOrderParts(OrderParts orderParts) {
		return orderMapper.updateOrderParts(orderParts);
	}

	@Override
	public Pagination<OrderParts> findOrderPartsByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage("findAllOrderParts", "findOrderPartsCount", resultMap, pageNo, pageSize);
	}
	
	@Override
	public int insertOrderAdd(OrderAdd orderAdd) {
		return orderMapper.insertOrderAdd(orderAdd);
	}

	@Override
	public OrderAdd selectOrderAdd(Long id) {
		return orderMapper.selectOrderAdd(id);
	}

	@Override
	public int updateOrderAdd(OrderAdd orderAdd) {
		return orderMapper.updateOrderAdd(orderAdd);
	}

	@Override
	public Pagination<OrderAdd> findOrderAddByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage("findAllOrderAdd", "findOrderAddCount", resultMap, pageNo, pageSize);
	}

	@Override
	public List<OrderItem> findOrderItemByOrderId(Long orderId) {
		return orderMapper.findOrderItemByOrderId(orderId);
	}

	@Override
	public List<Order> getRunningOrder(Map<String, Object> resultMap) {
		return super.findNoPageList("findAll", resultMap);
	}

	@Override
	public List<EmployeeWplace> getEmpByWpId(Long wpId) {
		return orderMapper.getEmpByWpId(wpId);
	}

	@Override
	public List<UploadInfo> getUploadInfos(Map<String, Object> resultMap) {
		return orderMapper.getUploadInfos(resultMap);
	}

	@Override
	public int updateUploadInfo(Map<String, Object> resultMap) {
		return orderMapper.updateUploadInfo(resultMap);
	}

}