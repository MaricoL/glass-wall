package com.glass;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


/**
 * 打成war包后在外部tomcat中调用
 * @author yxk
 *
 */
public class GlassWallTomcatApplication extends  SpringBootServletInitializer{
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(GlassWallApplication.class);
	}

}
