package com.glass.dao.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.Gyro;

public interface GyroDao {

	List<Gyro> getSensorGyroList(Gyro entity);

	List<Object> getGyroCountManage(String name, Integer currentPage, Integer pageSize);

	List<Gyro> syncGyroData(HashMap<String, Object> paramMap);

	List<Gyro> getAllItems();
}
