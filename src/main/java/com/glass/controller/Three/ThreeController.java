package com.glass.controller.Three;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.glass.entity.system.SysUser;

@Controller
@RequestMapping("/Three")

public class ThreeController {

	/**
	 * 3D模型
	 * 
	 * @return
	 */
	
	
	
	@RequestMapping("/ShowModel")
	public String ShowModel(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "Three/ShowModel";
	}
	
	@RequestMapping("/ThreeTwo")
	public String ThreeTwo(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		SysUser user = (SysUser) session.getAttribute("userSession");
		return "Three/ThreeTwo";
	}
}
