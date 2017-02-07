package com.mit.order.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mit.common.controller.BaseController;
import com.mit.common.utils.LoggerUtils;
import com.mit.core.mybatis.page.Pagination;
import com.mit.core.shiro.token.manager.TokenManager;
import com.mit.customer.bo.Customer;
import com.mit.customer.service.CustomerService;
import com.mit.order.bo.Ask;
import com.mit.order.bo.Order;
import com.mit.order.bo.Question;
import com.mit.order.bo.Review;
import com.mit.order.service.OrderService;
import com.mit.order.service.ReviewService;

/**
 * @author 刘鹏飞
 * @date 2016-11-02
 */

@Controller
@Scope(value = "prototype")
@RequestMapping("review")
public class ReviewController extends BaseController {

	@Autowired
	ReviewService reviewService;
	@Autowired
	CustomerService customerService;
	@Autowired
	OrderService orderService;
	
	/**
	 * 回访单列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(ModelMap map,Integer pageNo,String findContent){
		map.put("centerid", findCenterId == null ? 0 : findCenterId);
		map.put("findContent", findContent);
		Pagination<Review> page = reviewService.findByPage(map,pageNo,pageSize);
		map.put("page", page);
		ModelAndView mv = new ModelAndView("review/list");
		TokenManager.setVal2Session("menuFlag", "review");//菜单选中判断
		return mv;
	}
	
	/**
	 * 回访单add跳转
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView add(Long orderId){
		resultMap.put("centerid", findCenterId == null ? 0 : findCenterId);
		ModelAndView mv = new ModelAndView("review/add");
		List<Customer> customers = customerService.findAllCustomers(resultMap);
		mv.addObject("customers", customers);
		Order order = orderService.selectByPrimaryKey(orderId);
		List<Ask> askList = reviewService.listAllAsk(resultMap);
		mv.addObject("askList", askList);
		mv.addObject("order", order);
		TokenManager.setVal2Session("menuFlag", "review");//菜单选中判断
		return mv;
	}
	
	/**
	 * 回访单新增/修改
	 * @return
	 */
	@RequestMapping(value="/insert")
	public ModelAndView insert(Review review){
		if(null != review.getId() && 0 != review.getId()){
			reviewService.updateBySelective(review);
		} else {
			reviewService.insertSelective(review);
		}
		ModelAndView mv = new ModelAndView("redirect:/review/list");
		TokenManager.setVal2Session("menuFlag", "review");//菜单选中判断
		return mv;
	}
	/**
	 * 查询回访单详情
	 * @return
	 */
	@RequestMapping(value="/detail")
	public ModelAndView detail(Long id){
		Review review = reviewService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView("review/add");
		resultMap.put("centerid", findCenterId == null ? 0 : findCenterId);
		List<Customer> customers = customerService.findAllCustomers(resultMap);
		mv.addObject("customers", customers);
		List<Ask> askList = reviewService.listAllAsk(resultMap);
		mv.addObject("askList", askList);
		mv.addObject("review", review);
		TokenManager.setVal2Session("menuFlag", "review");//菜单选中判断
		return mv;
	}
	
	/**
	 * 问题模板列表
	 * @return
	 */
	@RequestMapping(value="/listAsk")
	public ModelAndView listAsk(ModelMap map,Integer pageNo,String findContent){
		map.put("findContent", findContent);
		map.put("centerid", findCenterId == null ? 0 : findCenterId);
		Pagination<Ask> page = reviewService.findAskByPage(map,pageNo,pageSize);
		map.put("page", page);
		ModelAndView mv = new ModelAndView("review/listAsk");
		TokenManager.setVal2Session("menuFlag", "ask");//菜单选中判断
		return mv;
	}
	
	/**
	 * 问题模板add跳转
	 * @return
	 */
	@RequestMapping(value="/addAsk")
	public ModelAndView addAsk(){
		ModelAndView mv = new ModelAndView("review/addAsk");
		TokenManager.setVal2Session("menuFlag", "question");//菜单选中判断
		return mv;
	}
	
