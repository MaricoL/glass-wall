package com.glass.service.sensor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.glass.dao.sensor.SensorBaseDao;
import com.glass.entity.sensor.SensorBase;
import com.glass.service.sensor.ISensorBaseService;

@Service("SensorBaseService")
public class SensorBaseService implements ISensorBaseService {

	@Autowired
	private SensorBaseDao sensorBaseDao;
	
	@Override
	public List<SensorBase> getByType(Integer type) {
		// TODO Auto-generated method stub
		return sensorBaseDao.getByType(type);
	}




}
