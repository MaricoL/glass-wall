package com.glass.service.hr;

import java.util.List;

import com.glass.entity.check.SysExamine;
import com.glass.entity.hr.HrNumberWithAgreementInfo;
import com.glass.entity.hr.HrTotalnumberInfo;
import com.glass.util.PageBean;

public interface IHrService {

	PageBean<HrTotalnumberInfo> getHrService(HrTotalnumberInfo entity, Integer currentPage, Integer pageSize);
	
	/*HrNumberWithAgreementInfo getHrAgreementById(Integer id);*/

	HrTotalnumberInfo getHrInfoById(Integer id);
	//新增Hr
	void addHr(HrTotalnumberInfo entity);

	void hrAgreement(HrTotalnumberInfo entity);
	
	void updateHr(HrTotalnumberInfo entity);
	
	void submitHrInAddPage(HrTotalnumberInfo entity);
	
	void submitHrInListPage(Integer id);
	
	void deleteHrInListPage(Integer id);
	
	void modifyHr(HrTotalnumberInfo entity);
	
	void passAgreement(HrTotalnumberInfo hr,SysExamine sysExamine);
	
	void backAgreement(HrTotalnumberInfo hr,SysExamine sysExamine);

	List<HrTotalnumberInfo> getHrByUscd(HrTotalnumberInfo entity);
	
	
	List<HrTotalnumberInfo> getHrWithTimeCompId(HrTotalnumberInfo entity);

	PageBean<HrTotalnumberInfo> getChkHr(HrTotalnumberInfo entity, Integer currentPage, Integer pageSize);

}
