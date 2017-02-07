package com.mit.common.timer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.omg.CosNaming.IstringHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mit.centerInfo.service.CenterInfoService;
import com.mit.common.model.CenterInfo;
import com.mit.common.model.Station;
import com.mit.information.service.StationService;
import com.mit.order.bo.UploadInfo;
import com.mit.order.service.OrderService;

/**  
 * @ClassName: ToTimer  
 * @Description: 定时任务，扫描刷卡记录，更改工单状态
 * @author 刘鹏飞
 * @date 2016-9-23 下午1:52:10  
 *    
 */
@Component
public class ToTimer {

	@Resource
	CenterInfoService centerInfoService;
	@Resource
	StationService stationService;
	@Resource
	OrderService orderService;

	@Scheduled(cron = "0 0/5 * * * ? ")
	public void run() {
		/**
		 * 查询通讯数据，变更工单状态
		 */
		//获取所有钣喷中心
		List<CenterInfo> centerInfos = centerInfoService.ListCenterInfo(null);
		for (CenterInfo centerInfo : centerInfos) {
			//获取该本喷中心所有工位信息
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("findCenterId", centerInfo.getId());
			List<Station> stations = stationService.ListStation(map);
			for (Station station : stations) {
				//查找该设备下的刷卡记录
				String staNo = station.getEquipment_id();
				if (null != staNo && !"".equals(staNo)) {
					//查找该车位上传的数据
					HashMap<String, Object> infoMap = new HashMap<String, Object>();
					infoMap.put("serial", staNo);
					List<UploadInfo> uploadInfos = orderService.getUploadInfos(infoMap);
					HashSet<UploadInfo> set = new HashSet<UploadInfo>(uploadInfos);//去重后
					//取最新的5条数据，得到重复数量最多的一条，作为准确数据
					int j = 0;
					Map<String, Object> upMap = new HashMap<String, Object>();
					List<UploadInfo> infos = new ArrayList<UploadInfo>();
					for (UploadInfo uploadInfo : set) {
						int i = 0;
						for (UploadInfo ui : uploadInfos) {
							if(uploadInfo.getLc_number().equals(ui.getLc_number())){
								i++;
							}
						}
						upMap.put(String.valueOf(i), uploadInfos.get(j));
						j++;
					}
					Iterator it = upMap.keySet().iterator();
					int max = 0;
					while (it.hasNext()) {
						Object key = it.next();
						int i = Integer.parseInt(key.toString());
						if(max < i){
							max = i;
						}
					}
					System.out.println(max);
				}
			}
		}
	}
}
