package com.glass.controller.hr;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.glass.common.Common;
import com.glass.entity.check.SysExamine;
import com.glass.entity.cq.CompanyBasicInfoCq;
import com.glass.entity.hr.HrNumberWithAgreementInfo;
import com.glass.entity.hr.HrTotalnumberInfo;
import com.glass.entity.system.SysBase;
import com.glass.entity.system.SysUser;
import com.glass.service.check.IExamineService;
import com.glass.service.cq.ICqService;
import com.glass.service.hr.IHrService;
import com.glass.service.system.IBaseService;
import com.glass.util.PageBean;


/**
 * 对用户表的增删改查操作。
 * @author wzh
 *
 */
@Controller
@RequestMapping("/hr")
public class HrController {

	@Autowired
	private IHrService hrService;
	
	@Autowired
	private ICqService cqService;
	
	@Autowired
	private IExamineService examineService;
	
	@Autowired
	private IBaseService baseService;
	
	

	
	@RequestMapping("/_list")
	public String hrlistPage(HrTotalnumberInfo entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		List<String> compList = (ArrayList) session.getAttribute("compSession");
		entity.setCompList(compList);
		
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		
		formateDate(entity);
		PageBean<HrTotalnumberInfo> pageBean = hrService.getHrService(entity, currentPage, 10);
		CompanyBasicInfoCq cq = new CompanyBasicInfoCq();
		List<CompanyBasicInfoCq> comList = cqService.getAllComBasicCqInfo(cq);
		
		
		List<SysBase> checkList = baseService.getByGroup(Common.GROUP_CHECK);
        map.put("checkList", checkList);

		map.put("comList", comList);
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "hr/hrList";
	}

	@RequestMapping("/_chklist")
	public String hrchecklistPage(HrTotalnumberInfo entity, Integer currentPage, Map<String, Object> map,HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> compList = (ArrayList) session.getAttribute("compSession");
		entity.setCompList(compList);
		if (currentPage == null || currentPage == 0) {
			currentPage = 1;
		}
		formateDate(entity);
		PageBean<HrTotalnumberInfo> pageBean = hrService.getChkHr(entity, currentPage, 10);
		CompanyBasicInfoCq cq = new CompanyBasicInfoCq();
		List<CompanyBasicInfoCq> comList = cqService.getAllComBasicCqInfo(cq);
		
		
		List<SysBase> checkList = baseService.getByGroup(Common.GROUP_CHECK);
        map.put("checkList", checkList);
		map.put("comList", comList);
		map.put("pageBean", pageBean);
		map.put("conditionEntity", entity);
		return "hr/hrChkList";
	}

	/*
	 * @RequestMapping("/aaa") public String seallistPage(HrTotalnumberInfo entity,
	 * Integer currentPage, Integer pageSize){ HrTotalnumberInfo
	 * hrTotalnumberInfo=new HrTotalnumberInfo();
	 * hrTotalnumberInfo.setCompId("123");; PageBean<HrTotalnumberInfo> pageBean =
	 * hrService.getHrService(hrTotalnumberInfo, 1, 10); return null; }
	 */
	/* 进入人事查看页面 */
	@RequestMapping("/_view")
	public String toHrInfoViewPage(Integer id, Map<String, Object> map) {

		HrTotalnumberInfo com = hrService.getHrInfoById(id);

		map.put("com", com);

		SysExamine sysExamine = new SysExamine();
		sysExamine.setExamentityId(id);
		sysExamine.setExamKind(1);
		List<SysExamine> exList = examineService.getListExamine(sysExamine);
		map.put("exList", exList);
		return "hr/hrView";
//		返回查看页面
	}

