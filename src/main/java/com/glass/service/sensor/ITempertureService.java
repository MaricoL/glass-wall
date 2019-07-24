package com.glass.service.sensor;
import com.glass.util.PageBean;

import java.util.List;

import com.glass.entity.sensor.Temperture;
public interface ITempertureService {

	PageBean<Temperture> getSensorTempertureList(Temperture entity, Integer currentPage,Integer pageSize);

	List<Object> getTempertureCountManage(Temperture entity, Integer currentPage, Integer pageSize);
}
