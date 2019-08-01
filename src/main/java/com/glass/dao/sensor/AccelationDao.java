package com.glass.dao.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.Accelation;

public interface AccelationDao {
	List<Accelation> getSensorAccelationList(Accelation entity);

	List<Object> getAccrelationCountManage(String name, Integer currentPage, Integer pageSize);

	List<Accelation> syncAccelationData(HashMap<String, Object> paramMap);
}
