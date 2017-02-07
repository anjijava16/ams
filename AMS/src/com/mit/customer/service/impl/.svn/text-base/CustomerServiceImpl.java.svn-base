/**    
* @Title: CustomerServiceImpl.java  
* @Package com.mit.customer.service.impl  
* @Description: TODO(用一句话描述该文件做什么)  
* @author 刘鹏飞
* @date 2016-9-23 下午1:53:21  
* @version V1.0    
*/
package com.mit.customer.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.CustomerMapper;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.customer.bo.CarInfo;
import com.mit.customer.bo.Customer;
import com.mit.customer.bo.Linkman;
import com.mit.customer.service.CustomerService;

/**  
 * @ClassName: CustomerServiceImpl  
 * @Description: TODO(这里用一句话描述这个类的作用)  
 * @author 刘鹏飞
 * @date 2016-9-23 下午1:53:21  
 *    
 */
@Service
public class CustomerServiceImpl extends BaseMybatisDao<CustomerMapper> implements
		CustomerService {

	@Autowired
	CustomerMapper customerMapper;
	
	@Override
	public int deleteByPrimaryKey(Long id) {
		return 0;
	}

	@Override
	public int insertSelective(Customer customer) {
		return customerMapper.insertSelective(customer);
	}

	@Override
	public Customer selectByPrimaryKey(Long id) {
		return customerMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateBySelective(Customer customer) {
		return customerMapper.updateBySelective(customer);
	}

	@Override
	public List<Customer> findAllCustomers(Map<String, Object> map) {
		return customerMapper.findAllCustomers(map);
	}

	@Override
	public List<CarInfo> findAllCars(Map<String, Object> map) {
		return customerMapper.findAllCars(map);
	}

	@Override
	public Pagination<Customer> findByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage(resultMap, pageNo, pageSize);
	}
	
	@Override
	public Pagination<CarInfo> findCarsByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage("findAllCars", "findCountCars", resultMap, pageNo, pageSize);
	}
	
	@Override
	public Pagination<Linkman> findLinkmenByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage("findAllLinkmen", "findCountLinkmen", resultMap, pageNo, pageSize);
	}

	@Override
	public int insertSelectiveCar(CarInfo carInfo) {
		return customerMapper.insertSelectiveCar(carInfo);
	}

	@Override
	public int updateSelectiveCar(CarInfo carInfo) {
		return customerMapper.updateSelectiveCar(carInfo);
	}

	@Override
	public CarInfo selectCarByPrimaryKey(Long id) {
		return customerMapper.selectCarByPrimaryKey(id);
	}
	
	@Override
	public int insertSelectiveLinkman(Linkman linkman) {
		return customerMapper.insertSelectiveLinkman(linkman);
	}
	
	@Override
	public int updateSelectiveLinkman(Linkman linkman) {
		return customerMapper.updateSelectiveLinkman(linkman);
	}
	
	@Override
	public Linkman selectLinkmanByPrimaryKey(Long id) {
		return customerMapper.selectLinkmanByPrimaryKey(id);
	}

	@Override
	public List<CarInfo> selectCarByCusId(Long id) {
		return customerMapper.selectCarByCusId(id);
	}
	
	@Override
	public List<Linkman> selectLinkmanByCusId(Long id) {
		return customerMapper.selectLinkmanByCusId(id);
	}

	@Override
	public int delCarByCus(Long cus_id) {
		return customerMapper.delCarByCus(cus_id);
	}

	@Override
	public int delLinkByCus(Long cus_id) {
		return customerMapper.delLinkByCus(cus_id);
	}
}
