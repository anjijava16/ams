package com.mit.common.dao;

import com.mit.common.model.CenterInfo;


public interface CenterInfoMapper {
	CenterInfo selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(CenterInfo centerInfo);
	 int updateByPrimaryKeySelective(CenterInfo centerInfo);
	 int updateStatusById(Long id);
}