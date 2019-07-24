package com.glass.controller.system;


import com.glass.service.system.IUserService;
import com.glass.entity.system.SysUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 系统登录，退出等功能
 * @author sht
 *
 */
@Controller
@Slf4j
public class LoginController {
	
	@Autowired
	private IUserService userService;
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/")
	public String tologinPage() {
		return "login";
	}
	
	/**
	 * 登录验证
	 * @param account
	 * @param password
	 * @return
	 */
	@RequestMapping("/validateLogin")
	@ResponseBody
	@SuppressWarnings(value={"rawtypes","unchecked"})
	public String validateLogin(String account,String password,HttpServletRequest request) {
		//验证是否能登录；生成session
		HttpSession session = request.getSession();
		String result = "fail";
		SysUser user = userService.getUserByAccount(account);
		if(user != null && password.equals(user.getPassword())) {
			result = "success";
			session.setAttribute("userSession", user);
		}
		return result;
	}

	
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping("/exit")
	public String exit(HttpServletRequest request) {
		//清除session;跳转到登录页面
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "index";
	}
	
	
	@RequestMapping("/workbench")
	public String workbench(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "workbench";
	}

	@RequestMapping("/templateLibrary")
	public String templateLibrary(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "templateLibrary";
	}
	
	@RequestMapping("/commandCenter")
	public String commandCenter(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "commandCenter";
	}
	
}
