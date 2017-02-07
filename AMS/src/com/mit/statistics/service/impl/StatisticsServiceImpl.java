package com.mit.statistics.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.StatisticsMapper;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.order.bo.Order;
import com.mit.order.bo.OrderItem;
import com.mit.order.bo.OrderParts;
import com.mit.statistics.service.StatisticsService;

/**
 * @author 刘鹏飞
 * @date 2016-11-24
 */

@Service
public class StatisticsServiceImpl extends BaseMybatisDao<StatisticsMapper>
		implements StatisticsService {
	@Autowired
	StatisticsMapper statisticsMapper;

	@Override
	public List<Order> findOrderStatistics(Map<String, Object> resultMap) {
		return statisticsMapper.findOrderStatistics(resultMap);
	}
	
	@Override
	public List<OrderParts> findPartsStatistics(Map<String, Object> resultMap) {
		return statisticsMapper.findPartsStatistics(resultMap);
	}

	@Override
	public List<OrderItem> getEmpWorkHour(Map<String, Object> resultMap) {
		return statisticsMapper.getEmpWorkHour(resultMap);
	}

}