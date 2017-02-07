package com.mit.order.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mit.common.dao.ReviewMapper;
import com.mit.core.mybatis.BaseMybatisDao;
import com.mit.core.mybatis.page.Pagination;
import com.mit.order.bo.Ask;
import com.mit.order.bo.Question;
import com.mit.order.bo.Review;
import com.mit.order.service.ReviewService;

/**
 * @author 刘鹏飞
 * @date 2016-11-02
 */

@Service
public class ReviewServiceImpl extends BaseMybatisDao<ReviewMapper> implements
		ReviewService {
	@Autowired
	ReviewMapper reviewMapper;

	@Override
	public int insertSelective(Review review) {
		return reviewMapper.insertSelective(review);
	}

	@Override
	public Review selectByPrimaryKey(Long id) {
		return reviewMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateBySelective(Review review) {
		return reviewMapper.updateSelective(review);
	}
	
	@Override
	public Pagination<Review> findByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage(resultMap, pageNo, pageSize);
	}
	
	@Override
	public int insertAsk(Ask ask) {
		return reviewMapper.insertAsk(ask);
	}

	@Override
	public Ask selectAsk(Long id) {
		return reviewMapper.selectAsk(id);
	}

	@Override
	public int updateAsk(Ask ask) {
		return reviewMapper.updateAsk(ask);
	}

	@Override
	public Pagination<Ask> findAskByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage("findAllAsk", "findAskCount", resultMap, pageNo, pageSize);
	}
	
	@Override
	public int insertQuestion(Question question) {
		return reviewMapper.insertQuestion(question);
	}

	@Override
	public Question selectQuestion(Long id) {
		return reviewMapper.selectQuestion(id);
	}

	@Override
	public int updateQuestion(Question question) {
		return reviewMapper.updateQuestion(question);
	}

	@Override
	public Pagination<Question> findQuestionByPage(Map<String, Object> resultMap,
			Integer pageNo, Integer pageSize) {
		return super.findPage("findAllQuestion", "findQuestionCount", resultMap, pageNo, pageSize);
	}

	@Override
	public List<Ask> listAllAsk(Map<String, Object> resultMap) {
		return super.findNoPageList("findAllAsk", resultMap);
	}

	@Override
	public int updateQuestionByAsk(Long id) {
		return reviewMapper.updateQuestionByAsk(id);
	}
}