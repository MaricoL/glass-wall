package com.glass.service.sensor;

import java.util.List;

import com.glass.entity.sensor.Breakdown;
import com.glass.util.PageBean;

public interface IBreakdownService {
	PageBean<Breakdown> getBreakdownList(Breakdown entity, Integer currentPage, Integer pageSize);
}
