package com.glass.entity.cq;

import java.math.BigDecimal;
import java.util.List;


import lombok.Data;
@Data
public class CompanyBasicInfoCq {
	private Integer id;
	private String establishmentTime;//成立时间(1999-01-01)
	private String checkTime;//核准时间(1999-01-01)
	private String uscd;//统一社会信用代码
	private String regNumber;//工商注册号
	private String tin;//纳税人识别号
	private String orgCode;//组织机构代码
	private String chName;//企业名称
	private String enName;//公司外文名
	private String compProfile;//公司简介
	private BigDecimal registCapital;//注册资本
	private String operationsStatus;//经营状态
	private String busRegStatus;//工商登记状态
	private String mergeReports;//是否合并报表
	private String isRegistration;//是否有国资登记
	private String compType;//公司类型
	private String industry;//所属行业
	private String region;//所属地区
	private String regAuthority;//登记机关
	private String personAmount;//人员规模
	private String isHolding;//是否控股企业
	private String runTime;//经营期限自
	private String endTime;//经营期限至
	private String legalName;//法人名称
	private Integer sort;//排序
	private String tel;//电话
	private String website;//官网
	private String email;//邮箱
	private String address;//地址
	private String isHistory;//是否历史数据
	private String version;// 版本号
	private String isLastest;// 是否最新数据
	private Integer lastVersionId;// 之前最新版本的id
	private String bussinessRange;// 经营范围
	private String remark;// 备注
	private String reasonFile;// 附件路径
	private String abbreviation;//简称
	private String offAddress;//办公地址
	private String currencyType;//币种
	private BigDecimal rmbAfterDep;//折后人民币
	private String revokeDate;//吊销日期
	// 通用字段
	private String createPersonName;
	private String createPersonId;
	private String createDate;
	private String lastModifyPersonId;
	private String lastModifyPersonName;
	private String lastModifyDate;
	private Boolean isDel;
	private String approvalState;
	
	List<StockBasicInfoCq> stockList;
	// 数据权限管理
	private java.util.List<String> compList;
}
