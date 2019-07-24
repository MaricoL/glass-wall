package com.glass.entity.cq;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class CqInfoExcel {
	// 产权基础信息
	private Integer rn;// 序号
	private Integer compId;// 企业id
	private String chName;//企业名称
	private String uscd;//统一社会信用代码
	private BigDecimal registCapital;//注册资本
	private String legalName;//法人名称
	private String busRegStatus;//工商登记状态
	private String regAuthority;//登记机关
	private String address;//地址
	private String establishmentTime;//成立时间(1999-01-01)
	private String runPeriod;//经营期限（自-至）
	private String bussinessRange;// 经营范围
	
	// 董监高
	private String djgInfo;// 董监高信息
	
	// 产权信息
	private Integer isHolding1;//是否控股企业（全资）
	private Integer isHolding2;//是否控股企业（控股）
	private Integer isHolding3;//是否控股企业（参股）
	private String isMergeReports;//是否合并报表（是/否）
	private Integer mergeReports;//是否合并报表（1/0）
	private String isRegistration1;//（是/否）
	private Integer isRegistration2;//是否有国资登记（1/0）
	private String operationsStatus;//经营状态
	
	private Integer level;// 公司层级
	
	// 财务信息
	//private BigDecimal paidInCapital;// 实收资本
    private BigDecimal totalAssets;// 总资产（万元）
    private BigDecimal totalLiabilities;// 总负债（万元）
    private BigDecimal netAssets;// 净资产（万元）
    private BigDecimal mainBusinessIncome;//主营业务收入（万元）
    private BigDecimal totalProfit;//利润总额（万元）
    private BigDecimal financingSituation;//融资情况(万元)
    private String economicActivityStatus;//经济活动状态
    private String reportType;//报表类型
    
    // 人事
	private Integer hrCount;// 人事总人数
    
    // 股东
    private String investCompName1;//第一股东名称
    private String investCompName2;//第二股东名称
    private String investCompName3;//第三股东名称
    
    private BigDecimal stockPercent1;//第一股东比例
    private BigDecimal stockPercent2;//第二股东比例
    private BigDecimal stockPercent3;//第三股东比例
    
}
