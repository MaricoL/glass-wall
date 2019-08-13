package com.glass.service.sensor.impl;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.AccelationDao;
import com.glass.dao.sensor.HumidityDao;
import com.glass.dao.sensor.TempertureDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Humidity;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Temperture;
import com.glass.service.sensor.IAccelationService;
import com.glass.service.sensor.IHumidityService;
import com.glass.service.sensor.ITempertureService;
import com.glass.util.PageBean;
@Service("HumidityService")
public class HumidityService implements IHumidityService {
	@Autowired
	private HumidityDao sensorDao;
	
	

	@Override
	public PageBean<Humidity> getSensorHumidityist(Humidity entity, Integer currentPage, Integer pageSize) {
		//固定的加载项
		Page<Humidity> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		List<Humidity> allSensorAngle = sensorDao.getSensorHumidityist(entity);
		
		
		PageBean<Humidity> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
		
		pageBean.setItems(allSensorAngle);
		
		return pageBean;
	}





	@Override
	public PageBean<StatisticalManagement> getHumidityCountManage(String name, Integer currentPage,Integer pageSize) {
		//固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询数据
		  List<Object> list = sensorDao.getHumidityCountManage(name,currentPage,pageSize);
		List<StatisticalManagement> allSensorStatistica = new ArrayList<StatisticalManagement>();
	/*	List<Accelation> allSensorAngle = sensorDao.getSensorAccelationList(entity);*/
		if(list != null && list.size()>0) {

			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map=(Map<String, Object>) list.get(i); 
				StatisticalManagement sta = new StatisticalManagement();
		        sta.setName(map.get("name").toString());
		        sta.setJanuary(map.get("January").toString());
		        sta.setFebruary(map.get("February").toString());
		        sta.setMarch(map.get("March").toString());
		        sta.setApril(map.get("April").toString());
		        sta.setMay(map.get("May").toString());
		        sta.setJune(map.get("June").toString());
		        sta.setJuly(map.get("July").toString());
		        sta.setAugust(map.get("August").toString());
		        sta.setSeptember(map.get("September").toString());
		        sta.setOctober(map.get("October").toString());
		        sta.setNovember(map.get("November").toString());
		        sta.setDecember(map.get("December").toString());
		        allSensorStatistica.add(sta);
			}
		}
	
		PageBean<StatisticalManagement> pageBean = new PageBean<>(page.getPageNum(),page.getPageSize(),page.getTotal());
    	pageBean.setItems(allSensorStatistica);
		return pageBean;
	}
	
	@Override
	public List<Humidity> exportHumidityList(){
		List<Humidity> res = sensorDao.exportHumidityList();
		return res;
	}


}
