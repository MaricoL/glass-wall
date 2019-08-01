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
import com.glass.dao.sensor.GyroDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Gyro;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.service.sensor.IGyroService;
import com.glass.util.PageBean;

@Service("GyroService")
public class GyroService implements IGyroService {

	private Integer lastGyroId = 0;

	@Autowired
	private GyroDao gyroDao;

	@Override
	public PageBean<Gyro> getSensorGyroList(Gyro entity, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Gyro> allSensorAngle = gyroDao.getSensorGyroList(entity);

		PageBean<Gyro> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(allSensorAngle);

		return pageBean;

	}

	@Override
	public PageBean<StatisticalManagement> getGyroCountManage(String name, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Object> list = gyroDao.getGyroCountManage(name, currentPage, pageSize);
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
	public List<Gyro> syncGyroData(HashMap<String, Object> paramMap) {
		paramMap.put("lastGyroId", this.lastGyroId);
		List<Gyro> gyroList = gyroDao.syncGyroData(paramMap);

		if (gyroList == null || gyroList.size() == 0) {
			Gyro gyro = new Gyro();
			gyro.setXvalue("0");
			gyro.setYvalue("0");
			gyro.setZvalue("0");
			gyro.setCreateTime("空值");
			return Arrays.asList(gyro);
		}
		for (Gyro gyro : gyroList) {
			gyro.setXvalue(
					gyro.getXvalue() == null || gyro.getXvalue().equals("") ? String.valueOf(-1) : gyro.getXvalue());
			gyro.setYvalue(
					gyro.getYvalue() == null || gyro.getYvalue().equals("") ? String.valueOf(-1) : gyro.getYvalue());
			gyro.setZvalue(
					gyro.getZvalue() == null || gyro.getZvalue().equals("") ? String.valueOf(-1) : gyro.getZvalue());
		}
		if (paramMap.get("startTime").equals("null") && paramMap.get("endTime").equals("null")) {
			this.lastGyroId = gyroList.get(gyroList.size() - 1).getId();
		}

		return gyroList;
	}
}
