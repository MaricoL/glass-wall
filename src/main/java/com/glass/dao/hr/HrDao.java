package com.glass.dao.hr;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glass.entity.hr.HrNumberWithAgreementInfo;
import com.glass.entity.hr.HrTotalnumberInfo;


public interface HrDao {
	
	/**
	 * 通过查询条件获取用户列表
	 * @param entity
	 * @return
	 */
	List<HrTotalnumberInfo> getHr(HrTotalnumberInfo entity);
	List<HrTotalnumberInfo> getChkHr(HrTotalnumberInfo entity);
	
	/**
	 * 通过year month comp_id 来查询数据库中的信息
	 * @param entity
	 * @return
	 */
	List<HrTotalnumberInfo> getHrWithTimeCompId(HrTotalnumberInfo entity);
	
	/*HrNumberWithAgreementInfo agreementList(Integer id);*/
	
	
	/**
	 * 根据ID查询单个对象
	 * @param entity
	 * @return
	 */
	HrTotalnumberInfo getHrInfoById(Integer id);
	/**
	 * 新增Hr
	 * @param entity
	 * @return
	 */
	void addHr(HrTotalnumberInfo entity);
	/**
	 * 人事审核意见
	 * @param entity
	 * @return
	 */
	void hrAgreement(HrTotalnumberInfo entity);
	
	
	/**
	 * edit Hr
	 * @param entity
	 * @return
	 */
	void updateHr(HrTotalnumberInfo entity);
	
	/**
	 * 在新增页面上报
	 * @param entity
	 * @return
	 */
	void submitHrInAddPage(HrTotalnumberInfo entity);
	
	/**
	 * 在列表页面上报
	 * @param entity
	 * @return
	 */
	void submitHrInfoInListPage(Integer id);
	
	
	/**
	 * 删除信息
	 * @param id
	 */
	void deleteHrInfo(Integer id);
	
	
	/**
	 * 变更信息
	 * @param entity
	 */
	void modifyHr(HrTotalnumberInfo entity);
	
	//void passAgreement(@Param("username")String username,@Param("agreement")String agreement,@Param("id") Integer id);

	/**
	 * 通过审核
	 * @param id
	 */
	void passAgreementUpdateStatus(HrTotalnumberInfo entity);
	
	
	/**
	 * 退回
	 * @param id
	 */
	void backAgreementUpdateStatus(HrTotalnumberInfo entity);

	
	/**
	 * 审核意见信息
	 * @param id
	 * @param name
	 * @param time
	 * @param result
	 * @param opinion
	 */
	void insertAgreementInfo(@Param("id") Integer id,@Param("name")String name,
			@Param("time")String time,  
			@Param("result")String result,
			@Param("opinion")String opinion);
	
	/**
	 * 审核意见信息
	 * @param id
	 * @param name
	 * @param time
	 * @param result
	 * @param opinion
	 */	
	List<HrTotalnumberInfo> getHrByUscd(HrTotalnumberInfo entity);
}