	/* 进入人事编辑页面 */
	@RequestMapping("/_edit")
	public String toHrInfoEditPage(Integer id, Map<String, Object> map, HttpServletRequest request) {
		HrTotalnumberInfo com = hrService.getHrInfoById(id);
		if(com != null) {
			com.setDate(com.getYear()+"-"+com.getMonth());
		}
		CompanyBasicInfoCq cq = new CompanyBasicInfoCq();
		
		HttpSession session = request.getSession();
		List<String> compList = (ArrayList) session.getAttribute("compSession");
		cq.setCompList(compList);
		cq.setIsHistory("0");
//		cq.setIsLastest("1");
		cq.setApprovalState("3");
		
		List<CompanyBasicInfoCq> comList = cqService.getAllComBasicCqInfo(cq);//关联产权公司信息
		
		map.put("com", com);
		map.put("comList", comList);
		return "hr/hrAdd";
		//返回编辑页面
	}
	
	
	/* 进入人事变更页面 */
	@RequestMapping("/_modify")
	public String toHrInfoModifyPage(Integer id, Map<String, Object> map, HttpServletRequest request) {
		HrTotalnumberInfo com = hrService.getHrInfoById(id);
		if(com != null) {
			com.setDate(com.getYear()+"-"+com.getMonth());
		}
		CompanyBasicInfoCq cq = new CompanyBasicInfoCq();
		List<CompanyBasicInfoCq> comList = cqService.getAllComBasicCqInfo(cq);
		map.put("comList", comList);
		map.put("com", com);
		return "hr/hrModify";
		//返回查看页面
	}

	
	/**
	 * 异步，新增&编辑
	 * 
	 * @param entity
	 * @return
	 */
	@RequestMapping("/_modifySave")
	@ResponseBody
	public Map<String, Object> modifySave(HrTotalnumberInfo entity) {
		formateDate(entity);
		entity.setApprovalState("1");
		hrService.modifyHr(entity);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", "1");
		map.put("message", "保存成功！");
		return map;

	}
	
	/**
	 * 变更页面上报
	 * @param entity
	 * @return
	 */
	@RequestMapping("/_modifySubmit")
	@ResponseBody
	public Map<String, Object> modifySubmitHrInfo(HrTotalnumberInfo entity) {
		formateDate(entity);
		entity.setApprovalState("2");
		hrService.modifyHr(entity);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", "1");
		map.put("message", "上报成功！");
		return map;
	}
	
	/**
	 * 异步，新增&编辑
	 * 
	 * @param entity
	 * @return
	 */
	@RequestMapping("/_saveOrUpdate")
	@ResponseBody
	public Map<String, Object> saveOrUpdateHr(HrTotalnumberInfo entity,HttpServletRequest request) {
		
		formateDate(entity);
		String time = getCurrentTimeStr();
		entity.setCreateDate(time);
		CompanyBasicInfoCq af = cqService.getCompanyBasicInfoCqById(Integer.parseInt(entity.getCompId()));
		entity.setUscd(af.getUscd());
		SysUser user = (SysUser) request.getSession(false).getAttribute("userSession");
		entity.setCreatePersonId(user.getId().toString());
		
		List<HrTotalnumberInfo> hrInfoList = hrService.getHrWithTimeCompId(entity);
		Map<String, Object> map = new HashMap<String, Object>();
		if(entity.getId() != null) {						
			hrService.updateHr(entity);
			map.put("flag", "1");
			map.put("message", "保存成功！");
		}else {
			if(hrInfoList != null && hrInfoList.size() > 0) {
				map.put("flag", "0");
				map.put("message", "信息已存在！");
			}else {// 新增
				entity.setApprovalState("1");
				entity.setIsDel(false);
				hrService.addHr(entity);				
				map.put("flag", "1");
				map.put("message", "保存成功！");}
			}
		return map;

	}

	@RequestMapping("/_submit")
	@ResponseBody
	public Map<String, Object> submitHrInfo(HrTotalnumberInfo entity,HttpServletRequest request) {
		formateDate(entity);
		
		String time = getCurrentTimeStr();
		entity.setCreateDate(time);
		entity.setApprovalState("2");
		CompanyBasicInfoCq af = cqService.getCompanyBasicInfoCqById(Integer.parseInt(entity.getCompId()));
		entity.setUscd(af.getUscd());
		SysUser user = (SysUser) request.getSession(false).getAttribute("userSession");
		entity.setCreatePersonId(user.getId().toString());
		List<HrTotalnumberInfo> hrInfoList = hrService.getHrWithTimeCompId(entity);
		Map<String, Object> map = new HashMap<String, Object>();
		if(entity.getId() != null) {						
			hrService.modifyHr(entity);
			map.put("flag", "1");
			map.put("message", "上报成功！");
		}else {
			if(hrInfoList != null && hrInfoList.size() > 0) {
				map.put("flag", "0");
				map.put("message", "信息已存在！");
			}else {// 新增
				entity.setIsDel(false);
				hrService.addHr(entity);
				map.put("flag", "1");
				map.put("message", "上报成功！");}
			}
		return map;
	}

	@RequestMapping("/_submitInListPage")
	@ResponseBody
	public Map<String, Object> submitHrInfoInListPage(String id) {
		hrService.submitHrInListPage(Integer.parseInt(id));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", "1");
		map.put("message", "上报成功！");
		return map;
	}

	
	
	@RequestMapping("/_deleteHrInfo")
	@ResponseBody
	public Map<String, Object> deleteHrInfoInListPage(String id) {
		hrService.deleteHrInListPage(Integer.parseInt(id));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", "1");
		map.put("message", "删除成功！");
		return map;
	}
	
