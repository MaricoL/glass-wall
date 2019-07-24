package com.glass.service.check;

import java.util.List;

import com.glass.entity.check.SysExamine;
import com.glass.entity.check.SysExamineReport;


public interface IExamineService {
	
	/**
	 *  通用-根据查询实体的ID和审核种类获取审核信息列表
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

	/*************************************************************************************/
	
	SysExamine getExamineById(Integer id);

	
	
	
	void  checkExamineApprovalState(SysExamine entity);
	
	
	/**
	 * 根据查询实体的ID和审核种类获取审核信息
	 * @param examineentityid
	 * @param examinekind
	 * @return
	 */
//	public sys_examine getOneExamine(Integer examineentityid,int examinekind);
	

	public List<SysExamine> getListExamine1(Integer id);
	
	
	/**
	 * 进行审核（过程是先把之前的审核意见isdel=1 ,再插入一条）
	 * @param examineentityid 需要审核的实体ID
	 * @param examinekind 审核种类
	 * @param use 审核人
	 * @param examStr 审核意见
	 * @param examResult 审核结果
	 */
//	public void saveExamine(Integer examineentityid,int examinekind,SysUser use,String examStr,Integer examResult);
	
	
	
	/**
	 * 根据查询实体的ID和审核种类获取审核信息列表
	 */
//	public List<sys_examine_report> getListReportExamine(Integer groupID,String reportTime,String organal);
	
	/**
	 * 获取一个报表审核的实体
	 */
//	public sys_examine_report getOneReportExamine(Integer groupID,String reportTime,String organal);
	
	/**
	 * 报存报表审核
	 * @param groupID
	 * @param reportTime
	 * @param organal
	 * @param use
	 * @param examStr
	 * @param examResult
	 */
//	public void saveReportExamine(Integer groupID,String reportTime,String organal,SysUser use,String examStr,Integer examResult);
	
	/**
	 * 预算执行单体完成后生成汇总时把单体的审核数据迁过去
	 * @param oldgroup
	 * @param newgroup
	 */
//	public void saveChangeReportExamine(Integer oldgroup,Integer newgroup,String reportTime,String organalID);

	/**
	 * 删除报表审核信息
	 * @param id
	 */
//	public void deleteExamine(Integer id);
}
