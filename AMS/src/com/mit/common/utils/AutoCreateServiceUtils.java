package com.mit.common.utils;

import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AutoCreateServiceUtils {

	//参数部分 指定Dao名，指定service名
	private static final String DaoName="ManagerMapper";
	private static final String ParkName="manager";
	private static final String ServiceName="Manager";
	private static final String ControllerName="Manager";
	//公共部分
	private static final String RT_1 = "\r\n";
	private static final String RT_2 = RT_1+RT_1;
	private static final String BLANK_1 =" ";
	
	
	//注释部分
	private static final String ANNOTATION_AUTHOR_PARAMTER = "@author ";
	private static final String ANNOTATION_AUTHOR_NAME = "yejianming";
	private static final String ANNOTATION_AUTHOR = ANNOTATION_AUTHOR_PARAMTER + ANNOTATION_AUTHOR_NAME;
	private static final String ANNOTATION_DATE = "@date ";
	private static final String ANNOTATION = "/**"+RT_1+BLANK_1+"*"+BLANK_1+ANNOTATION_AUTHOR +RT_1+BLANK_1+"*"+BLANK_1+ANNOTATION_DATE +getDate()+RT_1+BLANK_1+"*/"+RT_1;
	

	
	
	//包名
	private static final String BEAN_URL = "com.mit."+ParkName;
	private static final String DAO_URL = "com.mit.common.dao";
	private static final String SERVICE_URL = BEAN_URL+".service";
	private static final String SERVICE_IMPL_URL = BEAN_URL+".service.impl";
	private static final String CONTROLLER_URL = BEAN_URL+".controller";
	
	
	/**
	 * 创建bean的Dao<br>
	 * 
	 * @param c
	 * @throws Exception
	 */
	public void createBeanDao(String DaoName) throws Exception {
		String fileName = System.getProperty("user.dir") + "/src/" + DAO_URL.replace(".", "/")
				+ "/" + DaoName + ".java";
		File f = new File(fileName);
		 if (!f.isFile())  
	        {  
	            File pf = f.getParentFile();  
	            if (!pf.isDirectory())  
	            {  
	                pf.mkdirs();  
	            }  
	            StringBuffer sb = new StringBuffer();  
	            sb.append("package " + DAO_URL + ";" + RT_2);  
	          //  sb.append("import " + DAO_URL+"."+DaoName+";" + RT_1);// 导入实体类  

	            sb.append(RT_2 + ANNOTATION);  
	            sb.append("public interface " + DaoName + " ");  
	            sb.append("{" + RT_2 + "}");  
	            FileWriter fw = new FileWriter(f, false);  
	            fw.write(sb.toString());  
	            fw.flush();  
	            fw.close();  
	        }  		
		   showInfo(fileName);
	}

	 /**
     * 创建bean的service
     * @param c
     * @throws Exception
     */
    public void createBeanService(String ServiceName) throws Exception{
		String fileName = System.getProperty("user.dir") + "/src/" +SERVICE_URL.replace(".", "/")+"/"+ServiceName+"Service.java" ;
		File f = new File(fileName);
		   if (!f.isFile())  
	        {  
	            File pf = f.getParentFile();  
	            if (!pf.isDirectory())  
	            {  
	                pf.mkdirs();  
	            }  
	            StringBuffer sb = new StringBuffer();  
	            sb.append("package " + SERVICE_URL + ";" + RT_2);  
	            sb.append(RT_2 + ANNOTATION);  
	            sb.append("public interface " + ServiceName + "Service ");  
	            sb.append("{" + RT_2 + "}");  
	            FileWriter fw = new FileWriter(f, false);  
	            fw.write(sb.toString());  
	            fw.flush();  
	            fw.close();  
	            showInfo(fileName);
	        }  
		
    }
    /**
     * 创建bean的service的实现类
     * @param c
     * @throws Exception
     */
    public void createBeanServiceImpl(String ServiceName) throws Exception{
    	  String fileName = System.getProperty("user.dir") + "/src/"  
          + SERVICE_IMPL_URL.replace(".", "/") + "/" + ServiceName + "ServiceImpl.java";  
    	  File f = new File(fileName);
    	   if (!f.isFile())  
	        {  
	            File pf = f.getParentFile();  
	            if (!pf.isDirectory())  
	            {  
	                pf.mkdirs();  
	            }  
	            StringBuffer sb = new StringBuffer();  
	            sb.append("package " + SERVICE_IMPL_URL  + ";" + RT_2);  
	            sb.append("import org.springframework.beans.factory.annotation.Autowired;"+RT_1);  
	            sb.append("import org.springframework.stereotype.Service;"+RT_1);  
	            sb.append("import com.mit.core.mybatis.BaseMybatisDao;"+RT_1);  
	            sb.append("import " + SERVICE_URL + "." + ServiceName  
	                    + "Service;" + RT_1);// 导入父impl  
	            sb.append("import "+DAO_URL+"."+DaoName+";"+RT_1);  
	            sb.append(RT_2 + ANNOTATION);  
	            sb.append(RT_1 + "@Service"+RT_1);  
	            
	            sb.append("public class " + ServiceName + "ServiceImpl ");  
	            sb.append("extends  BaseMybatisDao" + "<" + DaoName + "> ");  
	            sb.append("implements " + ServiceName + "Service");  
	            sb.append("{" +RT_1+"@Autowired"+RT_1+ DaoName +BLANK_1 +getLowercaseChar(DaoName)+";"+RT_1+RT_2 + "}");  
	            FileWriter fw = new FileWriter(f, false);  
	            fw.write(sb.toString());  
	            fw.flush();  
	            fw.close();  
	            showInfo(fileName);
	        }  
	  
		
    }
    public  void createBeanController(String ControllerName)  
    throws Exception  
{  

String fileName = System.getProperty("user.dir") + "/src/"  
        + CONTROLLER_URL.replace(".", "/") 
        + "/" + ControllerName + "Controller.java";  
File f = new File(fileName);  
if (!f.isFile() )  
{  
    File pf = f.getParentFile();  
    if (!pf.isDirectory())  
    {  
        pf.mkdirs();  
    }  
    StringBuffer sb = new StringBuffer();  
    sb.append("package " + CONTROLLER_URL  + ";" + RT_2);  
    sb.append("import org.springframework.beans.factory.annotation.Autowired ;" + RT_1);
    sb.append("import org.springframework.context.annotation.Scope;"+RT_1);  
    sb.append("import org.springframework.stereotype.Controller;"+RT_1);  
    sb.append("import org.springframework.web.bind.annotation.RequestMapping;"+RT_1);  
    sb.append("import org.springframework.web.bind.annotation.RequestMethod;"+RT_1);  
    sb.append("import org.springframework.web.bind.annotation.ResponseBody;"+RT_1);  
    sb.append("import org.springframework.web.servlet.ModelAndView;"  
            + RT_1);  
    sb.append("import com.mit.common.controller.BaseController;"+RT_1);  
    sb.append("import " + SERVICE_URL + "." + ServiceName  
            + "Service;" + RT_1);// 导入父impl  
    sb.append(RT_2 + ANNOTATION);//注释  
    sb.append(RT_1 + "@Controller"+RT_1);  
    sb.append("@Scope(value=\"prototype\")"+RT_1);  
    sb.append("@RequestMapping(\""+getLowercaseChar(ControllerName)+"\")"+RT_1);  
    sb.append("public class " + ControllerName + "Controller "+BLANK_1);  
    sb.append("extends BaseController");  
    sb.append("{" + RT_2);  
    sb.append(RT_1+"@Autowired"+RT_1);
    sb.append(RT_1+ServiceName+"Service"+BLANK_1+getLowercaseChar(ServiceName)+"Service;"+RT_1);
    sb.append(RT_2+"}");  
    FileWriter fw = new FileWriter(f, false);  
    fw.write(sb.toString());  
    fw.flush();  
    fw.close();  
    showInfo(fileName); 
}  
}  

  
	/**
	 * 显示信息
	 * @param info
	 */
	public void showInfo(String info){
		System.out.println("创建文件："+ info+ "成功！");
	}
	public  String getLowercaseChar(String str){
		return str.substring(0,1).toLowerCase()+str.substring(1);
	}

	
	/**
	 * 获取系统时间
	 * @return
	 */
	public static String getDate(){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return simpleDateFormat.format(new Date());
	}
	public static void main(String[] args) throws Exception{
		AutoCreateServiceUtils beanUtils = new AutoCreateServiceUtils();
		// beanUtils.createBeanDao(DaoName);
		beanUtils.createBeanService(ServiceName);
		beanUtils.createBeanServiceImpl(ServiceName);
		beanUtils.createBeanController(ControllerName);
	}
	
}
