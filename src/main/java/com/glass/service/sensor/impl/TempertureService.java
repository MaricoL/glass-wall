package com.glass.service.sensor.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.TempertureDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Temperture;
import com.glass.service.sensor.ITempertureService;
import com.glass.util.PageBean;

@Service("TempertureService")
public class TempertureService implements ITempertureService {

	private Integer lastTemperatureId = 0;

	@Autowired
	private TempertureDao sensorDao;

	@Override
	public PageBean<Temperture> getSensorTempertureList(Temperture entity, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Temperture> allSensorAngle = sensorDao.getSensorTempertureList(entity);

		PageBean<Temperture> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(allSensorAngle);

		return pageBean;
	}

	@Override
	public PageBean<StatisticalManagement> getTempertureCountManage(String name, Integer currentPage,
			Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Object> list = sensorDao.getTempertureCountManage(name, currentPage, pageSize);
		List<StatisticalManagement> allSensorStatistica = new ArrayList<StatisticalManagement>();
		/*
		 * List<Accelation> allSensorAngle = sensorDao.getSensorAccelationList(entity);
		 */
		if (list != null && list.size() > 0) {

			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map = (Map<String, Object>) list.get(i);
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

		PageBean<StatisticalManagement> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(),
				page.getTotal());
		pageBean.setItems(allSensorStatistica);
		return pageBean;
	}

	@Override
	public List<Temperture> syncTemperatureData(HashMap<String, Object> paramMap) {
		paramMap.put("lastTemperatureId", this.lastTemperatureId);
		List<Temperture> tempertureList = sensorDao.syncTemperatureData(paramMap);
		if (tempertureList == null || tempertureList.size() == 0) {
			Temperture temperture = new Temperture();
			temperture.setValue("0");
			temperture.setCreateTime("空值");
			return Arrays.asList(temperture);
		}
		for (Temperture temperture : tempertureList) {
			temperture.setValue(temperture.getValue() == null || temperture.getValue().equals("") ? String.valueOf(-1)
					: temperture.getValue());
		}
		if (paramMap.get("startTime").equals("null") && paramMap.get("endTime").equals("null")) {
			this.lastTemperatureId = tempertureList.get(tempertureList.size() - 1).getId();
		}

		return tempertureList;
	}

}
