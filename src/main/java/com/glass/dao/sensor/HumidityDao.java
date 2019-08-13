package com.glass.dao.sensor;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Humidity;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.entity.sensor.Temperture;
public interface HumidityDao {

	List<Humidity> getSensorHumidityist(Humidity entity);

	List<Object> getHumidityCountManage(String name, Integer currentPage, Integer pageSize);
	
	List<Humidity> exportHumidityList();
}
