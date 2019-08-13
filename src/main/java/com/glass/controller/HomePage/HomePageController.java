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
		model.addAttribute("sensorNameList", Arrays.asList("7a64", "7b28", "7f72"));

		return "HomePage/SensorStatistics";
	}

	@RequestMapping("/Index2")
	public String Index2(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "Three/test";
	}

	@RequestMapping("/Index3")
	public String Index3(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "Three/NewFile2";
	}

	@RequestMapping("/Index4")
	public String Index4(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "Three/NewFile";
	}

	@RequestMapping("/Index6")
	public String Index6(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "Three/NewFile6";
	}

	@RequestMapping("/Index7")
	public String Index7(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "Three/NewFile7";
	}

	@RequestMapping("/Index8")
	public String Index8(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "Three/NewFile8";
	}

	@RequestMapping("/Show")
	public String Show(HttpServletRequest request, Model model) {
		// TODO：获取传感器编号
		model.addAttribute("sensorNameList", Arrays.asList("7a64", "7b28", "7f72"));
		return "HomePage/Show";
	}

}
