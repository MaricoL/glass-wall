package com.glass.service.sensor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.glass.dao.sensor.BreakdownDao;

import com.glass.entity.sensor.Breakdown;
import com.glass.service.sensor.IBreakdownService;
import com.glass.util.PageBean;

@Service("BreakdownService")
public class BreakdownService implements IBreakdownService{
	@Autowired
	private BreakdownDao breakdownDao;
	
	@Override
	public PageBean<Breakdown> getBreakdownList(Breakdown entity, Integer currentPage, Integer pageSize){
		//固定的加载项
		Page<Breakdown> page = PageHelper.startPage(currentPage, pageSize);
		//数据库查询
		List<Breakdown> allBreakdown = breakdownDao.getBreakdownList(entity);
		PageBean<Breakdown> pageBean = new PageBean<>(page.getPageNum(), page.getPageSize(), page.getTotal());
		pageBean.setItems(allBreakdown);
		return pageBean;
	}

}
