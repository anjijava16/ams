/**    
* @Title: UploadInfo.java  
* @Package com.mit.order.bo  
* @Description: TODO(用一句话描述该文件做什么)  
* @author 刘鹏飞
* @date 2016-12-30 上午8:28:23  
* @version V1.0    
*/
package com.mit.order.bo;

import org.springframework.format.annotation.DateTimeFormat;

/**  
 * @ClassName: UploadInfo  
 * @Description: 监测设备上报信息
 * @author 刘鹏飞
 * @date 2016-12-30 上午8:28:23  
 *    
 */
public class UploadInfo {
	
	private Long info_id;
	private String lc_serial;
	private String flag;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private String upload_time;
	private String lc_number;
	private String read_flag;
	public Long getInfo_id() {
		return info_id;
	}
	public void setInfo_id(Long info_id) {
		this.info_id = info_id;
	}
	public String getLc_serial() {
		return lc_serial;
	}
	public void setLc_serial(String lc_serial) {
		this.lc_serial = lc_serial;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(String upload_time) {
		this.upload_time = upload_time;
	}
	public String getLc_number() {
		return lc_number;
	}
	public void setLc_number(String lc_number) {
		this.lc_number = lc_number;
	}
	public String getRead_flag() {
		return read_flag;
	}
	public void setRead_flag(String read_flag) {
		this.read_flag = read_flag;
	}
	
	
}
