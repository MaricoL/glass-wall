package com.glass.controller.sensor;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.glass.entity.sensor.Gyro;
import com.glass.entity.sensor.SensorBase;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.service.sensor.IGyroService;
import com.glass.service.sensor.ISensorBaseService;
import com.glass.util.ExcelUtil;
import com.glass.util.PageBean;

//import com.glass.util.PageBean;

@Controller
@RequestMapping("/gyro")
public class GyroController {
	private DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	@Autowired
	private IGyroService gyroService;
	@Autowired
	private ISensorBaseService sensorBaseService;

	@RequestMapping("/_list")
	public String sensorAngleListPage(Gyro entity, Integer currentPage, Map<String, Object> map,
			HttpServletRequest request) {
		// HttpSession session = request.getSession();
		// List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		// entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Gyro> pageBean = gyroService.getSensorGyroList(entity, currentPage, 10);
		List<SensorBase> nameList = sensorBaseService.getByType(1);
		map.put("nameList", nameList);
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "sensor/sensorGyroManage";
	}

	@RequestMapping("/countManage")
	public String gyroCountManage(String name, Integer currentPage, Map<String, Object> map,
			HttpServletRequest request) {
		// HttpSession session = request.getSession();
		// List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		// entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<StatisticalManagement> pageBean = gyroService.getGyroCountManage(name, currentPage, 10);
		map.put("pageBean", pageBean);
		map.put("name", name);
		return "sensor/gyroCountManage";
	}

	@RequestMapping("/export")
	public void exportGyroData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Gyro> gyroList = gyroService.getAllItems();
		String[] title = { "序列", "传感器名称", "位置名称", "Gyro_x", "Gyro_y", "Gyro_z", "创建日期" };
		String fileName = "陀螺仪传感器数据：" + df.format(new Date(System.currentTimeMillis())) + ".xls";
		String sheetName = "陀螺仪传感器数据";
		String content[][] = new String[gyroList.size()][title.length];
		for (int i = 0, j = 0; i < gyroList.size(); i++, j = 0) {
			Gyro obj = gyroList.get(i);
			content[i][j++] = String.valueOf(i + 1);
			if (obj.getSensorName() != null) {
				content[i][j++] = obj.getSensorName();
			}
			if (obj.getDescription() != null) {
				content[i][j++] = obj.getDescription();
			}
			if (obj.getXvalue() != null) {
				content[i][j++] = obj.getXvalue();
			}
			if (obj.getYvalue() != null) {
				content[i][j++] = obj.getYvalue();
			}
			if (obj.getZvalue() != null) {
				content[i][j++] = obj.getZvalue();
			}
			if (obj.getCreateTime() != null) {
				content[i][j++] = obj.getCreateTime();
			}
		}

		HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, new HSSFWorkbook());
		OutputStream os = null;
		// 响应到客户端
		try {
			this.setResponseHeader(response, fileName);
			os = response.getOutputStream();
			wb.write(os);
			os.flush();
			/* os.close(); */
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (os != null) {
				os.close();
			}
		}

	}

	// 发送响应流方法
	public void setResponseHeader(HttpServletResponse response, String fileName) {
		try {
			try {
				fileName = new String(fileName.getBytes(), "ISO8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/octet-stream;charset=ISO8859-1");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			response.addHeader("Pargam", "no-cache");
			response.addHeader("Cache-Control", "no-cache");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
