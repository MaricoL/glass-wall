package com.glass.dao.cq;

import java.util.List;
import java.util.Map;

import com.glass.entity.cq.CompanyBasicInfoCq;
import com.glass.entity.cq.CqInfoExcel;
import com.glass.entity.cq.StockBasicInfoCq;
import com.glass.entity.cq.StockChange;

public interface CqDao {

		List<CompanyBasicInfoCq> getComBasicInfoByConditions(CompanyBasicInfoCq entity);
		
		List<CompanyBasicInfoCq> getCompInfoCqByUscd(CompanyBasicInfoCq entity);
		
		List<CompanyBasicInfoCq> getUscdById(CompanyBasicInfoCq entity);
		
		List<CompanyBasicInfoCq> getHisComBasicInfoByConditions(CompanyBasicInfoCq entity);

		List<CompanyBasicInfoCq> getComBasicInfoByChkConditions(CompanyBasicInfoCq entity);

		List<StockBasicInfoCq> getStockBasicInfoByComId(Integer id);
		
		List<StockBasicInfoCq> getSumStock(StockBasicInfoCq stock);

		List<CompanyBasicInfoCq> getComInfoExistCheck(CompanyBasicInfoCq com); 
		
		List<CompanyBasicInfoCq> getAllComBasicCqInfo(CompanyBasicInfoCq entity);
		
		CompanyBasicInfoCq getCompanyBasicInfoCqById(Integer id);
		
		void updateComApprovalStateById(CompanyBasicInfoCq cqqSubmitCon);

		void updateStockApprovalStateByComId(CompanyBasicInfoCq cqSubmitCon);

		void deleteComBasicInfoById(Integer id);

		void deleteStockInfoByComId(Integer id);

		void addComBasicInfo(CompanyBasicInfoCq com);
		
		void addStockBasicInfo(StockBasicInfoCq stock);

		void updateComBasicInfoById(CompanyBasicInfoCq com);
		
		List<CompanyBasicInfoCq> getComBasicToManageTree();

		void deleteFileByTypeIdAndComId(Integer typeId,Integer comId);

		List<CompanyBasicInfoCq> getChNameExistCheck(CompanyBasicInfoCq com);
		
		List<CompanyBasicInfoCq> getUscdExistCheck(CompanyBasicInfoCq com);

		StockChange getStockChangeById(String uscd);

		void UpdateStockChange(String uscd);

		void insetStockChange(StockChange stockChange);

		List<CqInfoExcel> getExportInfo(Map<String, Object> con);
		
		
}
