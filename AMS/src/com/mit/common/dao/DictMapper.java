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

import com.mit.dict.bo.DictData;

/**  
 * @ClassName: CustomerMapper  
 * @Description: TODO(这里用一句话描述这个类的作用)  
 * @author 刘鹏飞
 * @date 2016-9-23 下午1:54:47  
 *    
 */
public interface DictMapper {

	List<DictData> findAllData();
}
