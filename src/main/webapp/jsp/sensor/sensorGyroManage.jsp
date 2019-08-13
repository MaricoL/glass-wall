<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>传感器陀螺仪信息管理列表</title>
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
<!-- 时间插件 -->
<link href='${pageContext.request.contextPath}/css/jedate.css'
	rel='stylesheet' type='text/css' />
<!-- 校验 -->
<link href='${pageContext.request.contextPath}/css/vaild.css'
	rel='stylesheet' type='text/css' />
<!-- / jquery -->
<script src='${pageContext.request.contextPath}/js/jquery.min.js'
	type='text/javascript'></script>
<script src='${pageContext.request.contextPath}/js/window.js'
	type='text/javascript'></script>
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
			<span>传感器陀螺仪信息管理</span>
		</div>

		<%-- <span class="state_title">传感器名称：</span>
	    <input class="state_input" name="sensorName" value="${conditionEntity.sensorName }" id="sensorName" /> 
 --%>
 		<span class="state_title">传感器名称：</span> 
        <select id='sensorName' name="sensorName" class="state_select">
		   <option value="">全部</option>
			<c:forEach items="${nameList}" var="com" varStatus="status">
				<option value="${com.num}"
					<c:if test="${conditionEntity.sensorName== com.num}">selected</c:if>>${com.description}</option>
			</c:forEach>
		</select>
		<div class="clearfix"></div>
<%-- 		<c:if test="${fn:contains(buttonSession,'work_hr_new')==true}"> --%>
<%-- 		</c:if>

		<c:if test="${fn:contains(buttonSession,'work_hr_query')==true}"> --%>
			<button class="but_search" type="button" onclick="_export();">
				<i class="iconfont icon-chaxun"></i>导出
			</button>
			<button class="but_search" type="button" onclick="_query();">
				<i class="iconfont icon-chaxun"></i>查询
			</button>
<%-- 		</c:if> --%>
		<div class="clearfix"></div>

		<div class='container'>
			<div class='table_container'>
				<div class="table_container_title">传感器陀螺仪信息列表</div>
				<table rules=none>
					<tr>
						<th width="5%">序号</th>
						<th>传感器名称</th>
						<th>传感器位置</th>
						<th>Gyro_x</th>
						<th>Gyro_y</th>
						<th>Gyro_z</th>
						<th>创建时间</th>						
					</tr>
					<c:if test="${not empty pageBean.items}">
						<c:forEach items="${pageBean.items}" var="item" varStatus="status">
							<tr>
								<td align="center">${status.index+1}</td>
								<td align="center">${item.sensorName}</td>
								<td align="center">
									<c:forEach items="${nameList}" var="list" varStatus="status">
										<c:if test="${item.sensorName == list.num}">
											${list.description}
										</c:if>
									</c:forEach>
								</td>
								<td align="center">${item.xvalue}</td>
								<td align="center">${item.yvalue}</td>
								<td align="center">${item.zvalue}</td>
								<td align="center">${item.createTime}</td>								
<%-- 								<td align="center">
										<input type="button" class="table_button" onclick="javascript:_viewHrInfo('${item}');" value="查看">
								</td> --%>
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
		// 查询
		function _query() {
			var form = document.forms[0];
			console.log(form)
			form.action = "${searchurl}";
			form.method = "POST";
			form.submit();
		}
		/* 删除人事信息 */
		function _deleteHrInfo(id) {
			var params = {
				"id" : id
			};
			parent.win
					.confirm(
							'确定要删除吗？',
							function(r) {
								if (r) {
									var url = '${pageContext.request.contextPath}/hr/_deleteHrInfo';
									$.ajax({
										type : 'post',
										url : url,
										dateType : 'json',
										data : params,
										beforeSend : function(XMLHttpRequest) {
											$("#loading").show();
										},
										success : function(data) {
											if (data.flag == "1") {
												/* win.successAlert(data.message,
														setTimeout(_query, 2e3) 
														  function() {
															//window.close();
														});
												
												_query();  */
												win.successAlert(data.message);
												setTimeout(_query, 2e3)

											} else {
												parent.win.errorAlert("删除失败！"
														+ data.message,
														function() {
														});
											}
										},
										error : function() {
											parent.win.errorAlert("删除失败！",
													function() {
													});
										}
									});
								}
							});

		}
		/* 列表中上报人事信息	 */
		function _submit(id) {
			parent.win
					.confirm(
							'确定要上报吗？',
							function(r) {
								if (r) {
									var params = {
										"id" : id
									};
									var url = '${pageContext.request.contextPath}/hr/_submitInListPage';
									$.ajax({
										type : 'post',
										url : url,
										dateType : 'json',
										data : params,
										cache : false,
										async : false,
										success : function(data) {
											if (data.flag == "1") {
												/* win.successAlert(data.message,
														
														function() {
															//window.close();
														});

												_query(); */
												win.successAlert(data.message);
												setTimeout(_query, 2e3)
											} else {
												parent.win.errorAlert("上报失败！"
														+ data.message,
														function() {
														});
											}
										},
										error : function() {
											parent.win.errorAlert("上报失败！",
													function() {
													});
										}
									});
								}
							});

		}
		//编辑人事信息
		function _editHrInfo(id) {
			if (id == '' || id == undefined) {
				var url = "${pageContext.request.contextPath}/hr/_edit";
			} else {
				var url = "${pageContext.request.contextPath}/hr/_edit?id="
						+ id;
			}
			window.open(url, "菜单编辑界面");
		}

		//查看人事信息
		function _viewHrInfo(id) {
			var url = "${pageContext.request.contextPath}/hr/_view?id=" + id;
			window.open(url, "人事查看界面");
		}

		//变更人事信息
		function _modifyHrInfo(id) {
			var url = "${pageContext.request.contextPath}/hr/_modify?id=" + id;
			window.open(url, "变更人事信息界面");
		}
		
		function _export(){
			var url = '${pageContext.request.contextPath}/gyro/export';
	 		var form = document.forms[0];
			form.action = url;
			form.method = "POST";
			form.submit(); 
		}
	</script>


</body>
</html>