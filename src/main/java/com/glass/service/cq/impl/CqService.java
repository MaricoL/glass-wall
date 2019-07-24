package com.glass.service.cq.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.check.IExamineDao;
import com.glass.dao.cq.CqDao;
import com.glass.dao.cq.StockStatisticsCqDao;
/*import com.glass.dao.tree.TreeDao;*/
import com.glass.entity.check.SysExamine;
import com.glass.entity.cq.CompanyBasicInfoCq;
import com.glass.entity.cq.CqInfoExcel;
import com.glass.entity.cq.StockBasicInfoCq;
import com.glass.entity.cq.StockChange;
import com.glass.entity.cq.StockStatisticsCq;
import com.glass.entity.file.SysFile;
/*import com.glass.entity.system.SysManageTree;*/
import com.glass.entity.system.SysUser;
import com.glass.service.cq.ICqService;
import com.glass.service.file.IHhFileService;
import com.glass.util.PageBean;

@Service("cqService")
public class CqService implements ICqService {
	@Autowired
	private CqDao cqDao;
	@Autowired
	private IExamineDao examineDao;
/*	@Autowired
	private TreeDao treeDao;*/
	@Autowired
	private StockStatisticsCqDao stockStatisticsCqDao;
	@Autowired
	private IHhFileService hhFileService;
	
