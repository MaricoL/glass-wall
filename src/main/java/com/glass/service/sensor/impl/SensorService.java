package com.glass.service.sensor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.SensorDao;
import com.glass.entity.sensor.Sensor;
import com.glass.service.sensor.ISensorService;
import com.glass.util.PageBean;

@Service("SensorService")
public class SensorService implements ISensorService {
	@Autowired
	private SensorDao sensorDao;

	@Override
	public PageBean<Sensor> getSensorList(Sensor sensor, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Sensor> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Sensor> allSensorAngle = sensorDao.getSensorList(sensor);

		PageBean<Sensor> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(allSensorAngle);

		return pageBean;
	}

	public List<Sensor> syncSensorData() {
		return sensorDao.syncSensorData();
	}

}
