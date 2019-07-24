package com.glass.service.hr.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.check.IExamineDao;
import com.glass.dao.hr.HrDao;
import com.glass.entity.check.SysExamine;
import com.glass.entity.hr.HrNumberWithAgreementInfo;
import com.glass.entity.hr.HrTotalnumberInfo;
import com.glass.service.hr.IHrService;
import com.glass.util.PageBean;
@Service("hrService")
public class HrService implements IHrService {
	
	@Autowired
	private HrDao hrDao;
	
	@Autowired
	private IExamineDao examineDao;

	@Override
	public PageBean<HrTotalnumberInfo> getHrService(HrTotalnumberInfo entity, Integer currentPage, Integer pageSize) {
		//固定的加载项
		Page<HrTotalnumberInfo> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<HrTotalnumberInfo> allHr = hrDao.getHr(entity);
		
		PageBean<HrTotalnumberInfo> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allHr);
		
		return pageBean;
	}
	@Override
	public PageBean<HrTotalnumberInfo> getChkHr(HrTotalnumberInfo entity, Integer currentPage, Integer pageSize) {
		//固定的加载项
		Page<HrTotalnumberInfo> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<HrTotalnumberInfo> allHr = hrDao.getChkHr(entity);
		
		PageBean<HrTotalnumberInfo> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allHr);
		
		return pageBean;
	}
	

		//新增Hr
		@Override
		public void addHr(HrTotalnumberInfo entity) {

			hrDao.addHr(entity);

		}
		//根据id获取用户
		@Override
		public HrTotalnumberInfo getHrInfoById(Integer id) {
			return hrDao.getHrInfoById(id);
		}
	
		//人事审核意见
		@Override
		public void hrAgreement(HrTotalnumberInfo entity) {

			hrDao.hrAgreement(entity);

		}

		//修改人事信息
		@Override
		public void updateHr(HrTotalnumberInfo entity) {
			hrDao.updateHr(entity);
		}

		//新增页面提交人事信息
		@Override
		public void submitHrInAddPage(HrTotalnumberInfo entity) {
			hrDao.submitHrInAddPage(entity);
			
		}


		@Override
		public void submitHrInListPage(Integer id) {
			hrDao.submitHrInfoInListPage(id);
		}


		@Override
		public void deleteHrInListPage(Integer id) {
			hrDao.deleteHrInfo(id);
		}


		/*@Override
		public HrNumberWithAgreementInfo getHrAgreementById(Integer id) {
			// TODO Auto-generated method stub
			return hrDao.agreementList(id);
		}*/


		@Override
		public void modifyHr(HrTotalnumberInfo entity) {
			hrDao.modifyHr(entity);
			
		}


		@Override
		public void passAgreement(HrTotalnumberInfo hrInfo,SysExamine se) {
			
			//保存审核意见
			hrDao.passAgreementUpdateStatus(hrInfo);
			examineDao.saveExamine(se);
			
			//hrDao.insertAgreementInfo(id, username, time, result, opinion);
			
		}


		@Override
		public void backAgreement(HrTotalnumberInfo hrInfo,SysExamine se) {
			hrDao.backAgreementUpdateStatus(hrInfo);
			examineDao.saveExamine(se);
			//hrDao.insertAgreementInfo(id, username, time, result, opinion);
			
		}
		
		@Override
		public List<HrTotalnumberInfo> getHrByUscd(HrTotalnumberInfo entity) {
			return hrDao.getHrByUscd(entity);
		}


		@Override
		public List<HrTotalnumberInfo> getHrWithTimeCompId(HrTotalnumberInfo entity) {
			return hrDao.getHrWithTimeCompId(entity);
		}
	
		
}
