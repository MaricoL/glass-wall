package com.glass.controller.file;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * 文件
 * @author zhuzhou
 *
 */
@Controller
@RequestMapping("/file")
public class SysFileController {
	@RequestMapping("download")
	public void  download(String _url, String _name,
			HttpServletRequest request,HttpServletResponse resp) throws IOException {
		
		String path = _url;
		File file = new File(path);
		if(file.exists()) {
			resp.setHeader("content-type", "application/octet-stream");
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment;filename=" + new String(_name.getBytes("utf-8"), "ISO-8859-1"));
			byte[] buff = new byte[1024];
			BufferedInputStream bis = null;
			OutputStream os = null;
			try {
				os = resp.getOutputStream();
				bis = new BufferedInputStream(new FileInputStream(file));
				int i = bis.read(buff);
				while (i != -1) {
					os.write(buff, 0, buff.length);
					os.flush();
					i = bis.read(buff);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (bis != null) {
					try {
						bis.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (os != null) {
					try {
						os.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		
	}
	
	
	@RequestMapping("judgedownload")
	@ResponseBody
	public String judgedownload(String _url, String _name,
			HttpServletRequest request,HttpServletResponse resp) throws IOException {
		
		String path =  _url;
		File file = new File(path);
		String a=null;
		if(file.exists()) {
			a="success";
			
		}else {
			a="fail";
		}
		
		return a;
	}
}

