package com.mit.order.service;

import java.util.List;
import java.util.Map;

import com.mit.core.mybatis.page.Pagination;
import com.mit.order.bo.Ask;
import com.mit.order.bo.Question;
import com.mit.order.bo.Review;

/**
 * @author 刘鹏飞
 * @date 2016-11-02
 */
public interface ReviewService {

	int insertSelective(Review review);

	Review selectByPrimaryKey(Long id);

	int updateBySelective(Review review);
	
	Pagination<Review> findByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	int insertAsk(Ask ask);
	
	Ask selectAsk(Long id);
	
	int updateAsk(Ask ask);
	
	Pagination<Ask> findAskByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	
	List<Ask> listAllAsk(Map<String, Object> resultMap);
	
	int insertQuestion(Question question);
	
	Question selectQuestion(Long id);
	
	int updateQuestion(Question question);
	
	Pagination<Question> findQuestionByPage(Map<String, Object> resultMap, Integer pageNo,
			Integer pageSize);
	int updateQuestionByAsk(Long id);
}