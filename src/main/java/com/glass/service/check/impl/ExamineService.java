package com.glass.service.check.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.glass.dao.check.IExamineDao;
import com.glass.entity.check.SysExamine;
import com.glass.entity.check.SysExamineReport;
import com.glass.service.check.IExamineService;


@Service("examineService")
public class ExamineService implements IExamineService{

	@Autowired
	private IExamineDao examineDao;
	
	
	/**
	 *通用- 根据查询实体的ID和审核种类获取审核信息列表
	 * @param examineentityid
	 * @param examinekind
	 * @return
	 */
	@Override
	public List<SysExamine> getListExamine(SysExamine sysExamine)
	{
		return examineDao.getListExamine(sysExamine);
	}
	
	/**
	 * 通用-保存审核意见
	 * 
	 * @param record
	 */
	@Override
	public void saveExamine(SysExamine sysExamine) {
		examineDao.saveExamine(sysExamine);
	}
	
	/*******************************************************************************/
	
	@Override
	public SysExamine getExamineById(Integer id) {
		return examineDao.getExamineById(id);

	}
	
	
	
	@Override
	@Transactional
	public void checkExamineApprovalState(SysExamine entity) {
		examineDao.checkDjgApprovalState(entity);
//		审核通过 退回
	}
	
	@Override
	public List<SysExamine> getListExamine1(Integer id) {
		return examineDao.getListExamine1(id);
	}

//	@Override
//	public List<sys_examine_report> getListReportExamine(Integer groupID, String reportTime, String organal) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
	

	
	
//	public sys_examine getOneExamine(Integer examineentityid,int examinekind)
//	{
//		return examineDao.getOneExamine( examineentityid, examinekind);
//	}
	

	
	/**
	 * 根据查询实体的ID和审核种类获取审核信息列表
	 * @param examineentityid
	 * @param examinekind
	 * @return
	 */
//	public List<sys_examine_report> getListReportExamine(Integer groupID,String reportTime,String organal)
//	{
//		return examineDao.getListReportExamine( groupID, reportTime, organal);
//	}
	
	
//	public sys_examine_report getOneReportExamine(Integer groupID,String reportTime,String organal)
//	{
//		return examineDao.getOneReportExamine( groupID, reportTime, organal);
//	}
	
//

	/**
	 * 预算执行单体完成后生成汇总时把单体的审核数据迁过去
	 * @param oldgroup
	 * @param newgroup
	 */
//	public void saveChangeReportExamine(Integer oldgroup,Integer newgroup,String reportTime,String organalID)
//	{
//		 examineDao.saveChangeReportExamine(oldgroup, newgroup,reportTime,organalID);
//	}
//
//	@Override
//	public void deleteExamine(Integer id) {
//		examineDao.deleteExamine(id);		
//	}
//
//
////	@Override
////	public void saveExamine(Integer examineentityid, int examinekind, SysUser use, String examStr, Integer examResult) {
////		// TODO Auto-generated method stub
////		
////	}

//1111
//	@Override
//	public void saveReportExamine(Integer groupID, String reportTime, String organal, SysUser use, String examStr,
//			Integer examResult) {
//		// TODO Auto-generated method stub
//		
//	}
}
