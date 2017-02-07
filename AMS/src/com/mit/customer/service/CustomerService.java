/**    
* @Title: CustomerService.java  
* @Package com.mit.customer.service  
* @Description: TODO(用一句话描述该文件做什么)  
* @author 刘鹏飞
* @date 2016-9-23 下午1:52:54  
* @version V1.0    
*/
package com.mit.customer.service;

import java.util.List;
import java.util.Map;

import com.mit.core.mybatis.page.Pagination;
import com.mit.customer.bo.CarInfo;
import com.mit.customer.bo.Customer;
import com.mit.customer.bo.Linkman;

/**  
 * @ClassName: CustomerService  
 * @Description: TODO(这里用一句话描述这个类的作用)  
 * @author 刘鹏飞
 * @date 2016-9-23 下午1:52:54  
 *    
 */
public interface CustomerService {

	int deleteByPrimaryKey(Long id);

    int insertSelective(Customer customer);

    Customer selectByPrimaryKey(Long id);
    
    CarInfo selectCarByPrimaryKey(Long id);
    
    Linkman selectLinkmanByPrimaryKey(Long id);

    int updateBySelective(Customer customer);

	List<Customer> findAllCustomers(Map<String, Object> map);
	
	Pagination<Customer> findByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	Pagination<CarInfo> findCarsByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	Pagination<Linkman> findLinkmenByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	List<CarInfo> findAllCars(Map<String, Object> map);
	
	int insertSelectiveCar(CarInfo carInfo);

    int updateSelectiveCar(CarInfo carInfo);
    
    int insertSelectiveLinkman(Linkman linkman);
    
    int updateSelectiveLinkman(Linkman linkman);
    
    List<CarInfo> selectCarByCusId(Long id);
    List<Linkman> selectLinkmanByCusId(Long id);
    
    int delCarByCus(Long cus_id);
    
    int delLinkByCus(Long cus_id);
}