	public  static final Integer  CqFileNum=30;
	public  static final String  CqFilePath="/shanghai-milk-file/upload/cq/";
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//返回全部信息（list）
	@Override
	public List<CompanyBasicInfoCq> getAllComBasicCqInfo(CompanyBasicInfoCq entity) {
		return cqDao.getAllComBasicCqInfo(entity);
	}
	//返回全部信息
	@Override
	public PageBean<CompanyBasicInfoCq> getAllComBasicCqInfo(CompanyBasicInfoCq entity, Integer currentPage,
			int pageSize) {
		// 固定的加载项
		Page<CompanyBasicInfoCq> page = PageHelper.startPage(currentPage, pageSize);		
		// 数据库查询数据
		List<CompanyBasicInfoCq> list = cqDao.getAllComBasicCqInfo(entity);

		PageBean<CompanyBasicInfoCq> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(list);

		return pageBean;
	}	
	//返回按条件查询信息
	@Override
	public PageBean<CompanyBasicInfoCq> getComBasicInfoByCondition(CompanyBasicInfoCq entity, Integer currentPage,
			int pageSize) {	
		// 固定的加载项
		Page<CompanyBasicInfoCq> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<CompanyBasicInfoCq> list = cqDao.getComBasicInfoByConditions(entity);

		PageBean<CompanyBasicInfoCq> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(list);

		return pageBean;
	}
	//通过ID查找	
	@Override
	public CompanyBasicInfoCq getCompanyBasicInfoCqById(Integer id) {
		return cqDao.getCompanyBasicInfoCqById(id);
	}
	//删除产权s信息
	@Override
	@Transactional
	public void deleteCompanyInfoById(Integer id) {
		
		CompanyBasicInfoCq com = cqDao.getCompanyBasicInfoCqById(id);// 产权基础信息
		//System.err.println(com);
		if(com.getLastVersionId() != null)
		{
			CompanyBasicInfoCq com2 = cqDao.getCompanyBasicInfoCqById(com.getLastVersionId());// 产权基础信息
			com2.setIsLastest("1");
			com2.setIsHistory("0");
			cqDao.updateComBasicInfoById(com2);
			cqDao.deleteComBasicInfoById(id);
			cqDao.deleteStockInfoByComId(id);
		}else {
		cqDao.deleteComBasicInfoById(id);
		cqDao.deleteStockInfoByComId(id);
		}
	}
	//新增产权信息
	@Override
	@Transactional
	public void addCqInfo(CompanyBasicInfoCq com, SysUser user) {
		// 设置工商信息
		com.setCreateDate(sdf.format(new Date()));
		com.setCreatePersonId(user.getId().toString());
		com.setCreatePersonName(user.getUserName());
		com.setLastModifyDate(com.getCreateDate());
		com.setLastModifyPersonId(user.getId().toString());
		com.setLastModifyPersonName(user.getUserName());
		com.setIsDel(false);// 设置为未删除
		com.setIsHistory("0");// 设置为非历史数据
		com.setIsLastest("1");// 设置是否最新
		cqDao.addComBasicInfo(com);
		Integer comId = com.getId();
		// 设置股权信息
			if (com != null && com.getStockList() != null && com.getStockList().size() > 0) {
				for (int i = 1; i < com.getStockList().size(); i++) {
					StockBasicInfoCq stock = com.getStockList().get(i);
					stock.setCompId(String.valueOf(comId));
					stock.setCompUscd(com.getUscd());// 设置被投资公司uscd
					// 设置投资公司统一社会信用代码
					String investCompId = stock.getInvestCompId();
					if (!StringUtils.isEmpty(investCompId)) {
						CompanyBasicInfoCq cq = cqDao.getCompanyBasicInfoCqById(Integer.parseInt(investCompId));
						stock.setInvestCompUscd(cq.getUscd());
					}
					stock.setCreateDate(com.getCreateDate());
					stock.setCreatePersonId(user.getId().toString());
					stock.setCreatePersonName(user.getUserName());
					stock.setLastModifyDate(com.getCreateDate());
					stock.setLastModifyPersonId(user.getId().toString());
					stock.setLastModifyPersonName(user.getUserName());
					stock.setIsDel(false);// 设置为未删除
					stock.setApprovalState(com.getApprovalState());// 审批状态为待上报
					cqDao.addStockBasicInfo(stock);
				}
			}
		}
	@Override
	@Transactional
	public void addCqInfo(CompanyBasicInfoCq com, MultipartFile file, SysUser user) {
		// 设置工商信息
		com.setCreateDate(sdf.format(new Date()));
		com.setCreatePersonId(user.getId().toString());
		com.setCreatePersonName(user.getUserName());
		com.setLastModifyDate(com.getCreateDate());
		com.setLastModifyPersonId(user.getId().toString());
		com.setLastModifyPersonName(user.getUserName());
		com.setIsDel(false);// 设置为未删除
		com.setIsHistory("0");// 设置为非历史数据
		com.setIsLastest("1");// 设置是否最新
		cqDao.addComBasicInfo(com);
		Integer comId = com.getId();
		// 设置股权信息
		if (com != null && com.getStockList() != null && com.getStockList().size() > 0) {
			for (int i = 1; i < com.getStockList().size(); i++) {
				StockBasicInfoCq stock = com.getStockList().get(i);
				stock.setCompId(String.valueOf(comId));
				stock.setCompUscd(com.getUscd());// 设置被投资公司uscd
				// 设置投资公司统一社会信用代码
				String investCompId = stock.getInvestCompId();
				if (!StringUtils.isEmpty(investCompId)) {
					CompanyBasicInfoCq cq = cqDao.getCompanyBasicInfoCqById(Integer.parseInt(investCompId));
					stock.setInvestCompUscd(cq.getUscd());
				}
				BigDecimal stockPercent = null;  // 百分比
				if(stock.getSubContribution()!=null && com.getRegistCapital()!=null) {
					stockPercent=stock.getSubContribution().divide(com.getRegistCapital(),4,BigDecimal.ROUND_DOWN).multiply(new BigDecimal("100"));
				}
				stock.setStockPercent(stockPercent);
				stock.setCreateDate(com.getCreateDate());
				stock.setCreatePersonId(user.getId().toString());
				stock.setCreatePersonName(user.getUserName());
				stock.setLastModifyDate(com.getCreateDate());
				stock.setLastModifyPersonId(user.getId().toString());
				stock.setLastModifyPersonName(user.getUserName());
				stock.setIsDel(false);// 设置为未删除
				stock.setApprovalState(com.getApprovalState());// 审批状态为待上报
				cqDao.addStockBasicInfo(stock);
			}
			StockBasicInfoCq scq2=new StockBasicInfoCq();//原先SQL语句查询方法 
			scq2.setCompId(String.valueOf(comId));
			List<StockBasicInfoCq> ssList=cqDao.getSumStock(scq2);
			for(StockBasicInfoCq result : ssList) {
				StockStatisticsCq scq3=new StockStatisticsCq();	
				BigDecimal b1 = com.getRegistCapital();
				BigDecimal b2 = result.getSubContribution();
				if(b1!=null && b2!=null) {
					BigDecimal b3 =  b2.divide(b1,4,BigDecimal.ROUND_DOWN).multiply(new BigDecimal("100"));
					scq3.setStockPercent(b3);
				}
				scq3.setActualContributionTotal(result.getActualContribution());//总实缴
				scq3.setSubContributionTotal(result.getSubContribution());//总认缴
				scq3.setCompId(result.getCompId());
				scq3.setCompUscd(result.getCompUscd());
				scq3.setInvestCompId(result.getInvestCompId());
				scq3.setInvestCompName(result.getInvestCompName());
				scq3.setInvestCompUscd(result.getInvestCompUscd());
				scq3.setInvestType(result.getInvestType());
				scq3.setIsDel(false);
				scq3.setApprovalState("1");
				stockStatisticsCqDao.insertSelective(scq3);
			}
			//System.err.println(ssList);	
		}
		// 附件
		if (file!= null) {
				if(!file.isEmpty()) {
					SysFile file1 = hhFileService.saveFile(file, comId,
							CqFileNum, CqFilePath);
					com.setReasonFile(file1.getFileUuid());
				}
		}
		cqDao.updateComBasicInfoById(com);
	}
	//修改产权信息
	@Override
	@Transactional
	public void updateCqInfo(CompanyBasicInfoCq com, SysUser user) {
		// 设置工商信息
		com.setLastModifyDate(sdf.format(new Date()));
		com.setLastModifyPersonId(user.getId().toString());
		com.setLastModifyPersonName(user.getUserName());
		com.setIsHistory("0");// 设置为非历史数据
		com.setIsLastest("1");// 设置是否最新
		cqDao.updateComBasicInfoById(com);
		Integer comId = com.getId();
		cqDao.deleteStockInfoByComId(comId);
		// 设置股权信息
		if (com != null && com.getStockList() != null && com.getStockList().size() > 0) {
			for (int i = 1; i < com.getStockList().size(); i++) {
				StockBasicInfoCq stock = com.getStockList().get(i);
				stock.setCompId(String.valueOf(comId));
				stock.setCompUscd(com.getUscd());// 设置被投资公司uscd
				// 设置投资公司统一社会信用代码
				String investCompId = stock.getInvestCompId();
				if (!StringUtils.isEmpty(investCompId)) {
					CompanyBasicInfoCq cq = cqDao.getCompanyBasicInfoCqById(Integer.parseInt(investCompId));
					stock.setInvestCompUscd(cq.getUscd());
				}
				stock.setCreateDate(com.getLastModifyDate());
				stock.setCreatePersonId(user.getId().toString());
				stock.setCreatePersonName(user.getUserName());
				stock.setLastModifyDate(com.getLastModifyDate());
				stock.setLastModifyPersonId(user.getId().toString());
				stock.setLastModifyPersonName(user.getUserName());
				stock.setIsDel(false);// 设置为未删除
				stock.setApprovalState(com.getApprovalState());// 审批状态为待上报
				cqDao.addStockBasicInfo(stock);
			}
		}

	}
	//修改产权附件信息
		@Override
		@Transactional
		public void updateCqInfo(CompanyBasicInfoCq com) {
			// 设置工商信息
			cqDao.updateComBasicInfoById(com);
		}
	@Override
	@Transactional
	public void updateCqInfo(CompanyBasicInfoCq com, MultipartFile file,SysUser user) {
		// 设置工商信息
		com.setLastModifyDate(sdf.format(new Date()));
		com.setLastModifyPersonId(user.getId().toString());
		com.setLastModifyPersonName(user.getUserName());
		com.setIsHistory("0");// 设置为非历史数据
		com.setIsLastest("1");// 设置是否最新
		cqDao.updateComBasicInfoById(com);
		Integer comId = com.getId();
		cqDao.deleteStockInfoByComId(comId);
		//System.err.println(comId+"11111111111111111111111111111111111111111111111111111111111111111");
		StockStatisticsCq scq =new StockStatisticsCq();
		scq.setIsDel(true);
		scq.setCompId(String.valueOf(comId));
		stockStatisticsCqDao.updateByPrimaryKeySelective(scq);
		//stockStatisticsCqDao.deleteByComId(comId);
		
		// 设置股权信息
		if (com != null && com.getStockList() != null && com.getStockList().size() > 0) {
			for (int i = 1; i < com.getStockList().size(); i++) {
				StockBasicInfoCq stock = com.getStockList().get(i);
				stock.setCompId(String.valueOf(comId));
				stock.setCompUscd(com.getUscd());// 设置被投资公司uscd
				// 设置投资公司统一社会信用代码
				String investCompId = stock.getInvestCompId();
				if (!StringUtils.isEmpty(investCompId)) {
					CompanyBasicInfoCq cq = cqDao.getCompanyBasicInfoCqById(Integer.parseInt(investCompId));
					stock.setInvestCompUscd(cq.getUscd());
				}
				BigDecimal stockPercent = null;  // 百分比
				if(stock.getSubContribution()!=null && com.getRegistCapital()!=null) {
					stockPercent=stock.getSubContribution().divide(com.getRegistCapital(),4,BigDecimal.ROUND_HALF_DOWN).multiply(new BigDecimal("100"));
				}
				stock.setStockPercent(stockPercent);
				stock.setCreateDate(com.getLastModifyDate());
				stock.setCreatePersonId(user.getId().toString());
				stock.setCreatePersonName(user.getUserName());
				stock.setLastModifyDate(com.getLastModifyDate());
				stock.setLastModifyPersonId(user.getId().toString());
				stock.setLastModifyPersonName(user.getUserName());
				stock.setIsDel(false);// 设置为未删除
				stock.setApprovalState(com.getApprovalState());// 审批状态为待上报
				cqDao.addStockBasicInfo(stock);
			}
			StockBasicInfoCq scq2=new StockBasicInfoCq();//原先SQL语句查询方法 
			scq2.setCompId(String.valueOf(comId));
			List<StockBasicInfoCq> ssList=cqDao.getSumStock(scq2);
			for(StockBasicInfoCq result : ssList) {
				
				StockStatisticsCq scq3=new StockStatisticsCq();	
				BigDecimal b1 = com.getRegistCapital();
				BigDecimal b2 = result.getSubContribution();
				if(b1!=null && b2!=null) {
					BigDecimal b3 =  b2.divide(b1,4,BigDecimal.ROUND_HALF_DOWN).multiply(new BigDecimal("100"));
					scq3.setStockPercent(b3);
				}
				scq3.setActualContributionTotal(result.getActualContribution());//总实缴
				scq3.setSubContributionTotal(result.getSubContribution());//总认缴
				scq3.setCompId(result.getCompId());
				scq3.setCompUscd(result.getCompUscd());	
				scq3.setInvestCompName(result.getInvestCompName());				
				scq3.setInvestCompId(result.getInvestCompId());								
				scq3.setInvestCompUscd(result.getInvestCompUscd());
				scq3.setInvestType(result.getInvestType());
				scq3.setCreateDate(com.getLastModifyDate());
				scq3.setCreatePersonId(user.getId().toString());
				scq3.setCreatePersonName(user.getUserName());
				scq3.setLastModifyDate(com.getLastModifyDate());
				scq3.setLastModifyPersonId(user.getId().toString());
				scq3.setLastModifyPersonName(user.getUserName());
				scq3.setIsDel(false);
				scq3.setApprovalState("1");
				stockStatisticsCqDao.insertSelective(scq3);
			}
			//System.err.println(ssList);	
		}
		// 附件
		if (file != null) {
			if (StringUtils.isNotBlank(file.getOriginalFilename())) {
				cqDao.deleteFileByTypeIdAndComId(CqFileNum, comId);
				if (!file.isEmpty()) {
					SysFile file1 = hhFileService.saveFile(file, com.getId(), CqFileNum, CqFilePath);
					com.setReasonFile(file1.getFileUuid());
				}
			} 
		}
		cqDao.updateComBasicInfoById(com);
	}
	
