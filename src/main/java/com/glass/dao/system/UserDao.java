package com.glass.dao.system;

import com.glass.entity.system.SysUser;

import java.util.List;

public interface UserDao {
	
	/**
	 *  通过查询条件获取用户列表
	 * @param entity
	 * @return
	 */
	List<SysUser> getUsersByConditions(SysUser entity);
	
	/**
	 *  通过查询条件获取用户列表的总记录数
	 * @param entity
	 * @return
	 */
	int countUsersByConditions(SysUser entity);
	
	/**
	 *  添加用户
	 * @param entity
	 */
	void  addUser(SysUser entity);
	
	/**
	 *  修改用户
	 * @param entity
	 */
	void  updateUser(SysUser entity);
	
	/**
	 *  根据id查找用户
	 * @param id
	 * @return
	 */
	SysUser getUserById(Integer id);
	
	/**
	 *    通过账号查询用户
	 * @param account
	 * @return
	 */
	SysUser getUserByAccount(String account);
	
	/**
	 *   根据用户id获取菜单权限
	 * */
	List<String> getMenusByUserId(Integer userId);
	
	/**
	 *   根据用户id获取按钮权限
	 * */
	List<String> getButtonsByUserId(Integer userId);
	
	void delUser(Integer userId);
}
