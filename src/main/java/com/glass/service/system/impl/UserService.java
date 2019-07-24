package com.glass.service.system.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.glass.dao.system.UserDao;
import com.glass.service.system.IUserService;
import com.glass.entity.system.SysUser;
import com.glass.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service("userService")
@Transactional
public class UserService implements IUserService {
	
	@Autowired
	private UserDao userDao;
	


	@Override
	public PageBean<SysUser> getUsersByCondition(SysUser entity, Integer currentPage, Integer pageSize) {
		//固定的加载项
		Page<SysUser> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<SysUser> allUsers = userDao.getUsersByConditions(entity);
		
		PageBean<SysUser> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allUsers);
		
		return pageBean;
	}

	@Override
	public void addUser(SysUser entity) {
		userDao.addUser(entity);
	}

	@Override
	public void updateUser(SysUser entity) {
		userDao.updateUser(entity);
	}

	@Override
	public SysUser getUserById(Integer id) {
		return userDao.getUserById(id);
	}

	@Override
	public SysUser getUserByAccount(String account) {
		return userDao.getUserByAccount(account);
	}

	




	

	
	@Override
	
	public void delUser(Integer userId) {
		userDao.delUser(userId);
	}

	@Override
	public List<SysUser> getAllUsers() {
		return userDao.getUsersByConditions(null);
	}
}
