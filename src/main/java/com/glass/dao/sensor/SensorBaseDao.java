package com.glass.dao.sensor;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glass.entity.sensor.SensorBase;

public interface SensorBaseDao {

	List<SensorBase> getByType(@Param("type") Integer type);

}
