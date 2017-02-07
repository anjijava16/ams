package com.mit.centerInfo.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.CenterInfo;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface CenterInfoService {
	 CenterInfo selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(CenterInfo centerInfo);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(CenterInfo centerInfo);
	 Map<String, Object> deleteCenterInfoByid(String ids);
	 Pagination<CenterInfo> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<CenterInfo> ListCenterInfo(Map<String, Object> resultMap);
}