<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>人事信息审核页面</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />
<!--[if lt IE 9]>
    <script src='${pageContext.request.contextPath}/assets/javascripts/html5shiv.js' type='text/javascript'></script>
    <![endif]-->
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
<form>
<div class="container">
	<div class='main_title'><span>人事信息审核</span></div>
	
	<div class="list_container">
			<div class="table_container_title">劳动用工</div>
				<table class="popup_table" >
					
					<tr>
						<td>年份：</td>
						<td><input id="year" name="year"  value="${com.year }" disabled></td>
						<td>月份：</td>
						<td><input id="month" name="month" value="${com.month }" disabled></td>
						<td>公司名称：</td>
						<td><input id="compId" name="compId"  value="${com.chName }" disabled></td>
					</tr>
					<tr>
						<td>劳动用工人数：</td>
						<td><input id="employeeNumber" name="employeeNumber" placeholder="劳动用工人数：" type="text" value="${com.employeeNumber }" disabled></td>
						<td>劳务派遣人数：</td>
						<td><input id="laborDispatchNumber" name="laborDispatchNumber" placeholder="劳务派遣人数：" type="text" value="${com.laborDispatchNumber }" disabled></td>
						<td>合同工人数：</td>
						<td>
							<input id="contractWorkerNumber" name="contractWorkerNumber" placeholder="合同工人数：" type="text" value="${com.contractWorkerNumber }" disabled>
						</td>
		
					</tr>
					<tr>
						<td>非合同工人数：</td>
						<td >
							<input id="noncontractWorkerNumber" name="noncontractWorkerNumber" placeholder="非合同工人数：" type="text" value="${com.noncontractWorkerNumber }" disabled>
						</td>
					</tr>
				</table>
				 
			</div>
			
			<div class="list_container">
			<div class="table_container_title">操作信息</div>
				<table class="popup_table" >
					
					<tr>
						<td width="10%">创建人：</td>
						<%-- <td><input id="username" name="username"  type="text" value="${userSession.userName }" disabled></td> --%>
						<td>${userSession.userName}</td>
						<td width="10%">创建时间：</td>
						<%-- <td><input id="creatDate" name="createDate"  type="text" value="${com.createDate }" disabled></td> --%>
						<td>${com.createDate }</td>
		
					</tr>
				</table>
				<input type="hidden" name="isDel" value=0 /> 
			</div>
			
			<!-- <div class='container'> -->
					<div class='table_container'>
						<div class="table_container_title">审核意见列表</div>
								<table rules=none style="word-wrap:break-word;">
										<tr>
										<th width="5%">序号</th>
										<th width="20%">审核人</th>
										<th width="15%">审核时间</th>
										<th width="5%">审核结果</th>
										<th>审核意见</th>
									    </tr>
										<c:if test="${not empty exList}">		
				                	 	<c:forEach items="${exList}" var="item" varStatus="status">
					                	 	<tr>
			            	 	                <td>${status.index+1}</td>
						                	 	<td>${item.createPersonName}</td>
												<td>${item.lastModifyDate}</td>
												<td><c:if test="${item.examResult  == 1 }">通过</c:if>
												<c:if test="${item.examResult  == 0}">退回</c:if></td>
												<td>${item.examineStr}</td>
											</tr>
										</c:forEach>
									    </c:if>
			                	 	<c:if test="${empty exList}">	
			                	 		<tr>
			                	 			<td colspan="11" style="text-align:center;">查询无记录</td>
			                	 		</tr>
			                	 	</c:if>
								</table>
								<div class="clearfix" style="height: 20px;"></div>
						</div>
					 <!-- </div> --> 
				 <!-- </div>  -->
		<!-- <div class='container'> -->
		   <div class="list_container">
			<div class="table_container_title">审核意见</div>
				<table class="popup_table" >
					
					<tr>
						<td width="2%" valign="top"><span class="red">*</span>审核意见:</td>
						<td colspan="5"><textarea id="agreement" name="agreement" value="${agreement}" style="width: 100%; height: 200px; border: 1px solid #cbcbcb; border-radius: 4px; 
							font-size: 16px; text-indent: 4px;"placeholder="审核意见限制500字" maxlength="500" check="NotEmpty_string_500_._._._."></textarea></td>
						<input type="hidden" name="id" value="${com.id}"/>
			           	<input type="hidden" name="username" value="${userSession.userName}"/>
					</tr>
				</table>
				<input type="hidden" name="isDel" value=0 /> 
			</div>
			</div>
	
			
				
				<div class="popup_button_container">
				<input type="button" class="popup_button main_button" onclick="_agreement('${userSession.userName}','${agreement}',${com.id});" value="通过">
				<input type="button" class="popup_button main_button" onclick="_back('${userSession.userName}','${agreement}',${com.id});"" value="退回">
				<input type="button" class="popup_button blue_button" onclick="_close();" value="关闭">
			</div>
		</div>
			
	</form>
	
	
	<script type="text/javascript">
		function _agreement(username,agreement,id){
			if(!vaild.all())
			{
				return false;
			}

			
			var url = '${pageContext.request.contextPath}/hr/_chkAgreement';
			
			
				$.ajax({
				    type: 'post',
				    url: url,
				    dateType:'json',
				    data: {
				    	"username":username,
				    	"agreement":$("#agreement").val(),
				    	"id":id
				    },
				    beforeSend:function(XMLHttpRequest){
				    	$("#loading").show();
			         },
				    success: function(data) {
				        if(data.flag == "1"){
				        	win.successAlert(data.message,function(){/* window.close(); */});
				        	setTimeout(_close,2e3);
				        	window.opener.location.reload();
				        }else {
				        	parent.win.errorAlert("审核失败！"+data.message,function(){});
				        }
				    },
				    complete:function(XMLHttpRequest,textStatus){
				    	$("#loading").hide();
			           },
		
				    error:function(){
				    	parent.win.errorAlert("审核失败！",function(){});
				    }
				});
			
		  
		}
	</script>
		<script type="text/javascript">
		function _back(username,agreement,id){
			if(!vaild.all())
			{
				return false;
			}

			var url = '${pageContext.request.contextPath}/hr/_chkBack';
			
			
				$.ajax({
				    type: 'post',
				    url: url,
				    dateType:'json',
				    data: {
				    	"username":username,
				    	"agreement":$("#agreement").val(),
				    	"id":id
				    },
				    beforeSend:function(XMLHttpRequest){
				    	$("#loading").show();
			         },
				    success: function(data) {
				        if(data.flag == "1"){
				        	win.successAlert(data.message,function(){/* window.close(); */});
				        	setTimeout(_close,2e3);
				        	window.opener.location.reload();
				        }else {
				        	parent.win.errorAlert("退回失败！"+data.message,function(){});
				        }
				    },
				    complete:function(XMLHttpRequest,textStatus){
				    	$("#loading").hide();
			           },
		
				    error:function(){
				    	parent.win.errorAlert("退回失败！",function(){});
				    }
				});
			
			
			
		  
		}
		
		
		/* function check() {
			var flag = true;
 			if (!chkIsEmpty("agreement")) {
				flag = false;
				win.generalAlert("审核意见不能为空！")
				return;
			}
 				
			return flag;
		} */
		// 判断为空
		function chkIsEmpty(objId) {
			if (!$.trim($("#" + objId).val())) { // "",null,undefined
				return false;
			} else {
				return true;
			}
		}
		
	
		function _close() {
			/* window.opener=null;
	        window.open('','_self'); */
	        window.close();
		}
	
	</script>
		
</body>
</html>