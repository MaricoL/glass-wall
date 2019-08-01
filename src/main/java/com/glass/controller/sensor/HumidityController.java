package com.glass.controller.sensor;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.glass.entity.sensor.Humidity;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Temperture;
import com.glass.service.sensor.IHumidityService;
import com.glass.service.sensor.ITempertureService;
import com.glass.util.PageBean;

//import com.glass.util.PageBean;

@Controller
@RequestMapping("/humidity")
public class HumidityController {
	
	@Autowired
	private IHumidityService humidityService;
	
	@RequestMapping("/_list")
	public String sensorHumidityListPage(Humidity entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Humidity> pageBean = humidityService.getSensorHumidityist(entity, currentPage, 10);
		
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "sensor/sensorHumidityManage";
	}

	@RequestMapping("/countManage")
	public String humidityCountManage(String name, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<StatisticalManagement> pageBean = humidityService.getHumidityCountManage(name, currentPage, 10);
		map.put("pageBean", pageBean);
		map.put("name", name);
		return "sensor/humidityCountManage";
	}
}
