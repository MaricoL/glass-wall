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
import com.glass.dao.sensor.AccelationDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.service.sensor.IAccelationService;
import com.glass.util.PageBean;

@Service("AccelationService")
public class AccelationService implements IAccelationService {

	private Integer lastAccelationId = 0;

	@Autowired
	private AccelationDao accelationDao;

	@Override
	public PageBean<Accelation> getSensorAccelationList(Accelation entity, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Accelation> allSensorAngle = accelationDao.getSensorAccelationList(entity);

		PageBean<Accelation> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(allSensorAngle);

		return pageBean;
	}

	@Override
	public PageBean<StatisticalManagement> getAccrelationCountManage(String name, Integer currentPage,
			Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Object> list = accelationDao.getAccrelationCountManage(name, currentPage, pageSize);
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
	public List<Accelation> syncAccelationData(HashMap<String, Object> paramMap) {
		paramMap.put("lastAccelationId", this.lastAccelationId);
		List<Accelation> accelationList = accelationDao.syncAccelationData(paramMap);
		if (accelationList == null || accelationList.size() == 0) {
			Accelation accelation = new Accelation();
			accelation.setXvalue("0");
			accelation.setYvalue("0");
			accelation.setZvalue("0");
			accelation.setCreateTime("空值");
			return Arrays.asList(accelation);
		}
		for (Accelation accelation : accelationList) {
			accelation
					.setXvalue(accelation.getXvalue() == null || accelation.getXvalue().equals("") ? String.valueOf(-1)
							: accelation.getXvalue());
			accelation
					.setYvalue(accelation.getYvalue() == null || accelation.getYvalue().equals("") ? String.valueOf(-1)
							: accelation.getYvalue());
			accelation
					.setZvalue(accelation.getZvalue() == null || accelation.getZvalue().equals("") ? String.valueOf(-1)
							: accelation.getZvalue());
		}
		if (paramMap.get("startTime").equals("null") && paramMap.get("endTime").equals("null")) {
			this.lastAccelationId = accelationList.get(accelationList.size() - 1).getId();
		}

		return accelationList;
	}

	@Override
	public List<Accelation> getAllItems() {
		return accelationDao.getAllItems();
	}

	/*
	 * @Override public List<Object> getAccrelationCountManage(Accelation entity,
	 * Integer currentPage, Integer pageSize) {
	 * 
	 * List<Object> list =
	 * sensorDao.getAccrelationCountManage(entity,currentPage,pageSize);
	 * 
	 * return list; }
	 */
}
