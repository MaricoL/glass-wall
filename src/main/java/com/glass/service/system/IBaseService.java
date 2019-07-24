package com.glass.service.system;

import java.util.List;

import com.glass.entity.system.SysBase;
import com.glass.util.PageBean;

public interface IBaseService {
	
	List<SysBase> getByGroup(String group);
	
	List<SysBase> getByGroupAndParentNum(String group,String parentNum);
	
	List<SysBase> getAlll();
	
	
	PageBean<SysBase> getbaseByConditions(SysBase sysBase, Integer currentPage, Integer pageSize);
	SysBase getbaseById(Integer id);
	void addSysBase(SysBase sysBase);
	void updateSysbase(SysBase sysBase);
	void delbaseById(Integer id);
}
