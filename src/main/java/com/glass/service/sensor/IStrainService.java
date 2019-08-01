package com.glass.service.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Strain;
import com.glass.util.PageBean;

public interface IStrainService {

	PageBean<Strain> getSensorStrainList(Strain entity, Integer currentPage, Integer pageSize);

	PageBean<StatisticalManagement> getStrainCountManage(String name, Integer currentPage, Integer pageSize);

	List<Strain> syncStrainData(HashMap<String, Object> paramMap);

}
