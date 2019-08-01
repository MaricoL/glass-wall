package com.glass.util;

import java.util.LinkedList;

import org.springframework.stereotype.Component;

import com.glass.entity.sensor.Strain;

import lombok.extern.slf4j.Slf4j;

/**
 * 定时任务使用的例子
 * 
 * @author sht
 *
 */

@Component
@Slf4j
public class SchedulingConfig {
	public static LinkedList<Strain> strainData = new LinkedList<>();
	/*
	 * @Resource(name = "userServiceT") private IUserService userService;
	 */

	/**
	 * 每5秒执行一次
	 */
//	@Scheduled(cron = "0/5 * * * * *")
	public void getToken() {
//		log.info("getToken定时任务启动");
	}

}
