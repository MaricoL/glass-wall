package com.glass.controller.system;

import com.glass.entity.system.SysUser;
import com.glass.service.system.IUserService;
import com.glass.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 对用户表的增删该查操作。
 * @author sht
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService userService;


	@RequestMapping("/_list")
	public String userlistPage(SysUser entity, Integer currentPage, Map<String,Object> map, HttpServletRequest request) {
		if(currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<SysUser> pageBean = userService.getUsersByCondition(entity, currentPage, 10);
		map.put("pageBean", pageBean);
		map.put("searchurl", request.getContextPath()+"/user/_list");
		map.put("user", entity);
		return "system/userList";
	}
	
	
	@GetMapping("/getname")
	@ResponseBody
	public String getname(String name, HttpServletRequest request) {
		
		return name;
	}
	
	/**
	 * 验证账号唯一
	 * 新增
	 * 编辑
	 * @param entity
	 * @return
	 */
	private boolean vaildateAccountUnique(SysUser entity) {
		boolean result = true;
		if(entity.getId() != null) {
			SysUser oldUser = userService.getUserById(entity.getId());
			if(!oldUser.getAccount().equals(entity.getAccount())) {
				SysUser temp = userService.getUserByAccount(entity.getAccount());
				if(temp != null) {
					result = false;
				}
			}
		}else {
			SysUser temp = userService.getUserByAccount(entity.getAccount());
			if(temp != null) {
				result = false;
			}
		}
		return result;
	}
	

	
}
