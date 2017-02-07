/**    
* @Title: CustomerMapper.java  
* @Package com.mit.common.dao  
* @Description: TODO(用一句话描述该文件做什么)  
* @author 刘鹏飞
* @date 2016-9-23 下午1:54:47  
* @version V1.0    
*/
package com.mit.common.dao;

import java.util.List;
import java.util.Map;

import com.mit.customer.bo.CarInfo;
import com.mit.customer.bo.Customer;
import com.mit.customer.bo.Linkman;

/**  
 * @ClassName: CustomerMapper  
 * @Description: TODO(这里用一句话描述这个类的作用)  
 * @author 刘鹏飞
 * @date 2016-9-23 下午1:54:47  
 *    
 */
public interface CustomerMapper {

	int deleteByPrimaryKey(Long id);

    int insertSelective(Customer customer);

    Customer selectByPrimaryKey(Long id);
    
    CarInfo selectCarByPrimaryKey(Long id);
    
    List<CarInfo> selectCarByCusId(Long id);
    
    List<Linkman> selectLinkmanByCusId(Long id);
    
    Linkman selectLinkmanByPrimaryKey(Long id);

    int updateBySelective(Customer customer);

	List<Customer> findAllCustomers(Map<String, Object> map);
	
	List<CarInfo> findAllCars(Map<String, Object> map);
	
	int insertSelectiveCar(CarInfo carInfo);

    int updateSelectiveCar(CarInfo carInfo);
    
    int insertSelectiveLinkman(Linkman linkman);
    
    int updateSelectiveLinkman(Linkman linkman);
    
    int delCarByCus(Long cus_id);
    
    int delLinkByCus(Long cus_id);
}
