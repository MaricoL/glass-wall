package com.glass.service.sensor;

import java.util.List;

import com.glass.entity.sensor.SensorBase;

public interface ISensorBaseService {

	List<SensorBase> getByType(Integer type);

}
