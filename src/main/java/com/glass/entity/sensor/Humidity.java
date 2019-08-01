package com.glass.entity.sensor;

import lombok.Data;

@Data
public class Humidity {
	//表名sensor_angle
	private Integer id;
	private String uuid;
	private String sensorName;//传感器名称
	private String value;//值
	private String createTime;//生成时间	
}
