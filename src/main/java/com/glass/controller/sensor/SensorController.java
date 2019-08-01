package com.glass.controller.sensor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glass.entity.sensor.Accelation;
import com.glass.entity.sensor.Angle;
import com.glass.entity.sensor.Gyro;
import com.glass.entity.sensor.Sensor;
import com.glass.entity.sensor.Strain;
import com.glass.entity.sensor.Temperture;
import com.glass.service.sensor.IAccelationService;
import com.glass.service.sensor.IAngleService;
import com.glass.service.sensor.IGyroService;
import com.glass.service.sensor.ISensorService;
import com.glass.service.sensor.IStrainService;
import com.glass.service.sensor.ITempertureService;
import com.glass.util.PageBean;
import com.glass.util.Result;

@Controller
@RequestMapping("/sensor")
public class SensorController {

	@Autowired
	private ISensorService sensorService;

	@Autowired
	private IStrainService strainService;
	@Autowired
	private ITempertureService tempertureService;
	@Autowired
	private IAccelationService accelationService;
	@Autowired
	private IAngleService angleService;
	@Autowired
	private IGyroService gyroService;

	@RequestMapping("/_list")
	public String sensorListPage(Sensor sensor, Integer currentPage, Map<String, Object> map,
			HttpServletRequest request) {
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Sensor> pageBean = sensorService.getSensorList(sensor, currentPage, 10);

		map.put("pageBean", pageBean);
		map.put("conditionEntity", sensor);
		return "sensor/sensorManage";
	}

	@GetMapping("/statistics/{sensorName}/{startTime}/{endTime}")
	@ResponseBody
	public Result getStatistics(Map<String, Object> map, @PathVariable String sensorName,
			@PathVariable(required = false) String startTime, @PathVariable(required = false) String endTime) {
		if (("null").equals(startTime)) {
			startTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
		}

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("sensorName", sensorName);
		paramMap.put("startTime", startTime);
		paramMap.put("endTime", endTime);

		List<Strain> strain = strainService.syncStrainData(paramMap);
		List<Temperture> temperture = tempertureService.syncTemperatureData(paramMap);
		List<Accelation> accelation = accelationService.syncAccelationData(paramMap);
		List<Angle> angle = angleService.syncAngleData(paramMap);
		List<Gyro> gyro = gyroService.syncGyroData(paramMap);

		map.put("strainData", strain);
		map.put("tempertureData", temperture);
		map.put("accelationData", accelation);
		map.put("angleData", angle);
		map.put("gyroData", gyro);
		Result result = new Result(map);
		return result;
	}

}
