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
import com.glass.dao.sensor.StrainDao;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Strain;
import com.glass.service.sensor.IStrainService;
import com.glass.util.PageBean;

@Service("StrainService")
public class StrainService implements IStrainService {

	private Integer lastStrainId = 0;

	@Autowired
	private StrainDao strainDao;

	@Override
	public PageBean<Strain> getSensorStrainList(Strain entity, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Strain> allSensorAngle = strainDao.getSensorStrainList(entity);

		PageBean<Strain> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());

		pageBean.setItems(allSensorAngle);

		return pageBean;
	}

	@Override
	public PageBean<StatisticalManagement> getStrainCountManage(String name, Integer currentPage, Integer pageSize) {
		// 固定的加载项
		Page<Accelation> page = PageHelper.startPage(currentPage, pageSize);
		// 数据库查询数据
		List<Object> list = strainDao.getStrainCountManage(name, currentPage, pageSize);
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
	public List<Strain> syncStrainData(HashMap<String, Object> paramMap) {
		paramMap.put("lastStrainId", this.lastStrainId);
		List<Strain> strainList = strainDao.syncStrainData(paramMap);
		if (strainList == null || strainList.size() == 0) {
			Strain strain = new Strain();
			strain.setValue("0");
			strain.setCreateTime("空值");
			return Arrays.asList(strain);
		}
		for (Strain strain : strainList) {
			strain.setValue(
					strain.getValue() == null || strain.getValue().equals("") ? String.valueOf(-1) : strain.getValue());
		}
		if (paramMap.get("startTime").equals("null") && paramMap.get("endTime").equals("null")) {
			this.lastStrainId = strainList.get(strainList.size() - 1).getId();
		}

		return strainList;

	}

	@Override
	public List<Strain> getAllItems() {
		return strainDao.getAllItems();
	}

}
