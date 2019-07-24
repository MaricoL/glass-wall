package com.glass.entity.system;

import lombok.Data;

@Data
public class SysBase {
    private Integer id;
    private String num;
    private String desc;
    private String group;
    private String remark;
    private Integer seq;
    private String pNum;
    private String parentNum;
    private Boolean isDel;
}