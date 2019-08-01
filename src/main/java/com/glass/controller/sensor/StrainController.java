package com.glass.controller.sensor;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glass.common.Common;
import com.glass.entity.check.SysExamine;
import com.glass.entity.hr.HrTotalnumberInfo;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Strain;
import com.glass.entity.system.SysBase;
import com.glass.entity.system.SysUser;
import com.glass.service.check.IExamineService;

import com.glass.service.sensor.IAccelationService;
import com.glass.service.sensor.IStrainService;
import com.glass.util.PageBean;

//import com.glass.util.PageBean;

@Controller
@RequestMapping("/strain")
public class StrainController {
	
	@Autowired
	private IStrainService strainService;
	
	@RequestMapping("/_list")
	public String sensorAngleListPage(Strain entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Strain> pageBean = strainService.getSensorStrainList(entity, currentPage, 10);
		
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "sensor/sensorStrainManage";
	}
	
	@RequestMapping("/countManage")
	public String strainCountManage(String name, Integer currentPage, Map<String, Object> map,HttpServletRequest request){
		//HttpSession session = request.getSession();
		//List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		//entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<StatisticalManagement> pageBean = strainService.getStrainCountManage(name, currentPage, 10);
		map.put("pageBean", pageBean);
		map.put("name", name);
		return "sensor/strainCountManage";
	}
	
}
