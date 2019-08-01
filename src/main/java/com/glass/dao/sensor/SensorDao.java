package com.glass.dao.sensor;

import java.util.List;

import com.glass.entity.sensor.Sensor;

public interface SensorDao {

	List<Sensor> getSensorList(Sensor sensor);

	List<Sensor> syncSensorData();

}
