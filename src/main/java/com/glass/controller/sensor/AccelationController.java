package com.glass.controller.sensor;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
import com.glass.service.sensor.IAccelationService;
import com.glass.util.PageBean;

//import com.glass.util.PageBean;

@Controller
@RequestMapping("/accelation")
public class AccelationController {
	
	@Autowired
	private IAccelationService accrelationService;
	
	@RequestMapping("/_list")
	public String sensorAngleListPage(Accelation entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Accelation> pageBean = accrelationService.getSensorAccelationList(entity, currentPage, 10);
		
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "sensor/sensorAccelationManage";
	}
	
	
	
	@RequestMapping("/countManage")
	public String accrelationServiceCountManage(Accelation entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		List<Object> list = accrelationService.getAccrelationCountManage(entity, currentPage, 10);
		map.put("list", list);
		map.put("conditionEntity", entity);
		return "sensor/accelationCountManage";
	}

	
}
