<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>工作台</title>
	
	<!-- 库 -->
	<link rel="stylesheet" type="text/css" href="font/iconfonts.css" />
	<link rel="stylesheet" type="text/css" href="css/bim_workbench.css" />
	<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css" />
	<style>
	
		/* fix 2018-9-11 */
		/* fix end */
	
		body{
			overflow:hidden;
		}
		.part5 .part_body{
		    display: block;
		    height: 84%;
		    overflow: hidden;
		    width: 100%;
		}
		.detail4{
		    position: relative;
		    width: 25%;
		    text-align: center;
		    margin-top: 5vh;
		}
		.detail4>p{
		    color: rgba(255,255,255,0.8);
		}
		.enter{
			display: none;
		}
		.more{
		    float: right;
		    font-size: 14px;
		    margin-right: 5%;
		    cursor: pointer;
		}
		.more:hover{
		    text-decoration: underline;
		}
		.search > input{
			display: inline-block;
			height: 41px;
			color: #ccc;
		}
		input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {
			color: #ccc;
		}
	　　 input:-moz-placeholder, textarea:-moz-placeholder {
			color:#ccc;
		}
		input::-moz-placeholder, textarea::-moz-placeholder {
			color:#ccc;
		}
		input:-ms-input-placeholder, textarea:-ms-input-placeholder {
			color:#ccc;
		}
		.menu.i,.i_btn>i{
			cursor: pointer;
		}
		._p{
		  	font-size: 14px;
		  	line-height:200%
		}
		._hr{
			margin-top:1px;
		    *margin: 0;
		    border: 0;
		    color: rgba(126, 176, 207, 0.45);
		    background-color:rgba(126, 176, 207, 0.45); 
		    height: 1px
		}
		._img{
			 /* width:450px; */
			 height:200px;
			 text-align:center;
			 padding-top:80px;
		}
	</style>
