package com.glass.entity.check;

//import com.softline.entity.Criminal.CriminalInfo;

import lombok.Data;

@Data
public class SysExamine implements java.io.Serializable {

	// Fields
	
	private Integer id;
	private String examineStr;
	private String examResult;
	private Integer examentityId;
	private Integer examKind;
	private Integer isDel;
	private String createPersonName;
	private String createPersonId;
	private String createDate;
	private String lastModifyPersonId;
	private String lastModifyPersonName;
	private String lastModifyDate;
	private String examresultName;


}