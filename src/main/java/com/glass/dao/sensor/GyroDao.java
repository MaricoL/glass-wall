package com.glass.dao.sensor;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Gyro;
public interface GyroDao {

	List<Gyro> getSensorGyroList(Gyro entity);

	List<Object> getGyroCountManage(Gyro entity, Integer currentPage, Integer pageSize);
}
