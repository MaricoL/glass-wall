package com.glass.service.sensor.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.AccelationDao;
import com.glass.dao.sensor.TempertureDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Temperture;
import com.glass.service.sensor.IAccelationService;
import com.glass.service.sensor.ITempertureService;
import com.glass.util.PageBean;
@Service("TempertureService")
public class TempertureService implements ITempertureService {
	@Autowired
	private TempertureDao sensorDao;
	
	

	@Override
	public PageBean<Temperture> getSensorTempertureList(Temperture entity, Integer currentPage, Integer pageSize) {
		//固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<Temperture> allSensorAngle = sensorDao.getSensorTempertureList(entity);
		
		
		PageBean<Temperture> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allSensorAngle);
		
		return pageBean;
	}



	@Override
	public List<Object> getTempertureCountManage(Temperture entity, Integer currentPage, Integer pageSize) {
		
	       List<Object> list = sensorDao.getTempertureCountManage(entity,currentPage,pageSize);
			
			return list;
	}


}
