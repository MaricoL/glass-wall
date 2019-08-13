package com.glass.entity.sensor;

import lombok.Data;

@Data
public class Temperture {
	//表名sensor_temperature
	private Integer id;
	private String uuid;
	private String sensorName;//传感器名称
	private String value;//温度值
	private String createTime;//生成时间
	private String description;//传感器位置描述
}
