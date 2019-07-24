package com.glass.service.sensor;
import com.glass.util.PageBean;

import java.util.List;

import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.Gyro;
public interface IGyroService {


	PageBean<Gyro> getSensorGyroList(Gyro entity, Integer currentPage, Integer pageSize);

	List<Object> getGyroCountManage(Gyro entity, Integer currentPage,Integer pageSize);
}
