package com.glass.service.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.util.PageBean;

public interface IAccelationService {
	PageBean<Accelation> getSensorAccelationList(Accelation entity, Integer currentPage, Integer pageSize);

	PageBean<StatisticalManagement> getAccrelationCountManage(String name, Integer currentPage, Integer pageSize);

	List<Accelation> syncAccelationData(HashMap<String, Object> paramMap);

	List<Accelation> getAllItems();

	/*
	 * List<Object> getAccrelationCountManage(Accelation entity, Integer
	 * currentPage, Integer pageSize);
	 */
}
