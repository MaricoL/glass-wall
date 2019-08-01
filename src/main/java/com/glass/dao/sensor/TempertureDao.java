package com.glass.dao.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.Temperture;

public interface TempertureDao {

	List<Temperture> getSensorTempertureList(Temperture entity);

	List<Object> getTempertureCountManage(String name, Integer currentPage, Integer pageSize);

	List<Temperture> syncTemperatureData(HashMap<String, Object> paramMap);
}
