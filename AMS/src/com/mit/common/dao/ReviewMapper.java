package com.mit.common.dao;

import java.util.Map;

import com.mit.core.mybatis.page.Pagination;
import com.mit.order.bo.Ask;
import com.mit.order.bo.Question;
import com.mit.order.bo.Review;

public interface ReviewMapper {
	
	int insertSelective(Review review);

	Review selectByPrimaryKey(Long id);

	int updateSelective(Review review);
	
	Pagination<Review> findByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	int insertAsk(Ask ask);
	
	Ask selectAsk(Long id);
	
	int updateAsk(Ask ask);
	
	Pagination<Ask> findItemByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	int insertQuestion(Question question);
	
	Question selectQuestion(Long id);
	
	int updateQuestion(Question question);
	
	Pagination<Question> findOrderPartsByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	int updateQuestionByAsk(Long id);

}