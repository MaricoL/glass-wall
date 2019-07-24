package com.glass.entity.check;

import lombok.Data;

@Data
public class SysExamineReport implements java.io.Serializable {

	private Integer id;
	private String examinestr;
	private Integer examresult;
	private String reportTime;
	private Integer groupId;
	private Integer examKind;
	private Integer isdel;
	private String createPersonName;
	private String createPersonId;
	private String createDate;
	private String lastModifyPersonId;
	private String lastModifyPersonName;
	private String lastModifyDate;
	private String organalId;
	private String examresultName;
	
	
	

}