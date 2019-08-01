package com.glass.service.sensor;
import com.glass.util.PageBean;

import java.util.List;

import com.glass.entity.sensor.Humidity;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Temperture;
public interface IHumidityService {

	PageBean<Humidity> getSensorHumidityist(Humidity entity, Integer currentPage,Integer pageSize);

	PageBean<StatisticalManagement> getHumidityCountManage(String name, Integer currentPage, Integer pageSize);
}