	/**
	 * 问题模板新增/修改
	 * @return
	 */
	@RequestMapping(value="/insertAsk",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertAsk(Ask ask){
		try {
			if(null != ask.getId() && 0 != ask.getId()){
				reviewService.updateAsk(ask);
			} else {
				ask.setCenter_id(findCenterId == null ? 0 : findCenterId);
				reviewService.insertAsk(ask);
			}
			resultMap.put("status", 200);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "新增模板失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "新增模板报错。source[%s]",ask.toString());
		}
		return resultMap;
	}
	/**
	 * 查询问题模板详情
	 * @return
	 */
	@RequestMapping(value="/detailAsk")
	public ModelAndView detailAsk(Long id){
		Ask ask = reviewService.selectAsk(id);
		ModelAndView mv = new ModelAndView("review/addAsk");
		mv.addObject("ask", ask);
		TokenManager.setVal2Session("menuFlag", "question");//菜单选中判断
		return mv;
	}
	
	/**
	 * 问题列表
	 * @return
	 */
	@RequestMapping(value="/listQuestion")
	public ModelAndView listQuestion(ModelMap map,Integer pageNo,String findContent){
		map.put("findContent", findContent);
		map.put("centerid", findCenterId == null ? 0 : findCenterId);
		List<Ask> askList = reviewService.listAllAsk(map);
		Pagination<Question> page = reviewService.findQuestionByPage(map, pageNo, pageSize);
		map.put("page", page);
		ModelAndView mv = new ModelAndView("review/listQuestion");
		mv.addObject("askList", askList);
		mv.addObject("centerid", findCenterId == null ? 0 : findCenterId);
		TokenManager.setVal2Session("menuFlag", "question");//菜单选中判断
		return mv;
	}
	
	/**
	 * 问题add跳转
	 * @return
	 */
	@RequestMapping(value="/addQuestion")
	public ModelAndView addQuestion(){
		ModelAndView mv = new ModelAndView("review/addQuestion");
		TokenManager.setVal2Session("menuFlag", "question");//菜单选中判断
		return mv;
	}
	
	/**
	 * 问题新增/修改
	 * @return
	 */
	@RequestMapping(value="/insertQuestion",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertQuestion(Question question){
		try {
			if(null != question.getId() && 0 != question.getId()){
				reviewService.updateQuestion(question);
			} else {
				reviewService.insertQuestion(question);
			}
			resultMap.put("status", 200);
		} catch (Exception e) {
			resultMap.put("status", 500);
			resultMap.put("message", "新增问题失败，请刷新后再试！");
			LoggerUtils.fmtError(getClass(), e, "新增问题报错。source[%s]",question.toString());
		}
		return resultMap;
	}
	/**
	 * 查询问题详情
	 * @return
	 */
	@RequestMapping(value="/detailQuestion")
	public ModelAndView detailQuestion(Long id){
		Question question = reviewService.selectQuestion(id);
		ModelAndView mv = new ModelAndView("review/addQuestion");
		mv.addObject("question", question);
		TokenManager.setVal2Session("menuFlag", "question");//菜单选中判断
		return mv;
	}
	/**
	 * 删除问题模板
	 * @return
	 */
	@RequestMapping(value="/deleteAsk")
	public ModelAndView deleteAsk(Long id){
		ModelAndView mv = new ModelAndView("redirect:listAsk");
		Ask ask = new Ask();
		ask.setId(id);
		ask.setDel_flag("1");
		reviewService.updateAsk(ask);
		reviewService.updateQuestionByAsk(id);
		TokenManager.setVal2Session("menuFlag", "ask");//菜单选中判断
		return mv;
	}
	/**
	 * 删除问题
	 * @return
	 */
	@RequestMapping(value="/deleteQuestion")
	public ModelAndView deleteQuestion(Long id){
		ModelAndView mv = new ModelAndView("redirect:listAsk");
		Question question = new Question();
		question.setId(id);
		question.setDel_flag("1");
		reviewService.updateQuestion(question);
		TokenManager.setVal2Session("menuFlag", "question");//菜单选中判断
		return mv;
	}
}