package com.glass.service.sensor.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.AccelationDao;
import com.glass.dao.sensor.GyroDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.Gyro;
import com.glass.entity.sensor.Temperture;
import com.glass.service.sensor.IAccelationService;
import com.glass.service.sensor.IGyroService;
import com.glass.util.PageBean;
@Service("GyroService")
public class GyroService implements IGyroService {
	@Autowired
	private GyroDao gyroDao;


	@Override
	public PageBean<Gyro> getSensorGyroList(Gyro entity, Integer currentPage, Integer pageSize) {
		//固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<Gyro> allSensorAngle = gyroDao.getSensorGyroList(entity);
		
		
		PageBean<Gyro> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allSensorAngle);
		
		return pageBean;
			
	}


	@Override
	public List<Object> getGyroCountManage(Gyro entity, Integer currentPage, Integer pageSize) {
       List<Object> list = gyroDao.getGyroCountManage(entity,currentPage,pageSize);
		
		return list;
	}
}
