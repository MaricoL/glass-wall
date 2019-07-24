package com.glass.service.sensor;

import com.glass.entity.sensor.Sensor;
import com.glass.util.PageBean;

public interface ISensorService {

	PageBean<Sensor> getSensorList(Sensor sensor, Integer currentPage, Integer pageSize);

}
