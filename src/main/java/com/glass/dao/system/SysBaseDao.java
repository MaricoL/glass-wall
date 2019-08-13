package com.glass.dao.system;

import java.util.List;

import com.glass.entity.system.SysBase;;

public interface SysBaseDao {
	
    List<SysBase> getByGroup(String group);

	List<SysBase> getByGroupAndParentNum(String group, String parentNum);
	
	SysBase getByGroupAndDesc(String group,String desc);

	List<SysBase> getAll();

	

	String getMaxNumByGroup(String gROUP_AUDITOFFICE);

	Integer getMaxSeqByGroup(String gROUP_AUDITOFFICE);
	
	
	 List<SysBase> getbaseByConditions(SysBase sysBase);
	 Integer addSysBase(SysBase sysBase);
	 void updateSysbase(SysBase sysBase);
	 SysBase getbaseById(Integer id);
	 void delbaseById(Integer id);

	List<SysBase> getByType(int i);

}