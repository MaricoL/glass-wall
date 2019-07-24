package com.glass.service.sensor;
import java.util.List;
import com.glass.util.PageBean;
import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Strain;
public interface IStrainService {

	PageBean<Strain> getSensorStrainList(Strain entity, Integer currentPage, Integer pageSize);

	List<Object> getStrainCountManage(Strain entity, Integer currentPage, Integer pageSize);
}
