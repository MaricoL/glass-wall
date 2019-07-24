<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>人事信息变更页面</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />
<!--[if lt IE 9]>
    <script src='${pageContext.request.contextPath}/assets/javascripts/html5shiv.js' type='text/javascript'></script>
    <![endif]-->

<!-- / flatty theme -->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/light-theme.css'
	id='color-settings-body-color' media='all' rel='stylesheet'
	type='text/css' />	
	
<link href='${pageContext.request.contextPath}/assets/stylesheets/bootstrap/bootstrap.css' rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/assets/font/iconfont.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/assets/css/demo.css" rel="stylesheet" type="text/css">
<!-- / window 弹出提示-->
<link href='${pageContext.request.contextPath}/css/window.css' rel='stylesheet' type='text/css' />
<!-- / jquery -->
<script src='${pageContext.request.contextPath}/js/jquery.min.js' type='text/javascript'></script>
<script src='${pageContext.request.contextPath}/js/window.js' type='text/javascript'></script>
<!-- 时间插件 -->
<link href='${pageContext.request.contextPath}/css/jedate.css' rel='stylesheet' type='text/css' />
<!-- 校验 -->
<link href='${pageContext.request.contextPath}/css/vaild.css' rel='stylesheet' type='text/css' />
<!-- 校验 -->
<script src='${pageContext.request.contextPath}/js/vaild.js' type='text/javascript'></script>
<!-- 日期插件 -->
<script src='${pageContext.request.contextPath}/js/jquery.jedate.min.js' type='text/javascript'></script>

</head>
<body>

<form accept-charset="UTF-8" id="form1" method="post" style="margin-bottom: 0;" enctype="multipart/form-data">
	<div class="main_title">人事信息变更</div>
	
	<div class="container">
		<div class="list_container">
			<div class="table_container_title">人事信息变更与编辑<i class="iconfont icon-tianjia"></i></div>
				<table class="popup_table" >
					<tr>
						<td width="10%"><span class="red">*</span>日期：</td>
						<td width="40%">
							<input id="date" name="date" class="time" readonly="readonly" placeholder="日期：" value="${com.date }" check="NotEmpty"></td>
						<td width="10%"><span class="red">*</span>单位名称：</td>
						<td width="40%">
							<select class="input-block-level" name="compId" id="compId">
								<option value="${com.compId }">----请选择----</option>
								<c:forEach items="${comList}" var="item" varStatus="status">
									<option value="${item.id}"
										<c:if test="${com.compId == item.id}">selected=selected</c:if>>${item.chName}
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td><span class="red">*</span>劳动用工人数：</td>
						<td>
							<input id="employeeNumber" name="employeeNumber" placeholder="劳动用工人数：" type="text" value="${com.employeeNumber }" check="NotEmpty">
						</td>
						<td><span class="red">*</span>离岗人数：</td>
						<td>
							<input id="leaveNumber" name="leaveNumber" placeholder="离岗职工数" type="text" value="${com.leaveNumber}" check="NotEmpty_double_21_0_*_0_9999999999999999">
						</td>
					</tr>
					<tr>
						<td><span class="red">*</span>合同工人数：</td>
						<td>
							<input id="contractWorkerNumber" name="contractWorkerNumber" placeholder="合同工人数：" type="text" value="${com.contractWorkerNumber }" check="NotEmpty">
						</td>
						<td><span class="red">*</span>非合同工人数：</td>
						<td>
							<input id="noncontractWorkerNumber" name="noncontractWorkerNumber" placeholder="非合同工人数：" type="text" value="${com.noncontractWorkerNumber }" check="NotEmpty">
						</td>
					</tr>
				</table>
				<input id="id" name="id" type="hidden" value ="${com.id }" >
				<input type="hidden" name="isDel" value=0 /> 
			</div>
			<div class="popup_button_container">
				<input type="button" class="popup_button main_button" onclick="_save();" value="暂存">
				<input type="button" class="popup_button main_button" onclick="_submit();" value="上报">
				<input type="button" class="popup_button blue_button" onclick="_close();" value="关闭">
			</div>
		</div>
</form>
</body>
</html>


<script src='${pageContext.request.contextPath}/assets/javascripts/bootstrap/bootstrap.min.js' type='text/javascript'></script>


<!-- 完成新增与更改 -->
<script type="text/javascript">

	$("#loading").hide();
	
	$('input.time').jeDate({
		format:"YYYY-MM"
	});
	$("#createPersonName").val($("#username").val());
	  /* 保存 */
		function _save(){
			if(!vaild.all())
			{
				return false;
			}
			var url = '${pageContext.request.contextPath}/hr/_modifySave';
			if(check()){
			$.ajax({
			    type: 'post',
			    url: url,
			    dateType:'text',
			    data: $("#form1").serialize(),
			    beforeSend:function(XMLHttpRequest){
			    	$("#loading").show();
		         },
			    success: function(data) {
			        if(data.flag == "1"){
			        	win.successAlert(data.message, function() {
							window.close();
						});
						window.opener.location.reload();
			        }else {
			        	parent.win.errorAlert("保存失败！"+data.message,function(){});
			        }
			    },
			    complete:function(XMLHttpRequest,textStatus){
			    	$("#loading").hide();
		           },
	
			    error:function(){
			    	parent.win.errorAlert("保存失败！",function(){});
			    }
			});
			}
		}
	  
	  /* 上报人事信息 */
		function _submit(){
			if(!vaild.all())
			{
				return false;
			}
		  if(check()){
			  parent.win
				.confirm(
						'确定要上报吗？',
						function(r) {
							if (r) {
								var url = '${pageContext.request.contextPath}/hr/_modifySubmit'; 
								$.ajax({
								    type: 'post',
								    url: url,
								    dateType:'text',
								    data: $("#form1").serialize(),
								    beforeSend:function(XMLHttpRequest){
								    	$("#loading").show();
							         },
								    success: function(data) {
								        if(data.flag == "1"){
								        	win.successAlert(data.message,function(){window.close();});
								        	window.opener.location.reload();
								        }else {
								        	parent.win.errorAlert("上报失败！"+data.message,function(){});
								        }
								    },
								    complete:function(XMLHttpRequest,textStatus){
								    	$("#loading").hide();
							           },
						
								    error:function(){
								    	parent.win.errorAlert("保存失败！",function(){});
								    }
								});
							}
						});
		  }
			
		}
	  
	//检查必填信息
		function check() {
			var flag = true;
			
		    console.log();
 			if ($("#compId option:selected").text() == '----请选择----') {
				flag = false;
				win.generalAlert("单位名称不能为空！")
				return;
			}
 				
			return flag;
		}
		// 判断为空
		function chkIsEmpty(objId) {
			if (!$.trim($("#" + objId).val())) { // "",null,undefined
				return false;
			} else {
				return true;
			}
		}
		function _close() {
	        window.close();
		}
	</script>