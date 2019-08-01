package com.glass.controller.sensor;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Temperture;
import com.glass.service.sensor.IAccelationService;
import com.glass.service.sensor.ITempertureService;
import com.glass.util.PageBean;

//import com.glass.util.PageBean;

@Controller
@RequestMapping("/temperature")
public class TempertureController {
	
	@Autowired
	private ITempertureService tempertureService;
	
	@RequestMapping("/_list")
	public String sensorAngleListPage(Temperture entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Temperture> pageBean = tempertureService.getSensorTempertureList(entity, currentPage, 10);
		
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "sensor/sensorTempertureManage";
	}

	@RequestMapping("/countManage")
	public String tempertureCountManage(String name, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<StatisticalManagement> pageBean = tempertureService.getTempertureCountManage(name, currentPage, 10);
		map.put("pageBean", pageBean);
		map.put("name", name);
		return "sensor/temperatureCountManage";
	}
}
