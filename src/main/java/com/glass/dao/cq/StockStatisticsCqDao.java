package com.glass.dao.cq;

import java.util.List;

import com.glass.entity.cq.CompanyBasicInfoCq;
import com.glass.entity.cq.StockStatisticsCq;

public interface StockStatisticsCqDao {
    int deleteByPrimaryKey(Integer id);
    
    void deleteByComId(Integer id);

    int insert(StockStatisticsCq record);

    int insertSelective(StockStatisticsCq record);

    StockStatisticsCq selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StockStatisticsCq record);

    int updateByPrimaryKey(StockStatisticsCq record);

	List<StockStatisticsCq> getStockStatisticsByComId(Integer id);

	void updateStockStatisticsStateByComId(CompanyBasicInfoCq cq);

	List<StockStatisticsCq> get3StockStatisticsByComId(Integer compId);

	StockStatisticsCq getJtnStockStatisticsByComId(Integer compId);

}