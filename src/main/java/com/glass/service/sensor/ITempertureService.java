package com.glass.service.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Temperture;
import com.glass.util.PageBean;

public interface ITempertureService {

	PageBean<Temperture> getSensorTempertureList(Temperture entity, Integer currentPage, Integer pageSize);

	PageBean<StatisticalManagement> getTempertureCountManage(String name, Integer currentPage, Integer pageSize);

	List<Temperture> syncTemperatureData(HashMap<String, Object> paramMap);
}
