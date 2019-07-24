package com.glass.service.cq;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.glass.entity.check.SysExamine;
import com.glass.entity.cq.CompanyBasicInfoCq;
import com.glass.entity.cq.CqInfoExcel;
import com.glass.entity.cq.StockBasicInfoCq;
import com.glass.entity.cq.StockStatisticsCq;
import com.glass.entity.system.SysUser;
import com.glass.util.PageBean;

public interface ICqService {

	List<CompanyBasicInfoCq> getAllComBasicCqInfo(CompanyBasicInfoCq entity);

	PageBean<CompanyBasicInfoCq> getComBasicInfoByCondition(CompanyBasicInfoCq entity, Integer currentPage,
			int pageSize);

	CompanyBasicInfoCq getCompanyBasicInfoCqById(Integer id);

	void deleteCompanyInfoById(Integer id);

	void addCqInfo(CompanyBasicInfoCq com, SysUser user);

	void updateCqInfo(CompanyBasicInfoCq com, SysUser user);
	void updateCqInfo(CompanyBasicInfoCq com);

	PageBean<CompanyBasicInfoCq> getAllComBasicCqInfo(CompanyBasicInfoCq entity, Integer currentPage, int pageSize);

	List<StockBasicInfoCq> getStockBasicInfoByComId(Integer id);

	boolean isExistComBasicInfo(CompanyBasicInfoCq com);

	PageBean<CompanyBasicInfoCq> getComBasicInfoByChkCondition(CompanyBasicInfoCq entity, Integer currentPage,
			int pageSize);

	void saveModifyCqInfo(CompanyBasicInfoCq com, SysUser user);

	Map<String, Object> submitCqInfo(Integer id, SysUser user);

	void updateCheckCqInfoPass(CompanyBasicInfoCq com, SysExamine se);

	void updateCheckCqInfoReturn(CompanyBasicInfoCq com, SysExamine se);

	CompanyBasicInfoCq getCompInfoCqByUscd(CompanyBasicInfoCq com);

	void updateCqInfo(CompanyBasicInfoCq com, MultipartFile file, SysUser user);

	boolean isExistChName(CompanyBasicInfoCq com);

	boolean isExistUscd(CompanyBasicInfoCq com);

	void addCqInfo(CompanyBasicInfoCq com, MultipartFile file, SysUser user);

	void saveModifyCqInfo(CompanyBasicInfoCq com, MultipartFile file, SysUser user);

	CompanyBasicInfoCq getUscdById(CompanyBasicInfoCq com);

	List<StockBasicInfoCq> getSumStock(StockBasicInfoCq stock);

	List<StockStatisticsCq> getStockStatisticsByComId(Integer id);//股权新增表方法

	PageBean<CompanyBasicInfoCq> getHisComBasicInfoByCondition(CompanyBasicInfoCq entity, Integer currentPage, int i);

	CompanyBasicInfoCq getCompBasicInfoCqByUscd(CompanyBasicInfoCq com);

	List<CqInfoExcel> getExportInfo(Map<String, Object> map);

}
