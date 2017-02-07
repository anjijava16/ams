/**    
 * @Title: DictServiceImpl.java  
 * @Package com.mit.dict.service  
 * @Description: TODO(用一句话描述该文件做什么)  
 * @author 刘鹏飞
 * @date 2016-10-21 上午10:09:02  
 * @version V1.0    
 */
package com.mit.dict.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.DictMapper;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.dict.bo.DictData;
import com.mit.dict.service.DictService;

/**
 * @ClassName: DictServiceImpl
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 刘鹏飞
 * @date 2016-10-21 上午10:09:02
 * 
 */
@Service
public class DictServiceImpl extends BaseMybatisDao<DictMapper> implements
		DictService {

	@Autowired
	DictMapper dictMapper;
	
	@Override
	public List<DictData> findAllData() {
		return dictMapper.findAllData();
	}

}
