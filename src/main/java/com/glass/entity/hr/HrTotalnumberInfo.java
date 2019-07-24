package com.glass.entity.hr;

import lombok.Data;

@Data
public class HrTotalnumberInfo {
	private Integer id;
	private String year;//年份
	private String month;//月份
	private String date;//日期
	private String compId;//公司名称
	private String totalNumber;//员工总人数
	private String employeeNumber;//劳动用工人数
	private String contractWorkerNumber;//合同工人数
	private String noncontractWorkerNumber; //非合同工人数
	private String laborDispatchNumber;//劳务派遣人数
	private String chName;//公司名称
	private String uscd;//统一信用代码
	
	private String leaveNumber;//离职员工数
	
	
	
	//通用字段
	private String createPersonName;//创建人员姓名
	private String createPersonId;//创建人员id
	private String createDate;//创建日期
	private String lastModifyPersonId;//修改人id
	private String lastModifyPersonName;//最后编辑人姓名
	private String lastModifyDate;//最后修改日期
	private Boolean isDel;//记录是否删除
	private String approvalState;//审批状态
	
	// 数据权限管理
	private java.util.List<String> compList;
}
