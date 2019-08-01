package com.glass.controller.HomePage;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.glass.entity.system.SysUser;

@Controller
@RequestMapping("/HomePage")
public class HomePageController {

	/**
	 * 首页
	 * 
	 * @return
	 */
	@RequestMapping("/Index")
	public String Index(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "HomePage/Index";
	}

	/**
	 * 预警处理统计
	 * 
	 * @return
	 */
	@RequestMapping("/EarlyWarningStatistics")
	public String EarlyWarningStatistics(HttpServletRequest request) {

		return "HomePage/EarlyWarningStatistics";
	}

	/**
	 * 预警处理统计
	 * 
	 * @return
	 */
	@RequestMapping("/SensorStatistics")
	public String SensorStatistics(HttpServletRequest request, Model model) {
		// TODO：获取传感器编号
		model.addAttribute("sensorNameList", Arrays.asList("7a64", "7465", "7250", "6a3a"));

		return "HomePage/SensorStatistics";
	}

}
