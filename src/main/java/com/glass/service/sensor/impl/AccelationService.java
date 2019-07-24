package com.glass.service.sensor.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.AccelationDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
import com.glass.service.sensor.IAccelationService;
import com.glass.util.PageBean;
@Service("AccelationService")
public class AccelationService implements IAccelationService {
	@Autowired
	private AccelationDao sensorDao;
	
	@Override
	public PageBean<Accelation> getSensorAccelationList(Accelation entity, Integer currentPage, Integer pageSize){
		//固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<Accelation> allSensorAngle = sensorDao.getSensorAccelationList(entity);
		
		
		PageBean<Accelation> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allSensorAngle);
		
		return pageBean;
	}

	@Override
	public List<Object> getAccrelationCountManage(Accelation entity, Integer currentPage, Integer pageSize) {
		
	       List<Object> list = sensorDao.getAccrelationCountManage(entity,currentPage,pageSize);
			
			return list;
	}
}
