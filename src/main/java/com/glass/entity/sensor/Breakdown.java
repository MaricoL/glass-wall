package com.glass.entity.sensor;

import lombok.Data;

@Data
public class Breakdown {
	private Integer id;
	private String sensorName;//异常点传感器名称
	private String breakdownName;//异常描述
	private String companyName;//处理公司名称
	private String personName;//处理人员名称
	private String mobile;//联系电话
	private Integer isDone;//1未查看 2已查看 3已排除异常
	private String createTime;//创建时间
}
