package com.glass.entity.cq;

import java.math.BigDecimal;

import lombok.Data;
@Data
public class StockBasicInfoCq {
	private Integer id;
	private String compId;//被投资公司id
	private String compUscd;//被投资公司uscd
	private String investCompId;//投资公司id
	private String investCompName;//投资公司名称
	private String investCompUscd;//投资公司uscd
	private String investDate;//投资时间
	private BigDecimal subContribution;//认缴金额（万元）
	private String subDate;//认缴日期
	private BigDecimal actualContribution;//实缴金额（万元）
	private String actualDate;//实缴日期
	private BigDecimal stockPercent;//持股比例（%）
	private String isGroup;//是否属于集团管控企业
	private String investType;//股东类型
	private String subType;//认缴方式
	private String actualType;//实缴方式
	private String currencyType;//实缴币种
	private String subscribedCurrencyType;//认缴币种
	private BigDecimal rmbAfterDep;//折后人民币

	// 通用字段
	private String createPersonName;
	private String createPersonId;
	private String createDate;
	private String lastModifyPersonId;
	private String lastModifyPersonName;
	private String lastModifyDate;
	private Boolean isDel;
	private String approvalState;
	
}
