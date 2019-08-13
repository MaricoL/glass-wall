package com.glass.controller.sensor;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.glass.entity.sensor.Humidity;
import com.glass.entity.sensor.SensorBase;
import com.glass.entity.sensor.StatisticalManagement;
import com.glass.service.sensor.IHumidityService;
import com.glass.service.sensor.ISensorBaseService;
import com.glass.util.ExcelUtil;
import com.glass.util.PageBean;

//import com.glass.util.PageBean;

@Controller
@RequestMapping("/humidity")
public class HumidityController {

	@Autowired
	private IHumidityService humidityService;
	@Autowired
	private ISensorBaseService sensorBaseService;

	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@RequestMapping("/_list")
	public String sensorHumidityListPage(Humidity entity, Integer currentPage, Map<String, Object> map,
			HttpServletRequest request) {
		// HttpSession session = request.getSession();
		// List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		// entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<Humidity> pageBean = humidityService.getSensorHumidityist(entity, currentPage, 10);
		List<SensorBase> nameList = sensorBaseService.getByType(1);
		map.put("nameList", nameList);
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "sensor/sensorHumidityManage";
	}

	@RequestMapping("/countManage")
	public String humidityCountManage(String name, Integer currentPage, Map<String, Object> map,
			HttpServletRequest request) {
		// HttpSession session = request.getSession();
		// List<String> angleList = (ArrayList) session.getAttribute("angleSession");
		// entity.setAngleList(angleList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		PageBean<StatisticalManagement> pageBean = humidityService.getHumidityCountManage(name, currentPage, 10);
		map.put("pageBean", pageBean);
		map.put("name", name);
		return "sensor/humidityCountManage";
	}

	@RequestMapping(value = "/_export")
	@ResponseBody
	public void exportHumidityList(Humidity entity, Map<String, String> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Humidity> checkList = humidityService.exportHumidityList();
		String[] title = { "序号", "传感器名称", "位置名称", "RH", "创建时间" };
		String fileName = "传感器湿度表" + df.format(new Date(System.currentTimeMillis())) + ".xls";
		String sheetName = "传感器湿度表";
		String content[][] = new String[checkList.size()][title.length];
		for (int i = 0; i < checkList.size(); i++) {
			Humidity obj = checkList.get(i);
			content[i][0] = String.valueOf(i + 1);
			if (obj.getSensorName() != null) {
				content[i][1] = obj.getSensorName().toString();
			}
			if (obj.getDescription() != null) {
				content[i][2] = obj.getDescription().toString();
			}
			if (obj.getValue() != null) {
				content[i][3] = obj.getValue().toString();
			}
			if (obj.getCreateTime() != null) {
				content[i][4] = obj.getCreateTime().toString();
			}
//	   if (obj.getStandardName() != null) {
//	    content[i][5] = obj.getStandardName().toString();
//	   }
//	   if (obj.getFieldName() != null) {
//	    content[i][6] = obj.getFieldName().toString();
//	   }
//	   if (obj.getDescription() != null) {
//	    content[i][7] = obj.getDescription().toString();
//	   }
//	   if (obj.getFieldType() != null) {
//	    content[i][8] = obj.getFieldType().toString();
//	   }
//	   if (obj.getLength() != null) {
//	    content[i][9] = obj.getLength().toString();
//	   }

		}
		HSSFWorkbook wb = new HSSFWorkbook();
		wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, wb);
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
