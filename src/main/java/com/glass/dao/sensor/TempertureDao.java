package com.glass.dao.sensor;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Temperture;
public interface TempertureDao {

	List<Temperture> getSensorTempertureList(Temperture entity);

	List<Object> getTempertureCountManage(Temperture entity, Integer currentPage, Integer pageSize);
}
