package com.glass.service.sensor.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.AngleDao;
import com.glass.dao.sensor.AccelationDao;
import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.Accelation;
import com.glass.service.sensor.IAngleService;
import com.glass.service.sensor.IAccelationService;
import com.glass.util.PageBean;
@Service("AngleService")
public class AngleService implements IAngleService {
	@Autowired
	private AngleDao angleDao;
	


	@Override
	public PageBean<Angle> getAngleList(Angle entity, Integer currentPage, Integer pageSize) {
		//固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<Angle> allSensorAngle = angleDao.getAngleList(entity);
		
		
		PageBean<Angle> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allSensorAngle);
		
		return pageBean;
}



	@Override
	public List<Object> getAngleCountManage(Angle entity, Integer currentPage, Integer pageSize) {

		
       List<Object> list = angleDao.getAngleCountManage(entity,currentPage,pageSize);
		
		return list;
	}
}
