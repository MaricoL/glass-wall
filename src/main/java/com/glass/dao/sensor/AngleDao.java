package com.glass.dao.sensor;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.Accelation;
public interface AngleDao {

	List<Angle> getAngleList(Angle entity);

	List<Object> getAngleCountManage(Angle entity, Integer currentPage, Integer pageSize);
}