</head>
<body>
	<jsp:include page="/jsp/public/title.jsp"></jsp:include>
	<script type="text/javascript">
		var to_def_img = function(el){
			el.src = "img/head.png";
		};
	</script>
	<div class="head">
		<p>工作台</p>
	</div>
	<p class="msg">
		<i class="iconfont icon-broadcast"></i>
	</p>
	<marquee>
		<c:forEach items="${ requestScope.msgPage.list}" var="news" varStatus="status">
			<p>${news.title}：${news.description};</p>
		</c:forEach>
	</marquee>
	<div class="body1">
		<div class="part1">
			
		</div>
		<div class="part2">
			
		</div>
		<div class="part3">
			<p class="part_title">预警中心<span id="warncenterMore" class="more" onclick="openNewWindow('${pageContext.request.contextPath}/warncenter/list');">&gt;&gt;更多</span></p>
			<div class="part_body">
				<div class="work_list" id="warnCenter" style="overflow: hidden">
					
				</div>
			</div>		
		</div>
	</div>
	<div class="body2">
		<div class="part4">
			<p class="part_title">台账管理</p>
			<div class="part_body">
				<div class="detail4">
					<span class="icon" onclick="trunToDetail(3,'${pageContext.request.contextPath}/system/menu?menu=3')"><i class="iconfont icon-hangzheng"></i></span>
					<p>行政办公</p>
				</div>
				<div class="detail4">
					<span class="icon" onclick="trunToDetail(4,'${pageContext.request.contextPath}/system/menu?menu=4')"><i class="iconfont icon-renliziyuan"></i></span>
					<p>人力资源</p>
				</div>
				<div class="detail4" >
					<span class="icon" onclick="trunToDetail(5,'${pageContext.request.contextPath}/system/menu?menu=5')"><i class="iconfont icon-icon-test"></i></span>
					<p>六率指标</p>
				</div>
				<div class="detail4" >
					<span class="icon" onclick="trunToDetail(6,'${pageContext.request.contextPath}/system/menu?menu=6')"><i class="iconfont icon-shzr"></i></span>
					<p>社会责任</p>
				</div>
			</div>
			<div class="part_body">
				
				<div class="detail4">
					<span class="icon"  onclick="trunToDetail(1,'${pageContext.request.contextPath}/system/menu?menu=1')"><i class="iconfont icon-caigouguanli1"></i></span>
					<p>采购管理</p>
				</div>
				<div class="detail4" >
					<span class="icon" onclick="trunToDetail(8,'${pageContext.request.contextPath}/system/menu?menu=8')"><i class="iconfont icon-zhongdiangongcheng"></i></span>
					<p>重点基建工程</p>
				</div>
				<div class="detail4" >
					<span class="icon" onclick="trunToDetail(9,'${pageContext.request.contextPath}/system/menu?menu=9')"><i class="iconfont icon-xiaoxi"></i></span>
					<p>最新动态</p>
				</div>
			</div>
		</div>
		<div class="part5">
			<p class="part_title">工作提醒<span class="more" onclick="openNewWindow('${pageContext.request.contextPath}/protal/list');">&gt;&gt;更多</span></p>
			<div class="part_body">
				<div class="work_list" id="msgList" style="overflow: hidden">
					
				</div>
			</div>
		</div>
		<div class="part6">
			<p class="part_title">知识库</p>
			<p class="search">
				<input type="text" placeholder="请输入搜索内容" id="documentName">
				<span onclick="seachKnowledge1('bimWork_zxk_serach');">搜索</span>
			</p>
			<div class="part_body">
				<div class="detail3">
					<span class="icon" onclick="seachKnowledge2('bimWork_zxk_cw','cw')"><i class="iconfont icon-caiwu1"></i></span>
					<p>财务</p>
				</div>
				<div class="detail3">
					<span class="icon" onclick="seachKnowledge2('bimWork_zxk_xzbg','xzbg')"><i class="iconfont icon-hangzheng"></i></span>
					<p>行政办公</p>
				</div>
				<div class="detail3">
					<span class="icon" onclick="seachKnowledge2('bimWork_zxk_rlzy','rlzy')"><i class="iconfont icon-renliziyuan"></i></span>
					<p>人力资源</p>
				</div>
			</div>
			<div class="part_body">
				<div class="detail3">
					<span class="icon" onclick="seachKnowledge2('bimWork_zxk_cgsj','cgsj')"><i class="iconfont icon-caigouguanli1"></i></span>
					<p>采购数据</p>
				</div>
				<div class="detail3">
					<span class="icon" onclick="seachKnowledge2('bimWork_zxk_szsj','szsj')"><i class="iconfont icon-shzr"></i></span>
					<p>社责数据</p>
				</div>
				<div class="detail3">
					<span class="icon" onclick="seachKnowledge2('bimWork_zxk_fxkz','fxkz')"><i class="iconfont icon-xiezuo"></i></span>
					<p>风险控制</p>
				</div>
			</div>
		</div>
	</div>
