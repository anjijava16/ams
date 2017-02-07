/**    
* @Title: JYconfig.java  
* @Package com.mit.core.config  
* @Description: 精友账户、密码、接口配置文件
* @author 刘鹏飞
* @date 2017-2-3 上午9:54:27  
* @version V1.0    
*/
package com.mit.core.config;

/**  
 * @ClassName: JYconfig  
 * @Description: 精友账户、密码、接口配置文件
 * @author 刘鹏飞
 * @date 2017-2-3 上午9:54:27  
 *    
 */
public class JYconfig {

	//接口地址
	public final static String API_URL="http://www.jy-epc.com/api-show/NqAfterMarketDataServlet";
	//账号
	public final static String USERNAME="lining@mitgroup.com.cn";
	//密码
	public final static String PASSWORD="e0b6ea7569ef1127a188dea1cda61fd7";
	/** 请求代码  **/
	public final static String GET_CARS = "100101"; //VIN查询车型
	public final static String GET_BRANDS = "100401"; //查询品牌
	public final static String GET_FAMILY = "100402"; //查询车系
	public final static String GET_GROUP = "100403"; //查询车组
	public final static String GET_TYPE = "100404"; //查询车组
	public final static String GET_PARTS = "200101"; //车型+精友8位码查询配件
	public final static String GET_PARTS_DETAIL = "200106"; //车型+OE号查询配件详情
	public final static String GET_HOURS = "400101"; //车型+零件号查询工时
}
