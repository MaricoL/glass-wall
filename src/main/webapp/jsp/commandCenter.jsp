﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=1580, user-scalable=no"/>
	<title>城市建筑安全监测可视化平台</title>
	<link rel="stylesheet" type="text/css" href="css/normal.css" />
	<link rel="stylesheet" type="text/css" href="font/iconfont.css"/>
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css" />
	<link rel="stylesheet" href="css/header.css" />

	<link rel="stylesheet" type="text/css" href="css/jiashicang.css" />
	
	<script src="<c:url value="/js/jquery.min.js"/>" charset="utf-8"></script>
	
	<script type="text/javascript">

    </script>
</head>

<body style="background-image: url(img/bg.jpeg);">
	


	<div no=text class="l_top">
	
		<div class="main-title">
		
			<span>城市建筑安全监测可视化平台 </span>
		</div>
	
	</div>
	<div class="layer main-layer">
		<!-- <header class="header"></header> -->
		<div class="body">
	
			<div class="p2" style="width:980px;">
					
				<div class="card card3">
					
				
					
					<div class="c-item flex" style="justify-content:space-between;">
					
						<div class="c32 flex dark3">
							<div style="margin-left:32px">
								<div id="AssetLiabilityRateDiv" class="circle2">
								
								</div>
							</div>
						
							<div id="zcfzl_date" class="fourRateDate"></div>
						
						</div>
					</div>
					
				</div>
			
			</div>
			<div class="p3" style="width:450px    ; padding-top: 2px;">
				<div class="card">
					<div class="c-header dark2">
						<div class="title ceee">核算<span class="time cbbb" id="accounting_date"></span></div>
						<div class="c-right">
				
						</div>
					</div>
					<div class="c-item dark3 cfff" style="padding:16px 30px;">
						<div class="fs16 children-inline-middle">
							<i class="icon iconfont icon-qianbi" style="font-size:40px"></i>
							<div>
								<span style="margin-left:20px;">资产总额</span>
								<span class="fs28" style="margin-left:20px;"><span id="A00056">-</span><span class="fs16">亿</span></span>
							</div>
						</div>
						<div class="flex mt16">
							<div class="c5half children-inline-middle">
								<i class="icon iconfont icon-moneybag" style="font-size:40px"></i>
								<div style="margin-left:20px;">
									<div class="fs14 cbbb">境外资产总额</div>
									<div class="fs24"><span id="A00229">-</span><span class="fs16" style="margin-left:4px;">亿</span></div>
								</div>
							</div>
							<div class="c5half children-inline-middle">
								<div id="accountingdiv" style="width:60px;height:60px;pointer-events:none;">
									
								</div>
								<div style="margin-left:20px;">
									<div class="fs14 cbbb">境外资产占比</div>
									<div class="fs24"><span id="A00230">-</span><span class="fs16" style="margin-left:4px;">%</span></div>
								</div>
							</div>
						</div>
						
						<a class="orderbtn" href="javascript:;" style="top: 10px;right: 10px;">
							<i class="iconfont icon-qizi" onclick="sendorder('10','SHOWTAB_M88_FINANCE','核算')"></i>
						</a>		
					</div>
				</div>
				<div class="card">
					<div class="c-header dark2">
						<div class="title ceee">税务<span class="time cbbb" id="tax_date"></span></div>
						<div class="c-right">
						
						</div>
					</div>
					<div class="c-item dark3 children-inline-middle cfff" style="padding:16px 22px;white-space: nowrap;">
						<div class="c6icon">
							<div id="taxechart" style="height:64px">
							
							
							</div>
						
						</div>
						<div style="margin-left:18px;">
							<div class="fs28"><span id="A00204_1">-</span><span class="fs16" style>%</span></div>
							<div class="cbbb fs16 mt8">年度节税任务完成情况</div>
						</div>
						
						<br>
						<div style="margin-left:18px;display: inline-block;">
							<div class="fs28"><span class="fs16">累计节税   </span><span id="A00202">-</span><span class="fs16" style>亿元</span></div>
							
						</div>
						<br>
						<div style="margin-left:18px;display: inline-block;">
							<div class="fs28"><span class="fs16">累计纳税   </span><span id="A00198">-</span><span class="fs16" style>亿元</span></div>
							
						</div>
					</div>
					<a class="orderbtn" href="javascript:;" style="top: 73px;right: 10px;">
						<i class="iconfont icon-qizi" onclick="sendorder('10','SHOWTAB_M85_FINANCE','年度节税任务完成情况')"></i>
					</a>
				</div>
				<div class="card">
					<div class="c-header dark2">
						<div class="title ceee">稽核人事发展<span class="time cbbb" id="audit_date"></span></div>
						<div class="c-right">
						
						</div>
					</div>
					<div class="c-item dark3 flex cfff"  style="padding:22px;white-space: nowrap;">
						<div style="width:50%;">
							<div class="flex" style="align-items:center;">
								<div class="c6icon">
									<div id="Audi1echart" style="height:64px"></div>
								</div>
								<div style="margin-left:18px;">
									<div class="fs28"><span id="A00320_1">-</span><span class="fs16" style>%</span></div>
								</div>
							</div>
							<div class="cbbb fs16" style="text-align:center;">财务专业资质合格率</div>
						</div>
						<div style="width:50%;">
							<div class="flex" style="align-items:center;">
								<div class="c6icon">
									<div id="Audi2echart" style="height:64px"></div>
								</div>
								<div style="margin-left:24px;">
									<div class="fs28"><span id="A00312_1">-</span><span class="fs16" style>%</span></div>
								</div>
							</div>
							<div class="cbbb fs16" style="text-align:center;">稽核进度</div>
						</div>
					</div>
					<a class="orderbtn" href="javascript:;" style="top: 73px;right: 10px;">
						<i class="iconfont icon-qizi" onclick="sendorder('10','SHOWTAB_M112_FINANCE,SHOWTAB_M114_FINANCE','稽核人事发展')"></i>
					</a>
				</div>
				<div class="card">
					<div class="c-header dark2">
						<div class="title ceee">外部对标<span class="time cbbb" id="compare_date"></span></div>
						<div class="c-right">
						
						</div>
					</div>
					<div class="c-item dark3 cfff" style="padding:10px 20px 0px 20px">
						<!-- <div class="tc fs18" style="padding:10px 0;">净利润</div>
						<div class="fs16" style=padding:6px;position:relative;>
							<div class="c8item">
								<div>海航投资</div>
								<div><div style="width:90%;"><div class="">106.8亿</div></div></div>
								<div><div style="width:80%;"><div class="">106.8亿</div></div></div>
								<div>创客投资</div>
							</div>
							<div class="c8item">
								<div>海航投资</div>
								<div><div style="width:30%;"><div class="">106.8亿</div></div></div>
								<div><div style="width:60%;"><div class="">106.8亿</div></div></div>
								<div>创客投资</div>
							</div>
							<div class="c8item">
								<div>海航投资</div>
								<div><div div style="width:20%;"><div class="">106.8亿</div></div></div>
								<div><div div style="width:70%;"><div class="">106.8亿</div></div></div>
								<div>创客投资</div>
							</div>
							<div class="c8line"></div>
						</div> -->
						<div id="outcompare" style="height:220px"></div>
					</div>
					<a class="orderbtn" href="javascript:;" style="top: 73px;right: 10px;">
						<i class="iconfont icon-qizi" onclick="sendorder('10','SHOWTAB_S117_FINANCE','外部对标')"></i>
					</a>
				</div>
			</div>
	
			<div class="p1" style="width:450px;    padding-top: 2px;">
				<div class="card card1" >
					
					<div id="liru">
						<div class="c-header dark2">
							<div class="title ceee"><a href="javascript:;" id="liruChange" onclick="changeShouruAndLiru();" title="收入与利润切换">切换</a>利润实现情况<span class="time cbbb" id="profit_date"></span></div>
							<div class="c-right">
						
							</div>
						</div>
						<div class="c-item c-item2 dark3" style="height:252px;" >
								<div id="profitechart" style="height:252px;">
								</div>
						</div>
						<div class="c-item flex" style="justify-content:space-between;">
							<div class="c2l dark3">
								<div class="fs16 c888">本年累计</div>
								<div class="fs28 cfff">1000<span class="fs16">亿</span></div>
							</div>
							<div class="c2l dark3">
								<div class="fs16 c888">本年预算</div>
								<div class="fs28 cfff">2000<span class="fs16">亿</span></div>
							</div>
						</div>
						<a class="orderbtn" href="javascript:;" style="top: 73px;right: 10px;">
							<i class="iconfont icon-qizi" onclick="sendorder('10','SHOWTAB_M71_FINANCE','利润实现情况')"></i>
						</a>
					</div>
				</div>
				<div class="card card2">
				
					<div class="c-header dark2">
						<div class="title ceee">财务树<span class="time cbbb" id="financeCompanyTreeId">${year}年${month}月</span></div>
				
					</div>
					<div class="c-item c-item2 dark3" style="height:490px;overflow:auto;" >
					
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 现金流计划详情查看 -->
	<div id=chart-modal no=text style="background-color: white;">
	    <div class="white-bg" style="position:relative;height: 100%;margin-left: 0;margin-bottom: 0;">
			<span class="title"><span id="level1_title"></span><%-- <span class="click new bg-blue" onclick="mload('${pageContext.request.contextPath}/task/instruction/_add')">+&nbsp;指令下达</span> --%><i class="chart-modal-close" onclick="$('#chart-modal').jqmHide();">×</i></span>
			<div class="chartbox"><div id="level1_chart" style="width: 100%;height:400px;overflow-y:scroll;padding-left: 20px;"></div></div>
			
		</div>
	</div>
	
	<!--不能删除 -->
<script src="<c:url value="/js/kongzhiyemianbuju.js"/>" charset="utf-8"></script>	
</body>

</html>
