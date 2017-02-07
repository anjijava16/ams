package com.mit.common.utils;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;
 
import org.springframework.util.StringUtils;
 
import com.alibaba.fastjson.JSONObject;
import com.mit.core.config.JYconfig;
 
/**
 * @ClassName: ApiDataUtil  
 * @Description: 通过接口获取数据工具类
 * @author zhangzhengping 
 * @date 2016年2月28日 下午6:08:32
 */
public class ApiDataUtil {
	
	/**
	 * @Title: getData 调用API接口获取数据
	 * @param jyUrl
	 * @param jsonByteData
	 * @throws Exception  
	 * @createDate 2016年2月22日;上午9:31:01
	 */
	public static  String sendData(String url, byte[] jsonByteData) throws Exception{
        //接口访问地址
		String SERVER_URL = url;
		/**开启连接*/
		URL uploadServlet = new URL(SERVER_URL);
		URLConnection uc = uploadServlet.openConnection();
		/**如果为 true，则只要有条件就允许协议使用缓存。*/
		uc.setUseCaches(false);
		/**URL 连接可用于输入和/或输出。将 doOutput 标志设置为 true，指示应用程序要将数据写入 URL 连接。*/
		uc.setDoOutput(true);
		/**URL 连接可用于输入和/或输出。将 doInput 标志设置为 true，指示应用程序要从 URL 连接读取数据。*/
		uc.setDoInput(true);
		/**开启流，写入json数据*/
		/* 设置Content-Type头部指示指定URL已编码数据的窗体MIME类型*/
		int l = jsonByteData.length;
		uc.setRequestProperty("Content-Length", "" + l);
		/* 设置字符编码*/
//		uc.setRequestProperty("Accept-Charset", "GBK");
		
		/**提取连接的适当的类型*/
		HttpURLConnection hc = (HttpURLConnection) uc;
		/** 把HTTP请求方法设置为POST（默认的是GET）*/
		hc.setRequestMethod("POST");
		/**将数据流发给客户端，通过连接得到输出流*/
		BufferedOutputStream output = new BufferedOutputStream(uc.getOutputStream());
		/**把数据写进输出流里,发送数据*/
		output.write(jsonByteData, 0, l);
		output.flush();
		output.close();
		try {
			/**根据连接，开启输入流*/
			InputStreamReader insreader = new InputStreamReader(uc.getInputStream(), "UTF-8");
			BufferedReader bin = new BufferedReader(insreader);
			StringBuffer sb = new StringBuffer();
			String line;
			/**按行读取返回的文件流*/
			while ((line = bin.readLine()) != null) {
				sb.append(line);
			}
			bin.close();
			insreader.close();
			/**（7）返回的json*/
			String reJson = sb.toString();
			System.out.println("--------------接收的数据start------------");
			System.out.println(reJson);
			System.out.println("--------------接收的数据end--------------");
			return reJson;
		} catch (Exception e) {
			System.out.println("数据已经发送，但没有返回结果！");
			e.printStackTrace();
			throw e;
		}
	}
	
	
	/**
	 * @Title: getRequireParams 通过请求类型代码设置请求头信息
	 * @param username 接口调用账号
	 * @param password 接口调用密码
	 * @param requestCode 接口编码
	 * @param map 接口请求参数
	 * @createDate 2016年2月22日;上午9:49:40
	 * @author 
	 */
	public static byte[] getRequireParams(String username,String password,String requestCode,Map map){
		//判断请求参数是否为空
		if(requestCode==null || "".equals(requestCode)|| map.isEmpty()){
			return null;
		}
		
		JSONObject head=new JSONObject();
		/** 创建body节点 */
		JSONObject body=new JSONObject();
		head.put("channelType", "00");//渠道 :00 测试 ,01 正式  TODO:上线后需要改为正式
		head.put("operatorCode",username);//账号
		head.put("operatorPwd", password);//密码
		head.put("dtype", "json");//返回格式，json或xml，默认json
		head.put("data", body);
		//设置请求编码
		head.put("requestCode", requestCode);
		//循环添加请求参数
	    for (Object key : map.keySet()) {
	    	 body.put(key.toString(), map.get(key));
		}
		return head.toString().getBytes();
	}
	
	
	/**
	 * @Title: getDate  
	 * @Description:调用接口获取数据的方法
	 * @param apiUrl 接口地址
	 * @param username 接口调用账号
	 * @param password 接口调用密码
	 * @param requestCode 接口编码
	 * @param map 接口请求参数
	 * @return
	 */
	public static String getData(String requestCode,Map map){
		String data="";
		if(StringUtils.isEmpty(JYconfig.API_URL)){
			return null;
		}
		//设置请求参数
		byte[] requireParams=getRequireParams(JYconfig.USERNAME,JYconfig.PASSWORD,requestCode, map);
		//判断请求参数是否为空
		if(requireParams!=null){
			try {
				data=sendData(JYconfig.API_URL, requireParams);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return data;
	}
	
	public static void main(String[] args) {
		//请求参数
		Map map = new HashMap();
		//map.put("vinCode", "LVSHCFDB2DE218686");
		//调用接口
		//String data=getData("100101",map);
		//示例代码
		/**
		 * {"error_code":"000000","reason":"请求成功！","result":{"vehicleList":[{"vehicleCode":"4028b28836dc92980136e248955e08bc","vehicleName":"福克斯CAF7163A4轿车","brandName":"长安福特","familyName":"福克斯","bodyType":"三厢","engineDesc":"1.6L","gearboxName":"双离合变速器","yearPattern":"2012","groupName":"福克斯三厢(12/04-)","cfgLevel":"舒适型","effluentStandard":"国四","pl":"1.596","engineModel":"长安福特C6","arrayType":"L4","valveNum":"4","fuelJetType":"汽油","drivenType":"前置前驱","gearNum":"6","wheelbase":"2648","doorNum":"四门","supplyOil":"电喷","inairform":"自然吸气"},{"vehicleCode":"4028b28836dc92980136e249399d08ce","vehicleName":"福克斯CAF7163A4轿车","brandName":"长安福特","familyName":"福克斯","bodyType":"三厢","engineDesc":"1.6L","gearboxName":"双离合变速器","yearPattern":"2012","groupName":"福克斯三厢(12/04-)","cfgLevel":"风尚型","effluentStandard":"国四","pl":"1.596","engineModel":"长安福特C6","arrayType":"L4","valveNum":"4","fuelJetType":"汽油","drivenType":"前置前驱","gearNum":"6","wheelbase":"2648","doorNum":"四门","supplyOil":"电喷","inairform":"自然吸气"},{"vehicleCode":"4028b28836dc92980136e249637b08d7","vehicleName":"福克斯CAF7163A4轿车","brandName":"长安福特","familyName":"福克斯","bodyType":"三厢","engineDesc":"1.6L","gearboxName":"双离合变速器","yearPattern":"2012","groupName":"福克斯三厢(12/04-)","cfgLevel":"尊贵型","effluentStandard":"国四","pl":"1.596","engineModel":"长安福特C6","arrayType":"L4","valveNum":"4","fuelJetType":"汽油","drivenType":"前置前驱","gearNum":"6","wheelbase":"2648","doorNum":"四门","supplyOil":"电喷","inairform":"自然吸气"}]}}
		 */
//		map.put("brandId", "J");
//		String data=getData("100401",map);
		/**
		 * {"error_code":"000000","reason":"请求成功！","result":{"brandList":[{"brandId":"5ea38e3a0dc1c163010dd3a79e1b1f7d","brandName":"吉奥"},{"brandId":"I0000000000000000200000000000366","brandName":"捷豹"},{"brandId":"402880ef0d5d9e8c010d620fc82e7fa8","brandName":"金杯"},{"brandId":"402880ef0d4a5670010d4d7ee13d2f67","brandName":"一汽吉林"},{"brandId":"402880ef0d35ed44010d3a0f767328ef","brandName":"江淮"},{"brandId":"402880ef0d4a5670010d4d888c6532db","brandName":"吉利"},{"brandId":"I0000000000000000200000000000415","brandName":"江铃"},{"brandId":"I0000000000000000200000000000416","brandName":"江南"},{"brandId":"I0000000000000000200000000000372","brandName":"吉普"},{"brandId":"402880861203d16701122d73e5c10082","brandName":"北京吉普"}]}}
		 * "brandId":"I0000000000000000200000000000366","brandName":"捷豹"
		 * "brandId":"402880ef0d4a5670010d4d888c6532db","brandName":"吉利"
		 */
//		map.put("brandId", "402880ef0d4a5670010d4d888c6532db");
//		String data=getData("100402",map);
		/**
		 * {"error_code":"000000","reason":"请求成功！","result":{"familyList":[{"familyId":"4028b2883b166e0f013b2c17acc035ac","familyName":"捷豹F-TYPE级"},{"familyId":"I0000000000000000210000000000251","familyName":"捷豹S-TYPE级"},{"familyId":"I0000000000000000210000000000252","familyName":"捷豹X-TYPE级"},{"familyId":"402880881b7158ea011b723b728000a9","familyName":"捷豹XF级"},{"familyId":"I0000000000000000210000000000746","familyName":"捷豹XJ级"},{"familyId":"I0000000000000000210000000000253","familyName":"捷豹XK级"}]}}
		 * {"error_code":"000000","reason":"请求成功！","result":{"familyList":[{"familyId":"40288088213da0a50121523771a406c3","familyName":"中国龙"},{"familyId":"I0000000000000000210000000000271","familyName":"优利欧"},{"familyId":"4028b2b64b5995f9014b5d898f1507d5","familyName":"博瑞GC9"},{"familyId":"4028b2b65282a8e701529b92cb0b11ca","familyName":"博越"},{"familyId":"4028b2884719471301477abbe2ec4ea3","familyName":"帝豪"},{"familyId":"402880881c229768011c4b4722072dc1","familyName":"熊猫"},{"familyId":"402880ef0d4a5670010d4d88f0ad32dc","familyName":"美人豹"},{"familyId":"402880ef0d5d9e8c010d62849165442b","familyName":"美日"},{"familyId":"402880ef0d4a5670010d4ded70c4565a","familyName":"自由舰"},{"familyId":"402880ef0d5d9e8c010d61ec5bb266b9","familyName":"豪情"},{"familyId":"4028b2b6485a19440148a1ae3584555a","familyName":"豪情(GX9/X9)"},{"familyId":"I0000000000000000210000000000275","familyName":"远景"},{"familyId":"40288086119bd32d01119c69f3850058","familyName":"金刚"},{"familyId":"402880881b7158ea011b72f8c32900b7","familyName":"金鹰"}]}}
		 * "familyId":"4028b2883b166e0f013b2c17acc035ac","familyName":"捷豹F-TYPE级"
		 * "familyId":"4028b2884719471301477abbe2ec4ea3","familyName":"帝豪"
		 */
//		map.put("familyId", "4028b2884719471301477abbe2ec4ea3");
//		String data=getData("100403",map);
		/**
		 * {"error_code":"000000","reason":"请求成功！","result":{"groupList":[{"groupId":"4028b2883b166e0f013b2c1883e735b0","groupName":"捷豹F-TYPE(12/11-)"}]}}
		 * {"error_code":"000000","reason":"请求成功！","result":{"groupList":[{"groupId":"4028b2884719471301477abd54014ea6","groupName":"帝豪三厢(14/07-)"},{"groupId":"4028b2884719471301477abcc3b74ea5","groupName":"帝豪两厢(14/07-)"}]}}
		 * "groupId":"4028b2883b166e0f013b2c1883e735b0","groupName":"捷豹F-TYPE(12/11-)"}
		 * "groupId":"4028b2884719471301477abd54014ea6","groupName":"帝豪三厢(14/07-)"
		 */
		map.put("groupId", "4028b2884719471301477abd54014ea6");
		String data=getData("100404",map);
		/**
		 * {"error_code":"000000","reason":"请求成功！","result":{"vehicleList":[{"vehicleCode":"4028b2883b166e0f013b2c193cc735b3","vehicleName":"捷豹JAGUAR F-TYPE 3.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"3.0T","gearboxName":"手自一体","yearPattern":"2013","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201211","purchasePrice":"748000","purchasePriceTax":"811900","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b2883b166e0f013b2c1e267735f3","vehicleName":"捷豹JAGUAR F-TYPE S 5.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"5.0T","gearboxName":"手自一体","yearPattern":"2013","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201211","purchasePrice":"1417500","purchasePriceTax":"1538700","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b2b653c77fc4015456e094c04fce","vehicleName":"捷豹JAGUAR F-TYPE S COUPE 3.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"3.0T","gearboxName":"手自一体","yearPattern":"2016","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201604","cfgLevel":"英伦风尚特别版","purchasePrice":"1008000","purchasePriceTax":"1094200","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b2883b166e0f013b2c1caf7735ca","vehicleName":"捷豹JAGUAR F-TYPE S 3.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"3.0T","gearboxName":"手自一体","yearPattern":"2013","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201211","purchasePrice":"908000","purchasePriceTax":"985600","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b288453ef2bf01458c5066246b86","vehicleName":"捷豹JAGUAR F-TYPE COUPE 3.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"3.0T","gearboxName":"手自一体","yearPattern":"2014","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201404","purchasePrice":"670000","purchasePriceTax":"727300","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b288453ef2bf01458c508b026b93","vehicleName":"捷豹JAGUAR F-TYPE S COUPE 3.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"3.0T","gearboxName":"手自一体","yearPattern":"2014","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201404","purchasePrice":"868000","purchasePriceTax":"942200","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b288453ef2bf01458c50aa516b9e","vehicleName":"捷豹JAGUAR F-TYPE R COUPE 5.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"5.0T","gearboxName":"手自一体","yearPattern":"2014","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201404","purchasePrice":"1398000","purchasePriceTax":"1517500","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b2b653c77fc4015456e2b1184ff3","vehicleName":"捷豹JAGUAR F-TYPE SVR COUPE 5.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"5.0T","gearboxName":"手自一体","yearPattern":"2016","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201604","purchasePrice":"1888000","purchasePriceTax":"2049400","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b2b64cc1b989014cda8d0c260f57","vehicleName":"捷豹JAGUAR F-TYPE R COUPE 5.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"5.0T","gearboxName":"手自一体","yearPattern":"2015","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201504","purchasePrice":"1438000","purchasePriceTax":"1560900","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b2b64cc1b989014cda8fd8e30f65","vehicleName":"捷豹JAGUAR F-TYPE R 5.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"5.0T","gearboxName":"手自一体","yearPattern":"2015","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201504","purchasePrice":"1488000","purchasePriceTax":"1615200","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b2b64cc1b989014cda838cc10f3b","vehicleName":"捷豹JAGUAR F-TYPE S COUPE 3.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"3.0T","gearboxName":"手自一体","yearPattern":"2015","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201504","purchasePrice":"908000","purchasePriceTax":"985600","seat":"2","brandCode":"JBA0"},{"vehicleCode":"4028b2b64cc1b989014cda87c6aa0f4a","vehicleName":"捷豹JAGUAR F-TYPE S 3.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"3.0T","gearboxName":"手自一体","yearPattern":"2015","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201504","purchasePrice":"958000","purchasePriceTax":"1039900","seat":"2","brandCode":"JBA0"}]}}
		 * {"error_code":"000000","reason":"请求成功！","result":{"vehicleList":[{"vehicleCode":"4028b2b651622b2201517b9394671642","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2015","groupName":"帝豪三厢(14/07-)","marketDate":"201505","cfgLevel":"向上版","purchasePrice":"74800","purchasePriceTax":"79595","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcd6e06e4b1a","vehicleName":"吉利美日MR7152L09轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"向上版","purchasePrice":"73800","purchasePriceTax":"78531","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcd6fa214b23","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"向上版","purchasePrice":"73800","purchasePriceTax":"78531","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcda8ea44b2c","vehicleName":"吉利美日MR7152C01轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"CVT","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"豪华型","purchasePrice":"79800","purchasePriceTax":"84915","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcdaa3c34b34","vehicleName":"吉利美日MR7152C06轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"CVT","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"豪华型","purchasePrice":"79800","purchasePriceTax":"84915","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcdb9d894b3c","vehicleName":"吉利美日MR7152C01轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"CVT","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"向上版","purchasePrice":"84800","purchasePriceTax":"90236","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dce5a3e54b82","vehicleName":"吉利美日MR7132C01轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"尊贵型","purchasePrice":"94800","purchasePriceTax":"100877","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b651b4996e0151dce5c1be4b8d","vehicleName":"吉利美日MR7132C03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"尊贵型","purchasePrice":"94800","purchasePriceTax":"100877","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b651b4996e0151dcdbbe9f4b45","vehicleName":"吉利美日MR7152C06轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"CVT","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"向上版","purchasePrice":"84800","purchasePriceTax":"90236","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcd2cdcf4b00","vehicleName":"吉利美日MR7152L09轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"时尚型","purchasePrice":"63800","purchasePriceTax":"67890","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcd3b6014b05","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"时尚型","purchasePrice":"63800","purchasePriceTax":"67890","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcd56d5e4b0a","vehicleName":"吉利美日MR7152L09轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"豪华型","purchasePrice":"68800","purchasePriceTax":"73210","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dcd58af94b12","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"豪华型","purchasePrice":"68800","purchasePriceTax":"73210","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b651b4996e0151dce0540d4b4e","vehicleName":"吉利美日MR7132L03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"豪华型","purchasePrice":"76800","purchasePriceTax":"81723","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b651b4996e0151dce067764b56","vehicleName":"吉利美日MR7132L05轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"豪华型","purchasePrice":"76800","purchasePriceTax":"81723","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b651b4996e0151dce18c934b5e","vehicleName":"吉利美日MR7132L03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"向上版","purchasePrice":"81800","purchasePriceTax":"87044","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b651b4996e0151dce1a3e44b67","vehicleName":"吉利美日MR7132L05轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"向上版","purchasePrice":"81800","purchasePriceTax":"87044","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b651b4996e0151dce3bb364b70","vehicleName":"吉利美日MR7132C01轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"向上版","purchasePrice":"91800","purchasePriceTax":"97685","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b651b4996e0151dce45f884b79","vehicleName":"吉利美日MR7132C03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201512","cfgLevel":"向上版","purchasePrice":"91800","purchasePriceTax":"97685","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b28842e6dc8f014375e8550806eb","vehicleName":"吉利美日MR7132C01轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"精英型","purchasePrice":"89800","purchasePriceTax":"95556","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b28842e6dc8f0143749d591903ed","vehicleName":"吉利美日MR7152L09轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"精英型","purchasePrice":"71800","purchasePriceTax":"76403","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b28842e6dc8f014374952df80375","vehicleName":"吉利美日MR7152C01轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"CVT","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"精英型","purchasePrice":"82800","purchasePriceTax":"88108","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b649ccc817014adcab0e6a2f13","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"精英型","purchasePrice":"71800","purchasePriceTax":"76403","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b6494243cf0149509cf7ce0610","vehicleName":"吉利美日MR7132C03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"精英型","purchasePrice":"89800","purchasePriceTax":"95556","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b6494243cf0149509d151a0616","vehicleName":"吉利美日MR7132C03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"尊贵型","purchasePrice":"95800","purchasePriceTax":"101941","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b64b11406c014b2512f584142d","vehicleName":"吉利美日MR7152C06轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"CVT","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"精英型","purchasePrice":"82800","purchasePriceTax":"88108","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b64b11406c014b25098b7c140b","vehicleName":"吉利美日MR7132L05轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"精英型","purchasePrice":"79800","purchasePriceTax":"84915","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b6580065c40158192fd87f1153","vehicleName":"吉利美日MR7132L05轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2017","groupName":"帝豪三厢(14/07-)","marketDate":"201610","cfgLevel":"向上版","purchasePrice":"81800","purchasePriceTax":"87044","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b6580065c401581944af1f120f","vehicleName":"吉利美日MR7152C06轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"CVT","yearPattern":"2017","groupName":"帝豪三厢(14/07-)","marketDate":"201610","cfgLevel":"豪华型","purchasePrice":"79800","purchasePriceTax":"84915","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b6580065c40158194886951222","vehicleName":"吉利美日MR7152C06轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"CVT","yearPattern":"2017","groupName":"帝豪三厢(14/07-)","marketDate":"201610","cfgLevel":"向上版","purchasePrice":"84800","purchasePriceTax":"90236","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b6580065c401581937d2a0118a","vehicleName":"吉利美日MR7132C03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2017","groupName":"帝豪三厢(14/07-)","marketDate":"201610","cfgLevel":"向上版","purchasePrice":"91800","purchasePriceTax":"97685","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b6580065c40158193b5bc811ab","vehicleName":"吉利美日MR7132C03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2017","groupName":"帝豪三厢(14/07-)","marketDate":"201610","cfgLevel":"尊贵型","purchasePrice":"94800","purchasePriceTax":"100877","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b6580065c40158193eec8211c4","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2017","groupName":"帝豪三厢(14/07-)","marketDate":"201610","cfgLevel":"时尚型","purchasePrice":"63800","purchasePriceTax":"67890","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b6580065c4015819409f2411c9","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2017","groupName":"帝豪三厢(14/07-)","marketDate":"201610","cfgLevel":"豪华型","purchasePrice":"68800","purchasePriceTax":"73210","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b6580065c40158194188c911d9","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2017","groupName":"帝豪三厢(14/07-)","marketDate":"201610","cfgLevel":"向上版","purchasePrice":"73800","purchasePriceTax":"78531","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2b659a594d30159a61becb503c8","vehicleName":"吉利美日MR7184HEV混合动力轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.8L","gearboxName":"CVT","groupName":"帝豪三厢(14/07-)","cfgLevel":"精英型","purchasePrice":"108800","purchasePriceTax":"118100","seat":"5","brandCode":"JLA0","engineModel":"JLC-4G18"},{"vehicleCode":"4028b2b6471a96ec01477bf864ed4f71","vehicleName":"吉利美日MR7132C01轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"CVT","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"尊贵型","purchasePrice":"95800","purchasePriceTax":"101941","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b6471a96ec01477be7c3e84f46","vehicleName":"吉利美日MR7132L03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"尊贵型","purchasePrice":"85800","purchasePriceTax":"91300","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b6471a96ec01477bbe5f694dbd","vehicleName":"吉利美日MR7152L09轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"时尚型","purchasePrice":"64800","purchasePriceTax":"68954","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"},{"vehicleCode":"4028b2884719471301477bc178805513","vehicleName":"吉利美日MR7132L03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"精英型","purchasePrice":"79800","purchasePriceTax":"84915","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b6471a96ec01477be6afa94f3d","vehicleName":"吉利美日MR7132L03轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.3T","gearboxName":"手动档","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"时尚型","purchasePrice":"72800","purchasePriceTax":"77467","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLB-4G13T"},{"vehicleCode":"4028b2b656e089690156fd3125c918cb","vehicleName":"吉利美日MR7152L30M甲醇轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","groupName":"帝豪三厢(14/07-)","cfgLevel":"时尚型","purchasePrice":"74000","purchasePriceTax":"78744","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLC-4M15"},{"vehicleCode":"4028b2b6511a0cfd01511dbeface0b48","vehicleName":"吉利美日MR7002BEV03纯电动轿车","brandName":"吉利","familyName":"帝豪","gearboxName":"固定齿比","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201511","cfgLevel":"进取型","purchasePrice":"228800","purchasePriceTax":"228800","seat":"5","brandCode":"JLA0","engineModel":"精进电动TM5028"},{"vehicleCode":"4028b2b6511a0cfd01511dc41f550b6d","vehicleName":"吉利美日MR7002BEV03纯电动轿车","brandName":"吉利","familyName":"帝豪","gearboxName":"固定齿比","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201511","cfgLevel":"尊贵型","purchasePrice":"249800","purchasePriceTax":"249800","seat":"5","brandCode":"JLA0","engineModel":"精进电动TM5028"},{"vehicleCode":"4028b2b6511a0cfd01511dc23b530b5d","vehicleName":"吉利美日MR7002BEV03纯电动轿车","brandName":"吉利","familyName":"帝豪","gearboxName":"固定齿比","yearPattern":"2016","groupName":"帝豪三厢(14/07-)","marketDate":"201511","cfgLevel":"精英型","purchasePrice":"239800","purchasePriceTax":"239800","seat":"5","brandCode":"JLA0","engineModel":"精进电动TM5028"},{"vehicleCode":"4028b2b6504fed3801505ae72d8f0617","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2014","groupName":"帝豪三厢(14/07-)","marketDate":"201407","cfgLevel":"时尚型","purchasePrice":"64800","purchasePriceTax":"68954","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"}]}}
		 * "vehicleCode":"4028b2883b166e0f013b2c193cc735b3","vehicleName":"捷豹JAGUAR F-TYPE 3.0T跑车","brandName":"捷豹","familyName":"捷豹F-TYPE级","engineDesc":"3.0T","gearboxName":"手自一体","yearPattern":"2013","groupName":"捷豹F-TYPE(12/11-)","marketDate":"201211","purchasePrice":"748000","purchasePriceTax":"811900","seat":"2","brandCode":"JBA0"
		 * "vehicleCode":"4028b2b651622b2201517b9394671642","vehicleName":"吉利美日MR7152L21轿车","brandName":"吉利","familyName":"帝豪","engineDesc":"1.5L","gearboxName":"手动档","yearPattern":"2015","groupName":"帝豪三厢(14/07-)","marketDate":"201505","cfgLevel":"向上版","purchasePrice":"74800","purchasePriceTax":"79595","seat":"5","brandCode":"JLA0","engineModel":"浙江吉利JLγ-4G15"
		 */
	}
	
}