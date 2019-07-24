<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>人事审核信息管理列表</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport' />
<!--[if lt IE 9]>
    <script src='${pageContext.request.contextPath}/assets/javascripts/html5shiv.js' type='text/javascript'></script>
    <![endif]-->
<link
	href='${pageContext.request.contextPath}/assets/stylesheets/bootstrap/bootstrap.css'
	rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/assets/font/iconfont.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/demo.css"
	rel="stylesheet" type="text/css">
<!-- / window 弹出提示-->
<link href='${pageContext.request.contextPath}/css/window.css'
	rel='stylesheet' type='text/css' />
<!-- / jquery -->
<script src='${pageContext.request.contextPath}/js/jquery.min.js'
	type='text/javascript'></script>
<script src='${pageContext.request.contextPath}/js/window.js'
	type='text/javascript'></script>
<!-- 时间插件 -->
<link href='${pageContext.request.contextPath}/css/jedate.css'
	rel='stylesheet' type='text/css' />
<!-- 校验 -->
<link href='${pageContext.request.contextPath}/css/vaild.css'
	rel='stylesheet' type='text/css' />
<!-- 校验 -->
<script src='${pageContext.request.contextPath}/js/vaild.js'
	type='text/javascript'></script>
<!-- 日期插件 -->
<script src='${pageContext.request.contextPath}/js/jquery.jedate.min.js'
	type='text/javascript'></script>

</head>
<body>
	<form>
		<div class='main_title'>
			<span>人事审核信息管理</span>
		</div>
		<%-- <span class="state_title">公司名称：</span>
	<select class="state_input" name="compId" id="compId">
										<option value="">----请选择----</option>
										<c:forEach items="${comList}" var="item" varStatus="status">
											<option value="${item.id}"
												<c:if test="${conditionEntity.compId == item.id}">selected=selected</c:if>>${item.chName}</option>
										</c:forEach>
									</select> --%>
		<span class="state_title">公司名称：</span> <input class="state_input"
			name="chName" value="${conditionEntity.chName }" id="chName" /> <span
			class="state_title">日期：</span> <input
			style="height: 34px; width: 18%" class="time" name="date"
			value="${conditionEntity.date }" id="date" readonly="readonly" /> <span
			class="state_title">审核状态：</span>
		<%-- <select id='approvalState' name="approvalState" class="state_input">
	<option value="">全部</option>
	<option value="1"<c:if test="${'1' eq conditionEntity.approvalState}">selected</c:if>>待上报</option>
	<option value="2"<c:if test="${'2' eq conditionEntity.approvalState}">selected</c:if>>待审核</option>
	<option value="3"<c:if test="${'3' eq conditionEntity.approvalState}">selected</c:if>>已审核</option>
	<option value="4"<c:if test="${'4' eq conditionEntity.approvalState}">selected</c:if>>已退回</option>
	</select> --%>
		<select id='approvalState' name="approvalState" class="state_select">
			<option value="">全部</option>
			<c:forEach items="${checkList}" var="com" varStatus="status">
				<c:if test="${com.num!='1' }">
					<option value="${com.num}"
						<c:if test="${conditionEntity.approvalState == com.num}">selected</c:if>>${com.desc}</option>
				</c:if>
			</c:forEach>
		</select>

		<div class="clearfix"></div>
<%-- 		<c:if test="${fn:contains(buttonSession,'work_hrsh_query')==true}"> --%>
			<button class="but_search" type="button" onclick="_query();">
				<i class="iconfont icon-chaxun"></i>查询
			</button>
<%-- 		</c:if> --%>
		<div class="clearfix"></div>
		<div class='container'>
			<div class='table_container'>
				<div class="table_container_title">人事审核信息列表（全部职工=在岗职工+离岗职工，从业人员=在岗职工数+其他从业人员）</div>
				<table rules=none>
					<tr>
						<th width="5%">序号</th>
						<th width="8%">日期</th>
						<th width="20%">公司名称</th>
						<th width="8%">全部职工数</th>
						
						<th width="8%">在岗职工数</th>
						<th width="8%">离岗职工数</th>
						<th width="8%">从业人员</th>
						
						<!-- <th width="8%">劳务派遣人数</th> -->
						<th width="8%">其他从业人员</th>
						<th width="8%">审核状态</th>
						<th>操作</th>
					</tr>
					<c:if test="${not empty pageBean.items }">
						<c:forEach items="${pageBean.items}" var="item" varStatus="status">
							<tr>
								<td align="center">${status.index+1}</td>
								<td align="center">${item.year}-${item.month}</td>
								<td><a
									href="${pageContext.request.contextPath}/hr/_view?id=${item.id}"
									target="_blank">${item.chName }</a></td>
								<td align="center">${item.totalNumber }</td>
								
								
								<td align="center">${item.employeeNumber }</td>
								<td align="center">${item.leaveNumber }</td>
								
								<td align="center">${item.contractWorkerNumber}</td>
								
								<%-- <td align="center">${item.laborDispatchNumber}</td> --%>
								<td align="center">${item.noncontractWorkerNumber}</td>
								<td align="center"><c:forEach items="${checkList}"
										var="checkList" varStatus="status">
										<c:if test="${item.approvalState == checkList.num}">
											${checkList.desc}
										</c:if>
									</c:forEach></td>
								<td align="center">
					<%-- 			<c:if
										test="${fn:contains(buttonSession,'work_hrsh_view')==true}"> --%>
										<input type="button" class="table_button"
											onclick="javascript:_viewHrInfo('${item.id}');" value="查看">
	<%-- 								</c:if>  --%>
									<c:if test="${item.approvalState=='2'}">
						<%-- 				<c:if
											test="${fn:contains(buttonSession,'work_hrsh_check')==true}"> --%>
											<input type="button" class="table_button"
												onclick="javascript:_hrChkList('${item.id}');" value="审核">
										<%-- </c:if> --%>
									</c:if></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty pageBean.items }">
						<tr>
							<td colspan="16" style="text-align: center;">查询无记录</td>
						</tr>
					</c:if>
				</table>
				<jsp:include page="/jsp/public/page.jsp" />
			</div>
		</div>
	</form>

	<script type="text/javascript">
		$("#loading").hide();

		$('input.time').jeDate({
			format : "YYYY-MM"
		});

		function _query() {
			var form = document.forms[0];
			console.log(form)
			form.action = "${searchurl}";
			form.method = "POST";
			form.submit();
		}

		function _viewHrInfo(id) {
			var url = "${pageContext.request.contextPath}/hr/_view?id=" + id;
			window.open(url, "人事查看界面");
		}
		function _hrChkList(id) {
			var url = "${pageContext.request.contextPath}/hr/_agreement?id="
					+ id;
			window.open(url, "人事审核界面");
		}
	</script>
</body>
</html>