	//上报
	@Override
	@Transactional
	public Map<String, Object> submitCqInfo(Integer id, SysUser user) {
		Map<String, Object> map = new HashMap<String, Object>();
		String flag = "0";
		String message = "";

		CompanyBasicInfoCq cq = cqDao.getCompanyBasicInfoCqById(id);
		if (cq != null) {
			if (StringUtils.equals("1", cq.getApprovalState())||StringUtils.equals("4", cq.getApprovalState())) {// TODO
				cq.setLastModifyDate(sdf.format(new Date()));
				cq.setLastModifyPersonId(user.getId().toString());
				cq.setLastModifyPersonName(user.getUserName());
				cq.setApprovalState("2");// TODO
				cqDao.updateComApprovalStateById(cq);
				cqDao.updateStockApprovalStateByComId(cq);

				flag = "1";
				message = "上报成功！";
			} else {
				flag = "0";
				message = "此信息为非待上报状态，不能上报！";
			}

		} else {
			flag = "0";
			message = "此信息不存在或已被删除！";
		}
		map.put("flag", flag);
		map.put("message", message);

		return map;
	}
	
	@Override
	public List<StockBasicInfoCq> getStockBasicInfoByComId(Integer id) {
		return cqDao.getStockBasicInfoByComId(id);
	}

	
	@Override
	public boolean isExistComBasicInfo(CompanyBasicInfoCq com) {
		List<CompanyBasicInfoCq> list = cqDao.getComInfoExistCheck(com);
		if (list != null && list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}
	//审核页面列表
	@Override
	public PageBean<CompanyBasicInfoCq> getComBasicInfoByChkCondition(CompanyBasicInfoCq entity, Integer currentPage,
			int pageSize) {
		// 固定的加载项
		Page<CompanyBasicInfoCq> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<CompanyBasicInfoCq> list = cqDao.getComBasicInfoByChkConditions(entity);

		PageBean<CompanyBasicInfoCq> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(list);

		return pageBean;
	}
	
	//保存变更信息
	@Override
	@Transactional
	public void saveModifyCqInfo(CompanyBasicInfoCq com, SysUser user) {
		String date = sdf.format(new Date());
		// 设置之前的工商信息
		CompanyBasicInfoCq oldComInfo = cqDao.getCompanyBasicInfoCqById(com.getId());
		oldComInfo.setIsLastest("0");
		oldComInfo.setLastModifyPersonId(user.getId().toString());
		oldComInfo.setLastModifyPersonName(user.getUserName());
		oldComInfo.setLastModifyDate(date);
		cqDao.updateComBasicInfoById(oldComInfo);
/*		SysManageTree record=new SysManageTree();
		record.setCreditCode(oldComInfo.getUscd());;
		SysManageTree sysManageTree = treeDao.selectBySeective(record);
		sysManageTree.setIsDel(true);
		treeDao.updateByPrimaryKeySelective(sysManageTree);*/
		
		// 设置工商信息
		com.setCreateDate(date);
		com.setCreatePersonId(user.getId().toString());
		com.setCreatePersonName(user.getUserName());
		com.setLastModifyDate(date);
		com.setLastModifyPersonId(user.getId().toString());
		com.setLastModifyPersonName(user.getUserName());
		com.setIsDel(false);// 设置为未删除
		com.setIsHistory("0");// 设置为非历史数据
		com.setIsLastest("1");// 设置是否最新
		com.setLastVersionId(com.getId());// 设置之前版本的工商信息id
		com.setId(null);

		cqDao.addComBasicInfo(com);

		// 设置股权信息
		Integer comId = com.getId();

		if (com != null && com.getStockList() != null && com.getStockList().size() > 0) {
			for (int i = 1; i < com.getStockList().size(); i++) {
				StockBasicInfoCq stock = com.getStockList().get(i);
				stock.setCompId(String.valueOf(comId));
				stock.setCompUscd(com.getUscd());// 设置被投资公司uscd
				// 设置投资公司统一社会信用代码
				String investCompId = stock.getInvestCompId();
				if (!StringUtils.isEmpty(investCompId)) {
					CompanyBasicInfoCq cq = cqDao.getCompanyBasicInfoCqById(Integer.parseInt(investCompId));
					stock.setInvestCompUscd(cq.getUscd());
				}
				stock.setCreateDate(date);
				stock.setCreatePersonId(user.getId().toString());
				stock.setCreatePersonName(user.getUserName());
				stock.setLastModifyDate(date);
				stock.setLastModifyPersonId(user.getId().toString());
				stock.setLastModifyPersonName(user.getUserName());
				stock.setIsDel(false);// 设置为未删除
				stock.setApprovalState(com.getApprovalState());
				cqDao.addStockBasicInfo(stock);
			}
		}

	}
	@Override
	@Transactional
	public void saveModifyCqInfo(CompanyBasicInfoCq com,MultipartFile file, SysUser user) {
		String date = sdf.format(new Date());
		// 设置之前的工商信息
		CompanyBasicInfoCq oldComInfo = cqDao.getCompanyBasicInfoCqById(com.getId());
		oldComInfo.setIsLastest("0");
		oldComInfo.setLastModifyPersonId(user.getId().toString());
		oldComInfo.setLastModifyPersonName(user.getUserName());
		oldComInfo.setLastModifyDate(date);
		cqDao.updateComBasicInfoById(oldComInfo);
		
		// 设置工商信息
		com.setCreateDate(date);
		com.setCreatePersonId(user.getId().toString());
		com.setCreatePersonName(user.getUserName());
		com.setLastModifyDate(date);
		com.setLastModifyPersonId(user.getId().toString());
		com.setLastModifyPersonName(user.getUserName());
		com.setIsDel(false);// 设置为未删除
		com.setIsHistory("0");// 设置为非历史数据
		com.setIsLastest("1");// 设置是否最新
		com.setLastVersionId(com.getId());// 设置之前版本的工商信息id
		com.setId(null);
		
		cqDao.addComBasicInfo(com);
		Integer oldId = com.getId();
		Integer comId = com.getId();
		
//		// 设置股权信息
//		Integer comId = com.getId();
//		SysExamine sysExamine = new SysExamine();
//		sysExamine.setExamentityId(oldId);
//		sysExamine.setExamKind(30);
//		List<SysExamine> exList = examineDao.getListExamine(sysExamine);
//		for(SysExamine se : exList) {
//			se.setExamentityId(comId);
//			se.setId(null);
//			examineDao.saveExamine(se);
//		}
		
		
		if (com != null && com.getStockList() != null && com.getStockList().size() > 0) {
			for (int i = 1; i < com.getStockList().size(); i++) {
				StockBasicInfoCq stock = com.getStockList().get(i);
				stock.setCompId(String.valueOf(comId));
				stock.setCompUscd(com.getUscd());// 设置被投资公司uscd
				// 设置投资公司统一社会信用代码
				String investCompId = stock.getInvestCompId();
				if (!StringUtils.isEmpty(investCompId)) {
					CompanyBasicInfoCq cq = cqDao.getCompanyBasicInfoCqById(Integer.parseInt(investCompId));
					stock.setInvestCompUscd(cq.getUscd());
				}
				BigDecimal stockPercent = null;  // 百分比
				if(stock.getSubContribution()!=null && com.getRegistCapital()!=null) {
					stockPercent=stock.getSubContribution().divide(com.getRegistCapital(),4,BigDecimal.ROUND_DOWN).multiply(new BigDecimal("100"));
				}
				stock.setStockPercent(stockPercent);
				stock.setCreateDate(date);
				stock.setCreatePersonId(user.getId().toString());
				stock.setCreatePersonName(user.getUserName());
				stock.setLastModifyDate(date);
				stock.setLastModifyPersonId(user.getId().toString());
				stock.setLastModifyPersonName(user.getUserName());
				stock.setIsDel(false);// 设置为未删除
				stock.setApprovalState(com.getApprovalState());
				cqDao.addStockBasicInfo(stock);
			}
			
			StockBasicInfoCq scq2=new StockBasicInfoCq();//原先SQL语句查询方法 
			scq2.setCompId(String.valueOf(oldId));
			List<StockBasicInfoCq> ssList=cqDao.getSumStock(scq2);
			for(StockBasicInfoCq result : ssList) {
				StockStatisticsCq scq3=new StockStatisticsCq();	
				BigDecimal b1 = com.getRegistCapital();
				BigDecimal b2 = result.getSubContribution();
				if(b1!=null && b2!=null) {
					BigDecimal b3 =  b2.divide(b1,4,BigDecimal.ROUND_DOWN).multiply(new BigDecimal("100"));
					scq3.setStockPercent(b3);
				}
				scq3.setActualContributionTotal(result.getActualContribution());//总实缴
				scq3.setSubContributionTotal(result.getSubContribution());//总认缴
				scq3.setCompId(String.valueOf(comId));
				scq3.setCompUscd(result.getCompUscd());
				scq3.setInvestCompId(result.getInvestCompId());
				scq3.setInvestCompName(result.getInvestCompName());
				scq3.setInvestCompUscd(result.getInvestCompUscd());
				scq3.setInvestType(result.getInvestType());
				scq3.setCreateDate(date);
				scq3.setCreatePersonId(user.getId().toString());
				scq3.setCreatePersonName(user.getUserName());
				scq3.setLastModifyDate(date);
				scq3.setLastModifyPersonId(user.getId().toString());
				scq3.setLastModifyPersonName(user.getUserName());
				scq3.setIsDel(false);
				scq3.setApprovalState("1");
				stockStatisticsCqDao.insertSelective(scq3);
			}
			//System.err.println(ssList);	
		}
		if (file!= null) {
			if(!file.isEmpty()) {
				SysFile file1 = hhFileService.saveFile(file, comId,
						CqFileNum, CqFilePath);
				com.setReasonFile(file1.getFileUuid());
			}
	}
	cqDao.updateComBasicInfoById(com);	
	}
	//审核通过
	@Override
	@Transactional
	public void updateCheckCqInfoPass(CompanyBasicInfoCq com, SysExamine se) {
		// 设置之前的记录的“是否是历史记录”
		Integer versionId = com.getLastVersionId();
		CompanyBasicInfoCq oldCom = null;
		List<StockStatisticsCq> oldSto = null;
		List<StockStatisticsCq> newSto = null;
		if (versionId!=null) {
			oldCom = cqDao.getCompanyBasicInfoCqById(com.getLastVersionId());
			oldSto = stockStatisticsCqDao.getStockStatisticsByComId(com.getLastVersionId());
			newSto = stockStatisticsCqDao.getStockStatisticsByComId(com.getId());
			oldCom.setIsHistory("1");// 设置为历史记录
			cqDao.updateComBasicInfoById(oldCom);
		}
        if(oldSto!=null && newSto!=null) {
        	if(oldSto.size()==newSto.size()) {
        		if(oldSto.containsAll(newSto)) {	
        		}else {
        			insertStockChange(com,oldSto,newSto);
        		}
        	}else {
    			insertStockChange(com,oldSto,newSto);
        	}
        }
		
		// 设置通过的记录的审核状态、版本号
		com.setApprovalState("3");// 设置状态为通过
		if (oldCom!=null) {
			float version = Float.parseFloat(oldCom.getVersion());
			float lastVersion = (float) (version + 1.0);
			com.setVersion(String.valueOf(lastVersion));
		} else {
			com.setVersion("1.0");
		}
		cqDao.updateComBasicInfoById(com);
//		 设置股权信息审核状态
		cqDao.updateStockApprovalStateByComId(com);
		// 生成审批信息
		examineDao.saveExamine(se);
	}
	private void insertStockChange(CompanyBasicInfoCq com,List<StockStatisticsCq> oldSto,List<StockStatisticsCq> newSto) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		SysUser user = (SysUser) request.getSession(false).getAttribute("userSession");
		StockChange stockChange = new StockChange();
		StringBuilder oldStr=new StringBuilder();
		StringBuilder newStr=new StringBuilder();
		for (int i = 0; i < oldSto.size(); i++) {
			oldStr.append(i+1+":"+oldSto.get(i).getInvestCompName()+"占股比例"+oldSto.get(i).getStockPercent()+"%"+";");		
		}
		for (int i = 0; i < newSto.size(); i++) {
			newStr.append(i+1+":"+newSto.get(i).getInvestCompName()+"占股比例"+newSto.get(i).getStockPercent()+"%"+";");		
		}
		//判断有没有历史数据
		StockChange s= null;
		s = cqDao.getStockChangeById(com.getUscd());
		if(s!=null) {
			cqDao.UpdateStockChange(com.getUscd());
		}
		//System.out.println(com);
		stockChange.setTime(com.getCreateDate());
		stockChange.setCompId(com.getId()+"");
		stockChange.setCompName(com.getChName());
		stockChange.setCompUscd(com.getUscd());
        stockChange.setOldSto(oldStr.toString());
        stockChange.setNewSto(newStr.toString());
		stockChange.setCreateDate(sdf.format(new Date()));
        stockChange.setCreatePersonId(user.getId().toString());
        stockChange.setCreatePersonName(user.getUserName());
        stockChange.setIsDel(false);
        cqDao.insetStockChange(stockChange);
        
	}
	//审核退回
	@Override
	@Transactional
	public void updateCheckCqInfoReturn(CompanyBasicInfoCq com, SysExamine se) {
		// 设置通过的记录的审核状态
		com.setApprovalState("4");// 设置状态为退回
		cqDao.updateComApprovalStateById(com);
		// 设置股权信息审核状态
		cqDao.updateStockApprovalStateByComId(com);
		// TODO 生成审批信息
		examineDao.saveExamine(se);
	}
	