<%-- 	<script type="text/javascript" src="<c:url value="/js/jquery-1.8.3.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/mCustomScrollbar.min.js"/>"></script> --%>
	<script>
	   /*  (function($){
	        $(window).load(function(){
	            $(".part5 .part_body").mCustomScrollbar();
	        });
	    })(jQuery); */
	</script>
	
	
	<script type="text/javascript">
	var pageList = '${bim_work_session_page}';
	var pageCodes = '${bim_work_session_code}';
	var basepath = '${pageContext.request.contextPath}';
	$('.center_btn td').on('click',function(){
		$(this).addClass('td_active').siblings('td').removeClass('td_active');
		div_name = $(this).attr('id');
		$("div[name = "+ div_name +"]").show().siblings("div[class=enter]").hide();
	})
	
	
	//初始化指令部分
	$.ajax({
		url : basepath+"/task/instruction/initTaskPart",
			type : "POST",
			dataType:"text",
			success : function(data) {
				$(".part1").children().remove();
				$(".part1").append(data);
				console.log($("#s-yuqi").text());
				$("#yujingzhiling").text($("#s-yuqi").text());
			},
			error : function() {
				alert("获取指令失败！");
			}
	});
	
	
	
	//初始化app应用中心
	$.ajax({
		url : basepath+"/appCenter/getAppCenterPart",
			type : "POST",
			dataType:"text",
			success : function(data) {
				$(".part2").children().remove();
				$(".part2").append(data);
			},
			error : function() {
				alert("初始化app应用中心失败！");
			}
	});
	
	//加载工作提醒
	$.ajax({
			url : "/bim_work/protal/_getPortalMsg",
			type : "POST",
			data : {
			},
			success : function(data) {
				$("#msgList").html(data.toString());
			},
			error : function() {
				alert("获取待办事务失败！");
			}
	});
	
	//加载预警中心数据
	$.ajax({
			url : "/bim_work/warncenter/_getWarnlMsg",
			type : "POST",
			data : {
			},
			success : function(data) {
				var result = JSON.parse(data);
				$("#warnCenter").html(result[1]);
				if('false'==result[0]){
					$("#warncenterMore").hide();
				}
			},
			error : function() {
				//alert("获取预警消息失败！");
			}
	});
	
	//台帐管理
	function trunToDetail(pageIndex,url){
		// 采购管理
		if (pageIndex == 1){
			if (pageList.indexOf('bimWork_cgsjsb') >= 0 || pageList.indexOf('bimWork_cgsjsh') >= 0){
				//window.location.href = url;
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
		// 财务管理
		if (pageIndex == 2){
		
			var auth=pageList.split(",")
			if (auth.indexOf('bimWork_yszxbbsb')>=0 || auth.indexOf('bimWork_yszxbbsh')>=0 || 							
			 auth.indexOf('bimWork_yszxbbhzsb')>=0 || auth.indexOf('bimWork_yszxbbhzsh')>=0 ||
			 auth.indexOf('bimWork_grjksjtb')>=0 || auth.indexOf('bimWork_grjksjsh')>=0 ||
			 auth.indexOf('bimWork_gsygxlyfcybj')>=0 || auth.indexOf('bimWork_grjkcqxxyl')>=0 ||
			 auth.indexOf('bimWork_grjkxxhz')>=0 || auth.indexOf('bimWork_yszqsjtb_nb')>=0 ||
			 auth.indexOf('bimWork_yszqsjsh_nb')>=0 || auth.indexOf('bimWork_yszqmxcx_nb')>=0 ||
			 auth.indexOf('bimWork_yszhzcx_nb')>=0 || auth.indexOf('bimWork_gsdeyszqcx_nb')>=0 ||
			 auth.indexOf('bimWork_hxqydeyszqcx_nb')>=0 || auth.indexOf('bimWork_yszqsjtb_wb')>=0 ||
			 auth.indexOf('bimWork_yszqsjsh_wb')>=0 || auth.indexOf('bimWork_yszqmxcx_wb')>=0 ||
			 auth.indexOf('bimWork_yszhzcx_wb')>=0 || auth.indexOf('bimWork_gsdeyszqcx_wb')>=0 ||
			 auth.indexOf('bimWork_hxqydeyszqcx_wb')>=0 || auth.indexOf('bimWork_cqyszqzkwcsyl_wb')>=0 ||
			 auth.indexOf('bimWork_jwzczbsjtb')>=0 || auth.indexOf('bimWork_jwzczbsjsh')>=0 ||
			 auth.indexOf('bimWork_hsbbsb')>=0 || auth.indexOf('bimWork_hsbbsh')>=0 ||
			 auth.indexOf('bimWork_hswcjgscx')>=0 || auth.indexOf('bimWork_glkjhsjtb')>=0 ||
			 auth.indexOf('bimWork_glkjhsjsh')>=0 || auth.indexOf('bimWork_zycwzbsjtb')>=0 ||
			 auth.indexOf('bimWork_ndzdgztb')>=0 || auth.indexOf('bimWork_ndzdgzsh')>=0 ||
			 auth.indexOf('bimWork_yblrzxztb')>=0 || auth.indexOf('bimWork_yblrzxzsh')>=0 ||
			 auth.indexOf('bimWork_rzxmtjqkCx')>=0 || auth.indexOf('bimWork_gxlrzxztb')>=0 ||
			 auth.indexOf('bimWork_gxlrzxzsh')>=0 || auth.indexOf('bimWork_gxxmhzCx')>=0 ||
			 auth.indexOf('bimWork_cxlrzxztb')>=0 || auth.indexOf('bimWork_cxlrzxzsh')>=0 ||
			 auth.indexOf('bimWork_zqlrzxztb')>=0 || auth.indexOf('bimWork_zqlrzxzsh')>=0 ||
			 auth.indexOf('bimWork_zqlrzhzCx')>=0 || auth.indexOf('bimWork_bzrzxzTb')>=0 ||
			 auth.indexOf('bimWork_bzrzxzSh')>=0 || auth.indexOf('bimWork_zrzxzqkCx')>=0 ||
			 auth.indexOf('bimWork_xzrzxzTb')>=0 || auth.indexOf('bimWork_xzrzxzSh')>=0 ||
			 auth.indexOf('bimWork_zdrzxzqkCx')>=0 || auth.indexOf('bimWork_zjtctb')>=0 ||
			 auth.indexOf('bimWork_zjtcsh')>=0 || auth.indexOf('bimWork_rzxzsjtb')>=0 ||
			 auth.indexOf('bimWork_rzxzsjsh')>=0 || auth.indexOf('bimWork_xjlzjhTb')>=0 ||
			 auth.indexOf('bimWork_xjlzjhSh')>=0 || auth.indexOf('bimWork_xjlyjhTb')>=0 ||
			 auth.indexOf('bimWork_xjlyjhSh')>=0 || auth.indexOf('bimWork_xjlyzxsjtb')>=0 ||
			 auth.indexOf('bimWork_xjlyzxsjsh')>=0 || auth.indexOf('bimWork_clfzsjtb')>=0 ||
			 auth.indexOf('bimWork_clfzsjsh')>=0 || auth.indexOf('bimWork_jwzjcjssjtb')>=0 ||
			 auth.indexOf('bimWork_jwzjcjssjsh')>=0 || auth.indexOf('bimWork_nssjtb')>=0 ||
			 auth.indexOf('bimWork_nssjsh')>=0 || auth.indexOf('bimWork_jsrwsjtb')>=0 ||
			 auth.indexOf('bimWork_jsrwsjsh')>=0 || auth.indexOf('bimWork_jsjesjtb')>=0 ||
			 auth.indexOf('bimWork_jsjesjsh')>=0 || auth.indexOf('bimWork_cwryzzsjtb')>=0 ||
			 auth.indexOf('bimWork_cwryzzsjsh')>=0 || auth.indexOf('bimWork_ndjhjhgl')>=0 ||
			 auth.indexOf('bimWork_jhxmjbxxwh')>=0 || auth.indexOf('bimWork_jhxmsxxxwh')>=0 ||
			 auth.indexOf('bimWork_sqbjxmsh')>=0 || auth.indexOf('bimWork_ldshgsjhsx')>=0 ||
			 auth.indexOf('bimWork_jhzgxxwh')>=0 || auth.indexOf('bimWork_jhsxldcx')>=0 ||
			 auth.indexOf('bimWork_jhsxybcx')>=0 || auth.indexOf('bimWork_ndjhgsfxwtqd')>=0 ||
			 auth.indexOf('bimWork_ndjhzgcswtqd')>=0 || auth.indexOf('bimWork_ndjhgsfxwttj')>=0 ||
			 auth.indexOf('bimWork_bbz')>=0 || auth.indexOf('bimWork_bbys')>=0 ||
			 auth.indexOf('bimWork_cwstz')>=0 || auth.indexOf('bimWork_zsk_cwgl')>=0 ||
			 auth.indexOf('bimWork_wbdbgx')>=0 || auth.indexOf('bimWork_wbdbsjtb')>=0 ||
			 auth.indexOf('bimWork_wbdbsjsh')>=0 || auth.indexOf('bimWork_yswcjgscx')>=0 ||
			 auth.indexOf('bimWork_cwlsstz')>=0 || auth.indexOf('bimWork_swwtbgscx')>=0){
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
		// 行政办公
		if (pageIndex == 3){
			if (pageList.indexOf('bimWork_gwsjsb') >= 0 || pageList.indexOf('bimWork_gwsjsh') >= 0 
			|| pageList.indexOf('bimWork_dbsjsb') >= 0 || pageList.indexOf('bimWork_dbsjsh') >= 0
			|| pageList.indexOf('bimWork_bmfxsjsjsb') >= 0 || pageList.indexOf('bimWork_bmfxsjsjsh') >= 0
			|| pageList.indexOf('bimWork_yqsjsjsb') >= 0 || pageList.indexOf('bimWork_yqsjsjsh') >= 0
			|| pageList.indexOf('bimWork_zsk_ndzdxmgcgl') >= 0 || pageList.indexOf('bimWork_zsk_ndzdxmgcjz') >= 0){
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
		// 人力资源
		if (pageIndex == 4){
			if (pageList.indexOf('bimWork_headCountSb') >= 0 || pageList.indexOf('bimWork_headCountSh') >= 0 
			|| pageList.indexOf('bimWork_laborCostSb') >= 0 || pageList.indexOf('bimWork_laborCostSh') >= 0
			|| pageList.indexOf('bimWork_managerialStaffSb') >= 0 || pageList.indexOf('bimWork_managerialStaffSh') >= 0
			|| pageList.indexOf('bimWork_employeecarestSb') >= 0 || pageList.indexOf('bimWork_employeecarestSh') >= 0){
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
		// 市场占有率
		if (pageIndex == 5){
			if (pageList.indexOf('bimWork_sixRateKpTb') >= 0 || pageList.indexOf('bimWork_sixRateKpSh') >= 0 
			|| pageList.indexOf('bimWork_sixRateDcTb') >= 0 || pageList.indexOf('bimWork_sixRateDcSh') >= 0){
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
		// 社会责任
		if (pageIndex == 6){
			if (pageList.indexOf(',bimWork_voluntarySb,') >= 0 || pageList.indexOf(',bimWork_voluntarySh,') >= 0 
			|| pageList.indexOf(',bimWork_mediaSb,') >= 0 || pageList.indexOf(',bimWork_mediaSh,') >= 0
			|| pageList.indexOf('bimWork_brandSb') >= 0 || pageList.indexOf('bimWork_brandSh') >= 0
			|| pageList.indexOf('bimWork_newMediaSb') >= 0 || pageList.indexOf('bimWork_newMediaSh') >= 0
			|| pageList.indexOf('bimWork_consensusSb') >= 0 || pageList.indexOf('bimWork_consensusSh') >= 0
			|| pageList.indexOf('bimWork_socialoluntaryservicestSb') >= 0 || pageList.indexOf('bimWork_socialoluntaryservicestSh') >= 0){
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
		// 风险控制
		if (pageIndex == 7){
			if (pageList.indexOf('bimWork_bimr_civilcaseList') >= 0 || pageList.indexOf('bimWork_bimr_civilcaseCheckList') >= 0 
			|| pageList.indexOf('bimWork_bimr_criminalcaseList') >= 0 || pageList.indexOf('bimWork_bimr_criminalcaseCheckList') >= 0
			|| pageList.indexOf('bimWork_bimr_comprehensiveQuery') >= 0 || pageList.indexOf('bimWork_bimr_insidefill') >= 0
			|| pageList.indexOf('bimWork_bimr_weeklylist') >= 0 || pageList.indexOf('bimWork_bimr_insidemaintent') >= 0
			|| pageList.indexOf('bimWork_bimr_insideexamine') >= 0 || pageList.indexOf('bimWork_bimr_rectifylist') >= 0
			|| pageList.indexOf('bimWork_bimr_insideclosed') >= 0 || pageList.indexOf('bimWork_bimr_questionunclosed') >= 0
			|| pageList.indexOf('bimWork_bimr_questionanalysis') >= 0 || pageList.indexOf('bimWork_bimr_contractimport') >= 0
			|| pageList.indexOf('bimWork_bimr_contractexamine') >= 0 || pageList.indexOf('bimWork_bimr_contractlook') >= 0
			|| pageList.indexOf('bimWork_bimr_contractdetailLook') >= 0 || pageList.indexOf('bimWork_bimr_contractModellist') >= 0
			|| pageList.indexOf('bimWork_bimr_contractModellookList') >= 0 || pageList.indexOf('bimWork_bimr_riskCataloglist') >= 0
			|| pageList.indexOf('bimWork_bimr_riskCatalogauditList') >= 0 || pageList.indexOf('bimWork_bimr_riskCatalogtreeView') >= 0
			|| pageList.indexOf('bimWork_bimr_riskCatalogScorelist') >= 0 || pageList.indexOf('bimWork_bimr_bylawInfoList') >= 0
			|| pageList.indexOf('bimWork_bimr_synRecords') >= 0 || pageList.indexOf('bimWork_bimr_bylawInfoTree') >= 0
			|| pageList.indexOf('bimWork_bimr_dutylist') >= 0 || pageList.indexOf('bimWork_bimr_criminalcaseCheckList') >= 0
			|| pageList.indexOf('bimWork_bimr_archivesList') >= 0 || pageList.indexOf('bimWork_bimr_archivescompanyTree') >= 0
			|| pageList.indexOf('bimWork_bimr_compliancebasic') >= 0 || pageList.indexOf('bimWork_bimr_compliancemanage') >= 0
			|| pageList.indexOf('bimWork_bimr_complianceexamine') >= 0 || pageList.indexOf('bimWork_bimr_compliancereportBJList') >= 0
			|| pageList.indexOf('bimWork_bimr_compliancequeryList') >= 0 || pageList.indexOf('bimWork_bimr_complianceassignList') >= 0
			|| pageList.indexOf('bimWork_bimr_compliancecorrectList') >= 0 || pageList.indexOf('bimWork_bimr_trainlist') >= 0
			|| pageList.indexOf('bimWork_bimr_trainexamineList') >= 0 || pageList.indexOf('bimWork_bimr_trainlookList') >= 0
			|| pageList.indexOf('bimWork_zsk_fxkz') >= 0 || pageList.indexOf('bimWork_bimr_civilcaseQuery') >= 0 
			|| pageList.indexOf('bimWork_bimr_criminalcaseQuery') >= 0 || pageList.indexOf('bimWork_bimr_tracklist') >= 0 
			|| pageList.indexOf('bimWork_bimr_riskEventFeedbacklist') >= 0 || pageList.indexOf('bimWork_bimr_riskEventFeedbackExamine') >= 0 
			|| pageList.indexOf('bimWork_bimr_examineFinishedList') >= 0 || pageList.indexOf('bimWork_bimr_dutyListReport') >= 0 
			|| pageList.indexOf('bimWork_bimr_dutyListReportExamine') >= 0||pageList.indexOf('bimWork_bimr_riskEventProfessionalCompany') >= 0
			||pageList.indexOf('bimWork_bimr_riskEventCoreEnterprise') >= 0||pageList.indexOf(' bimWork_bimr_riskEventIndustrialGroup') >= 0
			||pageList.indexOf('bimWork_bimr_riskEventFillMeasures') >= 0){
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
		// 重点基建工程
		if (pageIndex == 8){
			if (pageList.indexOf('bimWork_zdgcsjtb') >= 0 || pageList.indexOf('bimWork_zdgcsjsh') >= 0
				|| pageList.indexOf('bimWork_zdgcsjck') >= 0 || pageList.indexOf('bimWork_zdgcqxkz') >= 0
				|| pageList.indexOf('bimWork_glyczzdjjgc') >= 0){
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
		// 最新动态
		if (pageIndex == 9){
			if (pageList.indexOf('bimWork_zxdt') >= 0){
				window.open(url, "_blank");
				return;
			} else {
				alert("您没有这块的权限");
				return;
			}
		}
	}
	
	function openNewWindowWithAuth(authority,url) {
		if (pageCodes.indexOf(authority) >= 0){
			window.open(url, "_blank");
			return;
		} else {
			alert("您没有这块的权限");
			return;
		}
	}	
	
	function openNewWindowAlarm(id,url) {
		var temp = $("#"+id).text();
		if(temp != 0 && temp != '-' ){
			window.open(url, "_blank");
			return;
		}else{
			return;
		}
	}
	
	function openNewWindow(url) {
			window.open(url, "_blank");
	}	
	
	function seachKnowledge1(authority){
		if (pageCodes.indexOf(authority) >= 0){
			var documentName = $("#documentName").val();
			var url = basepath + '/knowledgeStoreHouse/index?documentName=' + documentName;
			openNewWindow(url);
			return;
		} else {
			alert("您没有这块的权限");
			return;
		}
		
	}
	
	function seachKnowledge2(authority,type){
		if (pageCodes.indexOf(authority) >= 0){
			var documentName = $("#documentName").val();
			var url = basepath + '/knowledgeStoreHouse/moduleList?documentName=' + documentName +"&type=" + type;
			openNewWindow(url);
			return;
		} else {
			alert("您没有这块的权限");
			return;
		}
		
	}
	</script>
</body>
</html>
<script type="text/javascript" src="<c:url value="/js/validation.js"/>"></script>
