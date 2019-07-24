package com.glass.service.sensor.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.AccelationDao;
import com.glass.dao.sensor.StrainDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Strain;
import com.glass.service.sensor.IAccelationService;
import com.glass.service.sensor.IStrainService;
import com.glass.util.PageBean;
@Service("StrainService")
public class StrainService implements IStrainService {
	@Autowired
	private StrainDao strainDao;
	


	@Override
	public PageBean<Strain> getSensorStrainList(Strain entity, Integer currentPage, Integer pageSize) {
		//固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<Strain> allSensorAngle = strainDao.getSensorStrainList(entity);
		
		
		PageBean<Strain> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allSensorAngle);
		
		return pageBean;
	}



	@Override
	public List<Object> getStrainCountManage(Strain entity, Integer currentPage, Integer pageSize) {
	       List<Object> list = strainDao.getStrainCountManage(entity,currentPage,pageSize);
			
			return list;
	}
}
