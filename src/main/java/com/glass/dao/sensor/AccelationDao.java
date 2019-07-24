package com.glass.dao.sensor;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
public interface AccelationDao {
	List<Accelation> getSensorAccelationList(Accelation entity);

	List<Object> getAccrelationCountManage(Accelation entity, Integer currentPage, Integer pageSize);
}
