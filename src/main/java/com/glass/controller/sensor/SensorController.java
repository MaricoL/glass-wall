package com.glass.controller.sensor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.glass.entity.sensor.Sensor;
import com.glass.service.sensor.ISensorService;
import com.glass.util.PageBean;

@Controller
@RequestMapping("/sensor")
public class SensorController {

	@Autowired
	private ISensorService sensorService;

	@RequestMapping("/_list")
	public String sensorListPage(Sensor sensor, Integer currentPage, Map<String, Object> map,
			HttpServletRequest request) {
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Sensor> pageBean = sensorService.getSensorList(sensor, currentPage, 10);

		map.put("pageBean", pageBean);
		map.put("conditionEntity", sensor);
		return "sensor/sensorManage";
	}

}