	/**
	 * 查询条件：isDel（0）、isHistory（0）、approvalState（3）、isLastest、uscd（页面参数）
	 * 
	 */
	@Override
	public CompanyBasicInfoCq getCompInfoCqByUscd(CompanyBasicInfoCq com) {
		List<CompanyBasicInfoCq> list = cqDao.getCompInfoCqByUscd(com);
		if (list!=null&&list.size()>0) {
			return list.get(0);
		} else {
			return null;
		}
		
	}
	@Override
	public CompanyBasicInfoCq getUscdById(CompanyBasicInfoCq com) {
		List<CompanyBasicInfoCq> list = cqDao.getUscdById(com);
		if (list!=null&&list.size()>0) {
			return list.get(0);
		} else {
			return null;
		}
		
	}
	@Override
	public boolean isExistChName(CompanyBasicInfoCq com) {
		List<CompanyBasicInfoCq> list1 = cqDao.getChNameExistCheck(com);
		if (list1 != null && list1.size() > 0) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public boolean isExistUscd(CompanyBasicInfoCq com) {
		List<CompanyBasicInfoCq> list = cqDao.getUscdExistCheck(com);
		if (list != null && list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}
	//汇总股权信息旧方法SQL语句
	@Override
	public List<StockBasicInfoCq> getSumStock(StockBasicInfoCq stock) {
		return cqDao.getSumStock(stock);
	}
	//汇总股权信息新方法新表
	@Override
	public List<StockStatisticsCq> getStockStatisticsByComId(Integer id) {
		return stockStatisticsCqDao.getStockStatisticsByComId(id);
	}
	

	//返回全部信息
	@Override
	public PageBean<CompanyBasicInfoCq> getHisComBasicInfoByCondition(CompanyBasicInfoCq entity, Integer currentPage,int pageSize) {
		// 固定的加载项
		Page<CompanyBasicInfoCq> page = PageHelper.startPage(currentPage, pageSize);		
		// 数据库查询数据
		List<CompanyBasicInfoCq> list = cqDao.getHisComBasicInfoByConditions(entity);

		PageBean<CompanyBasicInfoCq> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(list);

		return pageBean;
	}
	/**
	 * 查询条件：isDel（0）、isHistory（0）、approvalState（3）、isLastest、uscd（页面参数）
	 * 
	 */
	@Override
	public CompanyBasicInfoCq getCompBasicInfoCqByUscd(CompanyBasicInfoCq com) {
		List<CompanyBasicInfoCq> list = cqDao.getCompInfoCqByUscd(com);
		if (list!=null&&list.size()>0) {
			return list.get(0);
		} else {
			return null;
		}
		
	}
	@Override
	public List<CqInfoExcel> getExportInfo(Map<String, Object> con) {
		List<CqInfoExcel> list = cqDao.getExportInfo(con);
		List<StockStatisticsCq> sList1 = null;
		int i = 1;
		for (CqInfoExcel cqInfoExcel : list) {
			cqInfoExcel.setRn(i);
			sList1 = stockStatisticsCqDao.get3StockStatisticsByComId(cqInfoExcel.getCompId());

			if (sList1 != null && sList1.size() > 0) {
				int size = sList1.size();
				if (size==1) {
					cqInfoExcel.setInvestCompName1(sList1.get(0).getInvestCompName());
					cqInfoExcel.setStockPercent1(sList1.get(0).getStockPercent());
				} else if(size==2){
					cqInfoExcel.setInvestCompName1(sList1.get(0).getInvestCompName());
					cqInfoExcel.setStockPercent1(sList1.get(0).getStockPercent());
					cqInfoExcel.setInvestCompName2(sList1.get(1).getInvestCompName());
					cqInfoExcel.setStockPercent2(sList1.get(1).getStockPercent());
				}else {
					if (!"2".equals(sList1.get(0).getInvestType()) && !"2".equals(sList1.get(1).getInvestType())) {
						StockStatisticsCq firstStock = stockStatisticsCqDao.getJtnStockStatisticsByComId(cqInfoExcel.getCompId());
						if (null!=firstStock) {
							cqInfoExcel.setInvestCompName1(firstStock.getInvestCompName());
							cqInfoExcel.setStockPercent1(firstStock.getStockPercent());
							cqInfoExcel.setInvestCompName2(sList1.get(0).getInvestCompName());
							cqInfoExcel.setInvestCompName3(sList1.get(1).getInvestCompName()+"等("+sList1.get(1).getStockPercent()+")");
							cqInfoExcel.setStockPercent2(sList1.get(0).getStockPercent());
							cqInfoExcel.setStockPercent3(sList1.get(1).getStockPercent());
						}else {
							cqInfoExcel.setInvestCompName1(sList1.get(0).getInvestCompName());
							cqInfoExcel.setInvestCompName2(sList1.get(1).getInvestCompName());
							cqInfoExcel.setInvestCompName3(sList1.get(2).getInvestCompName()+"等("+sList1.get(2).getStockPercent()+")");
							cqInfoExcel.setStockPercent1(sList1.get(0).getStockPercent());
							cqInfoExcel.setStockPercent2(sList1.get(1).getStockPercent());
							cqInfoExcel.setStockPercent3(sList1.get(2).getStockPercent());
						}
					} else {
						cqInfoExcel.setInvestCompName1(sList1.get(0).getInvestCompName());
						cqInfoExcel.setInvestCompName2(sList1.get(1).getInvestCompName());
						cqInfoExcel.setInvestCompName3(sList1.get(2).getInvestCompName()+"等("+sList1.get(2).getStockPercent()+")");
						cqInfoExcel.setStockPercent1(sList1.get(0).getStockPercent());
						cqInfoExcel.setStockPercent2(sList1.get(1).getStockPercent());
						cqInfoExcel.setStockPercent3(sList1.get(2).getStockPercent());
					}
				}
			}
			i++;
		}
		return list;
	}

}
