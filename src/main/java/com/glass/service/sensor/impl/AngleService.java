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
import com.glass.dao.sensor.AngleDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.service.sensor.IAngleService;
import com.glass.util.PageBean;

@Service("AngleService")
public class AngleService implements IAngleService {
	private Integer lastAngleId = 0;

	@Autowired
	private AngleDao angleDao;

	@Override
	public PageBean<Angle> getAngleList(Angle entity, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Angle> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Angle> allSensorAngle = angleDao.getAngleList(entity);

		PageBean<Angle> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(allSensorAngle);

		return pageBean;
	}

	@Override
	public PageBean<StatisticalManagement> getAngleCountManage(String name, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Object> list = angleDao.getAngleCountManage(name, currentPage, pageSize);
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
	public List<Angle> syncAngleData(HashMap<String, Object> paramMap) {
		paramMap.put("lastAngleId", this.lastAngleId);
		List<Angle> angleList = angleDao.syncAngleData(paramMap);
		if (angleList == null || angleList.size() == 0) {
			Angle angle = new Angle();
			angle.setValueone("0");
			angle.setValuetwo("0");
			angle.setValuethree("0");
			angle.setCreateTime("空值");
			return Arrays.asList(angle);
		}
		for (Angle angle : angleList) {
			angle.setValueone(angle.getValueone() == null || angle.getValueone().equals("") ? String.valueOf(-1)
					: angle.getValueone());
			angle.setValuetwo(angle.getValuetwo() == null || angle.getValuetwo().equals("") ? String.valueOf(-1)
					: angle.getValuetwo());
			angle.setValuethree(angle.getValuethree() == null || angle.getValuethree().equals("") ? String.valueOf(-1)
					: angle.getValuethree());
		}
		if (paramMap.get("startTime").equals("null") && paramMap.get("endTime").equals("null")) {
			this.lastAngleId = angleList.get(angleList.size() - 1).getId();
		}

		return angleList;
	}

	@Override
	public List<Angle> getAllItems() {
		return angleDao.getAllItems();
	}

}
