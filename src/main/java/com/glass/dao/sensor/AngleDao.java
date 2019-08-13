package com.glass.dao.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.Angle;

public interface AngleDao {

	List<Angle> getAngleList(Angle entity);

	List<Object> getAngleCountManage(String name, Integer currentPage, Integer pageSize);

	List<Angle> syncAngleData(HashMap<String, Object> paramMap);

	List<Angle> getAllItems();
}
