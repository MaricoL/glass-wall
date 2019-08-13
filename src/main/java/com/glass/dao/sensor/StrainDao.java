package com.glass.dao.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.Strain;

public interface StrainDao {

	List<Strain> getSensorStrainList(Strain entity);

	List<Object> getStrainCountManage(String name, Integer currentPage, Integer pageSize);

	List<Strain> syncStrainData(HashMap<String, Object> paramMap);

	List<Strain> getAllItems();
}
