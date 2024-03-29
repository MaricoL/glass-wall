package com.glass.entity.sensor;

import lombok.Data;

@Data
public class Gyro {
	// 表名sensor_gyro
	private Integer id;
	private String uuid;
	private String sensorName;// 传感器名称
	private String xvalue;// x轴值
	private String yvalue;// y轴值
	private String zvalue;// z轴值
	private String createTime;// 生成时间
	private String description;

}
