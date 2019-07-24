package com.glass.dao.sensor;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Strain;
public interface StrainDao {

	List<Strain> getSensorStrainList(Strain entity);

	List<Object> getStrainCountManage(Strain entity, Integer currentPage, Integer pageSize);
}
