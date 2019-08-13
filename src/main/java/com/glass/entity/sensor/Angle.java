package com.glass.entity.sensor;

import lombok.Data;

@Data
public class Angle {
	// 表名sensor_angle
	private Integer id;
	private String uuid;
	private String sensorName;// 传感器名称
	private String valueone;// 值
	private String valuetwo;// 值
	private String valuethree;// 值
	private String createTime;// 生成时间
	private String description;

}