	/* 进入审核页面 */
	@RequestMapping("/_agreement")
	public String toHrAgreement(Integer id, Map<String, Object> map, HttpServletRequest request) {
		/*HrTotalnumberInfo com1 = hrService.getHrInfoById(id);*/
		HrTotalnumberInfo com1 = hrService.getHrInfoById(id);
		map.put("com", com1);
		SysExamine sysExamine = new SysExamine();
		sysExamine.setExamentityId(id);
		sysExamine.setExamKind(40);
		List<SysExamine> exList = examineService.getListExamine(sysExamine);
		map.put("exList", exList);
		
		return "hr/hrChkPage";
//		返回查看页面
	}

	/**
	 * 异步，新增&编辑
	 * 审核通过
	 * 
	 * @param entity
	 * @return
	 */
	@RequestMapping("/_chkAgreement")
	@ResponseBody
	public Map<String, Object> chkAgreement(String username,String agreement,String id,HttpServletRequest request) {
		
		String flag = "0";
		String message = "";
		String time = getCurrentTimeStr();
		HrTotalnumberInfo hrInfo = hrService.getHrInfoById(Integer.parseInt(id));
		if (hrInfo != null) {
			SysUser user = (SysUser) request.getSession(false).getAttribute("userSession");
			hrInfo.setLastModifyDate(time);
			hrInfo.setLastModifyPersonId(user.getId().toString());
			hrInfo.setLastModifyPersonName(user.getUserName());
			
			// 设置审核意见信息
			SysExamine se = new SysExamine();
			se.setExamineStr(agreement);
			se.setExamResult("1");// 通过
			se.setExamentityId(Integer.parseInt(id));// 审核对象id
			se.setExamKind(1);// 设置模块顺序id
			se.setIsDel(0);
			se.setCreateDate(time);
			se.setCreatePersonId(user.getId().toString());
			se.setCreatePersonName(user.getUserName());
			se.setLastModifyDate(time);
			se.setLastModifyPersonId(user.getId().toString());
			se.setLastModifyPersonName(user.getUserName());
			hrService.passAgreement(hrInfo,se);
			flag = "1";
			message = "审核成功！";
		}else {
			flag = "0";
			message = "该信息可能已被删除！";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", flag);
		map.put("message", message);
		return map;

	}

	/**
	 * 异步，新增&编辑
	 * 
	 * @param entity
	 * @return
	 */
	@RequestMapping("/_chkBack")
	@ResponseBody
	public Map<String, Object> back(String username,String agreement,String id,HttpServletRequest request) {
		String flag = "0";
		String message = "";
		String time = getCurrentTimeStr();
		HrTotalnumberInfo hrInfo = hrService.getHrInfoById(Integer.parseInt(id));
		if (hrInfo != null) {
			SysUser user = (SysUser) request.getSession(false).getAttribute("userSession");
			hrInfo.setLastModifyDate(time);
			hrInfo.setLastModifyPersonId(user.getId().toString());
			hrInfo.setLastModifyPersonName(user.getUserName());
			
			// 设置审核意见信息
			SysExamine se = new SysExamine();
			se.setExamineStr(agreement);
			se.setExamResult("0");// 退回
			se.setExamentityId(Integer.parseInt(id));// 审核对象id
			se.setExamKind(1);// 设置模块顺序id
			se.setIsDel(0);
			se.setCreateDate(time);
			se.setCreatePersonId(user.getId().toString());
			se.setCreatePersonName(user.getUserName());
			se.setLastModifyDate(time);
			se.setLastModifyPersonId(user.getId().toString());
			se.setLastModifyPersonName(user.getUserName());
			hrService.backAgreement(hrInfo,se);
			flag = "1";
			message = "退回成功！";
		}else {
			flag = "0";
			message = "该信息可能已被删除！";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("flag", flag);
		map.put("message", message);
		return map;

	}
	
	/**
	 * 获取当前时间
	 * @return
	 */
	
	private String getCurrentTimeStr() {
		Date ss = new Date();
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format0.format(ss.getTime());
        return time;
	}
	
	/**
	 * 时间格式化
	 * @param entity
	 */
	
	private void formateDate(HrTotalnumberInfo entity) {
		String date = entity.getDate();
		if(date != null && date.length() > 0) {
			String[] dateArr = date.split("-");
			if(dateArr.length >1) {
				String year = dateArr[0];
				String month = dateArr[1];
				entity.setYear(year);
				entity.setMonth(month);
			}
		}
	}
	
}
