package com.glass.entity.hr;

import lombok.Data;
//审核意见列表
@Deprecated
public class HrAgreementInfo {
	private Integer id;//审核信息表中的id
	private Integer hrInfoId;//人事信息表中的id
	private String name;//审核人姓名
	private String time;//审核时间
	private String result;//审核结果
	private String opinion;//审核意见
	
	
}
