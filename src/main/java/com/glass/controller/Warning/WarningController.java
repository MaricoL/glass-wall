package com.glass.controller.Warning;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.Accelation;
import com.glass.service.sensor.IAngleService;
import com.glass.util.PageBean;

//import com.glass.util.PageBean;

@Controller
@RequestMapping("/Warning")
public class WarningController {

	@Autowired
	private IAngleService angleService;
	
	
	/**
	 * 倾斜角预警列表
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping("/Warninglist")
	public String WarningListPage(Angle entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
//		PageBean<Accelation> pageBean = angleService.getAngleList(entity, currentPage, 10);
//		
//		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "Warning/WarningList";
	}
	
}
