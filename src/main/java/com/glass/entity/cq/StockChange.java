package com.glass.entity.cq;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class StockChange {
	private Integer id;
	private String compId;//被投资公司id
	private String compName;//被投资公司名称
	private String compUscd;//被投资公司uscd
	private String oldSto;//投资公司历史信息
	private String newSto;//投资公司最新信息
	private String time;//投资时间
	
	// 通用字段
	private Boolean isDel;
	private String createPersonName;
	private String createPersonId;
	private String createDate;

}
