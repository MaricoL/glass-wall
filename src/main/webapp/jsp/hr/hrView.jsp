<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>人事信息查看页面</title>
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

</head>
<body>

<form accept-charset="UTF-8" id="form1" method="post" style="margin-bottom: 0;" enctype="multipart/form-data">
	<div class="main_title">人事信息查看</div>
	
	<div class="container">
		<div class="list_container">
			<div class="table_container_title">人事信息查看</div>
				<table class="popup_table">
					<tr>
						<td>年份：</td>
						<td><input id="year" name="year"  value="${com.year }" disabled></td>
						<td>月份：</td>
						<td><input id="month" name="month" value="${com.month }" disabled></td>
						<td>公司名称：</td>
						<td><input id="compId" name="compId"  value="${com.chName }" disabled></td>
					</tr>
					<tr>
					    <td>全部职工数：</td>
						<td><input id="totalNumber" name="totalNumber" placeholder="全部职工数" type="text" value="${com.totalNumber }" disabled></td>
						
						<td>在岗职工数：</td>
						<td><input id="employeeNumber" name="employeeNumber" placeholder="在岗职工数" type="text" value="${com.employeeNumber }" disabled></td>
						
						<td>离岗职工数：</td>
						<td><input id="leaveNumber" name="leaveNumber" placeholder="离岗职工数" type="text" value="${com.leaveNumber }" disabled></td>
						
						</tr>
					<tr>
						<td>从业人员：</td>
						<td>
							<input id="contractWorkerNumber" name="contractWorkerNumber" placeholder="从业人员" type="text" value="${com.contractWorkerNumber }" disabled>
						</td>
						
						<%-- <td>劳务派遣人数：</td>
						<td><input id="laborDispatchNumber" name="laborDispatchNumber" placeholder="劳务派遣人数" type="text" value="${com.laborDispatchNumber }" disabled></td>
						 --%>
						<td>其他从业人员：</td>
						<td >
							<input id="noncontractWorkerNumber" name="noncontractWorkerNumber" placeholder="其他从业人员" type="text" value="${com.noncontractWorkerNumber }" disabled>
						</td>
					</tr>
				</table>
				<input type="hidden" name="isDel" value=0 /> 
			</div>
			
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
												<td align="center">${item.lastModifyDate}</td>
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
			
			<div class="popup_button_container">
				<button class="popup_button blue_button" onclick="_close();">关闭</button>
			</div>
		</div>
</form>
</body>
</html>


<%-- <script src='${pageContext.request.contextPath}/assets/javascripts/bootstrap/bootstrap.min.js' type='text/javascript'></script> --%>


<script type="text/javascript">
		
		function _close() {
			/* window.opener=null;
	        window.open('','_self'); */
	        window.close();
		}
	</script>