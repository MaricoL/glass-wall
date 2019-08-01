package com.glass.service.sensor;

import java.util.HashMap;
import java.util.List;

import com.glass.entity.sensor.Gyro;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.util.PageBean;

public interface IGyroService {

	PageBean<Gyro> getSensorGyroList(Gyro entity, Integer currentPage, Integer pageSize);

	PageBean<StatisticalManagement> getGyroCountManage(String name, Integer currentPage, Integer pageSize);

	List<Gyro> syncGyroData(HashMap<String, Object> paramMap);
}
