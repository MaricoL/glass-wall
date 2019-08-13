package com.glass.service.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.util.PageBean;

public interface IAngleService {

	PageBean<Angle> getAngleList(Angle entity, Integer currentPage, Integer pageSize);

	PageBean<StatisticalManagement> getAngleCountManage(String name, Integer currentPage, Integer pageSize);

	List<Angle> syncAngleData(HashMap<String, Object> paramMap);

	List<Angle> getAllItems();
}
