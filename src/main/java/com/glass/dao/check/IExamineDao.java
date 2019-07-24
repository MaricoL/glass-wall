package com.glass.dao.check;

import java.util.List;

import com.glass.entity.check.SysExamine;
import com.glass.entity.check.SysExamineReport;




public interface IExamineDao {
	/**
	 * 通用-根据查询实体的ID和审核种类获取审核信息列表
	 * @param examineentityid
	 * @param examinekind
	 * @return
	 */
	public List<SysExamine> getListExamine(SysExamine sysExamine);
	
	/**
	 * 通用-保存审核意见
	 * 
	 * @param record
	 */
	public void saveExamine(SysExamine sysExamine);
	
	/********************************************************************************/
	
	
	SysExamine getExamineById(Integer id);
	
//	SysExamineReport getExamineRepById(Integer id);
	
	void  checkDjgApprovalState(SysExamine entity);
	
	/**
	 * 根据审核实体ID和审核种类获取
	 * @param examineentityid
	 * @param examinekind
	 * @return
	 */
//	public sys_examine getOneExamine(Integer examineentityid,int examinekind); 
	
	

	
	public List<SysExamine> getListExamine1(Integer id);
	/**
	 * 根据查询实体的ID和审核种类获取审核信息列表
	 * @param examineentityid
	 * @param examinekind
	 * @return
	 */
//	public List<sys_examine_report> getListReportExamine(Integer groupID,String reportTime,String organal);
	
	
//	public sys_examine_report getOneReportExamine(Integer groupID,String reportTime,String organal);
//	
//	/**
//	 * 预算执行单体完成后生成汇总时把单体的审核数据迁过去
//	 * @param oldgroup
//	 * @param newgroup
//	 */
//	public void saveChangeReportExamine(Integer oldgroup,Integer newgroup,String reportTime,String organalID);
//	
//	public void deleteExamine(Integer id);
}
