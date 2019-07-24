package com.glass.service.system.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.system.SysBaseDao;
import com.glass.entity.system.SysBase;
import com.glass.entity.system.SysUser;
import com.glass.service.system.IBaseService;
import com.glass.util.PageBean;

@Service("baseService")
public class BaseService implements IBaseService{
	@Autowired
	private SysBaseDao sysBaseDao;
	
	@Override
	public List<SysBase> getByGroup(String group) {
		return sysBaseDao.getByGroup(group);
	}

	@Override
	public List<SysBase> getByGroupAndParentNum(String group, String parentNum) {
		return sysBaseDao.getByGroupAndParentNum(group,parentNum);
	}

	@Override
	public List<SysBase> getAlll() {
		return sysBaseDao.getAll();
	}
	
	
	@Override
	public PageBean<SysBase> getbaseByConditions(SysBase sysBase, Integer currentPage, Integer pageSize) {
		
		//固定的加载项
				Page<SysBase> page = PageHelper.startPage(currentPage, pageSize);
				//数据库查询数据
				List<SysBase> allBases = sysBaseDao.getbaseByConditions(sysBase);
				
				PageBean<SysBase> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
				
				pageBean.setItems(allBases);
				
				return pageBean;
	}
	
	@Override
	public SysBase getbaseById(Integer id) {
		
		return sysBaseDao.getbaseById(id);
	}
	
	@Override
	public void addSysBase(SysBase sysBase){
		sysBaseDao.addSysBase(sysBase);
	} 
	
	@Override
	public void updateSysbase(SysBase sysBase){
		sysBaseDao.updateSysbase(sysBase);
	}
	@Override
	public void delbaseById(Integer id) {
		
		sysBaseDao.delbaseById(id);
	}
	
	
}
