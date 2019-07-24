package com.glass.entity.sensor;

import lombok.Data;

// 传感器数据综合综合查询
@Data
public class Sensor {
	private String uuid;
	private String sensorName;
	private Accelation accelation;
	private Angle angle;
	private Strain strain;
	private Temperture temperture;
	private Gyro gyro;

}
