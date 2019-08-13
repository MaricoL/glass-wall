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
	private String description;//传感器安装位置称谓
}
