package com.glass.controller.sensor;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.glass.entity.sensor.Breakdown;
import com.glass.entity.sensor.SensorBase;
import com.glass.service.sensor.IBreakdownService;
import com.glass.service.sensor.ISensorBaseService;
import com.glass.util.PageBean;

@Controller
@RequestMapping("/breakdown")
public class BreakdownController {
	@Autowired
	private IBreakdownService breakdownService;
	@Autowired
	private ISensorBaseService sensorBaseService;
	
	@RequestMapping("/_list")
	public String breakdownListPage(Breakdown entity, Integer currentPage, Map<String,Object> map, HttpServletRequest request) {
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Breakdown> pageBean = breakdownService.getBreakdownList(entity, currentPage, 10);
		List<SensorBase> namelist = sensorBaseService.getByType(1);
		map.put("namelist", namelist);
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "sensor/sensorBreakdownManage";
	}
}
