package com.mit.information.service;

import java.util.List;
import java.util.Map;

import com.mit.common.model.Profession;
import com.mit.core.mybatis.page.Pagination;



/**
 * @author yejianming
 */
public interface ProfessionService {
	Profession selectByPrimaryKey(Long id);
	 int deleteByPrimaryKey(Long id);
	 int insertSelective(Profession profession);
	 int updateStatusById(Long id);
	 int updateByPrimaryKeySelective(Profession profession);
	 Map<String, Object> deleteProfessionByid(String ids);
	 Pagination<Profession> findByPage(Map<String, Object> resultMap, Integer pageNo,
				Integer pageSize);
	 List<Profession> ListProfession(Map<String, Object> resultMap);
}