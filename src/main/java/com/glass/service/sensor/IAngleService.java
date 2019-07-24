package com.glass.service.sensor;
import com.glass.util.PageBean;
import com.glass.entity.sensor.Angle;

import java.util.List;

public interface IAngleService {


	PageBean<Angle> getAngleList(Angle entity, Integer currentPage, Integer pageSize);

	List<Object> getAngleCountManage(Angle entity, Integer currentPage, Integer pageSize);
}
