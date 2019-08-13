package com.glass.dao.sensor;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glass.entity.sensor.Breakdown;

public interface BreakdownDao {
	List<Breakdown> getBreakdownList(Breakdown entity);
	//List<SensorBase> getByType(@Param("type") Integer type);
}
