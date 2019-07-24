package com.glass.service.sensor;
import com.glass.util.PageBean;

import java.util.List;

import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
public interface IAccelationService {
	PageBean<Accelation> getSensorAccelationList(Accelation entity, Integer currentPage, Integer pageSize);

	List<Object> getAccrelationCountManage(Accelation entity, Integer currentPage, Integer pageSize);
}
