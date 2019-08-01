package com.glass.controller.sensor;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Accelation;
import com.glass.service.sensor.IAngleService;
import com.glass.util.PageBean;

//import com.glass.util.PageBean;

@Controller
@RequestMapping("/angle")
public class AngleController {
	
	@Autowired
	private IAngleService angleService;
	
	@RequestMapping("/_list")
	public String sensorAccelationListPage(Angle entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Angle> pageBean = angleService.getAngleList(entity, currentPage, 10);
		
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "sensor/sensorAngleManage";
	}
	
	@RequestMapping("/countManage")
	public String angleCountManage(String name, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<StatisticalManagement> pageBean = angleService.getAngleCountManage(name, currentPage, 10);
		map.put("pageBean", pageBean);
		map.put("name", name);
		return "sensor/angleCountManage";
	}
	
}
