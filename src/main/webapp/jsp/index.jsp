<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
	<meta charset="utf-8" />
	<title>上海国资委数据治理平台</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta content="" name="author" />

	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/layout.min.css" rel="stylesheet" type="text/css" />
	<link href="font/iconfont.css" rel="stylesheet" type="text/css" />
	<link href="css/gold.min.css" rel="stylesheet" type="text/css" id="style_color" />
	<link href="new-font/iconfont.css" rel="stylesheet" type="text/css" />
	<link href="font_qyyox8rdic/iconfont.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/menu.js" type="text/javascript"></script>
	
	<link href="css/window.css" rel="stylesheet" />
	<script src="js/window.js"></script>
	<style type="text/css">
	
	a {
    color: #ffffff;
    text-decoration: none;
      }

.page-sidebar .page-sidebar-menu>li>a, .page-sidebar-closed.page-sidebar-fixed .page-sidebar:hover .page-sidebar-menu>li>a {
    border-top: 1px solid #F0F5F7;
    color: #ffffff;
      }

.page-sidebar .page-sidebar-menu>li>a>i[class*=icon-], .page-sidebar .page-sidebar-menu>li>a>i[class^=icon-], .page-sidebar-closed.page-sidebar-fixed .page-sidebar:hover .page-sidebar-menu>li>a>i[class*=icon-], .page-sidebar-closed.page-sidebar-fixed .page-sidebar:hover .page-sidebar-menu>li>a>i[class^=icon-] {
    color: #f5f5f5;
}


.page-sidebar .page-sidebar-menu li:hover>a>.arrow.open:before, .page-sidebar .page-sidebar-menu li:hover>a>.arrow:before, .page-sidebar .page-sidebar-menu li>a>.arrow.open:before, .page-sidebar .page-sidebar-menu li>a>.arrow:before, .page-sidebar-closed.page-sidebar-fixed .page-sidebar:hover .page-sidebar-menu li:hover>a>.arrow.open:before, .page-sidebar-closed.page-sidebar-fixed .page-sidebar:hover .page-sidebar-menu li:hover>a>.arrow:before, .page-sidebar-closed.page-sidebar-fixed .page-sidebar:hover .page-sidebar-menu li>a>.arrow.open:before, .page-sidebar-closed.page-sidebar-fixed .page-sidebar:hover .page-sidebar-menu li>a>.arrow:before {
    color: #f5f5f5;
}

.oleyTop{

    border-top: 1px solid #F0F5F7;
    background: #447aef
}

	</style>
	
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-closed page-sidebar-menu-closed">
	<div id="tanchuceng">
		<div class="mask">
			<div class="tanc">
				
			</div>
		</div>
	</div>
	<div class="page-wrapper">
		<div class="page-header navbar navbar-fixed-top" style="background-color:#021352;">
			<!-- BEGIN HEADER INNER -->
			<div class="page-header-inner ">
				<!-- BEGIN LOGO -->
				<div class="page-logo">
					<%-- <a href="javascript:;">
						<img src="<c:url value="img/gslogo1-01.png"/>" alt="logo" class="logo-default" style="width: 44px;height: 44px;margin: 5px 2px 2px 2px;" />
						<img src="<c:url value="img/gs-big-01.png"/>" alt="logo" class="logo-default1" style="height: 44px; display: none;" /></a> --%>
					<div class="menu-toggler sidebar-toggler">
						<span></span>
					</div>
				</div>

				<div class="top-menu">
					<!--提示栏开始 -->
					<ul class="nav navbar-nav pull-right">

								<li class="dropdown dropdown-quick-sidebar-toggler">
									<a href='${pageContext.request.contextPath}/HomePage/Index' class="dropdown-toggle">
										<i class="iconfont icon-shujuchaxun"></i>
									</a>
								</li>
								<li class="dropdown dropdown-quick-sidebar-toggler">
									<a href='${pageContext.request.contextPath}/index' class="dropdown-toggle">
										<i class="iconfont icon-yujing"></i>
									</a>
								</li>
								<li class="dropdown dropdown-quick-sidebar-toggler">
									<a href='${pageContext.request.contextPath}/exit' class="dropdown-toggle">
										<i class="iconfont icon-chain-broken"></i>
									</a>
								</li>

							</ul>
					<!-- 提示栏结束 -->
				</div>

				<!-- END TOP NAVIGATION MENU -->
			</div>
			<!-- END HEADER INNER -->
		</div>

		<div class="clearfix"></div>
	
		<div class="page-container">
			<div class="page-sidebar-wrapper" >
			
				<div class="page-sidebar navbar-collapse collapse" id="_menu">
					<ul class="page-sidebar-menu page-header-fixed page-sidebar-menu-closed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 40px">
						<li class="sidebar-toggler-wrapper hide">
							<div class="sidebar-toggler"><span></span></div>
						</li>
					<%-- 	<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #447aef"><i class="fa icon-guest"></i>
								<span class="title">企业人事信息</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href="${pageContext.request.contextPath}/hr/_list" target="mainFrame" class="nav-link">
										<span class="title">企业人事信息查询</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href="${pageContext.request.contextPath}/hr/_chklist" target="mainFrame" class="nav-link">
										<span class="title">企业人事信息审核</span>
									</a>
								</li>
							</ul>
						</li> --%>
							<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #021352; border-top: 1px solid #F0F5F7;    border-bottom: 1px solid #F0f5F7;"><i class="fa icon-yujing"></i>
								<span class="title">传感器综合查询</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/angle/_list' target="mainFrame" class="nav-link">
										<span class="title">传感器综合管理</span>
									</a>
								</li>
							</ul>
						</li>
						<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #021352;  border-top: 1px solid #F0F5F7;    border-bottom: 1px solid #F0f5F7;"><i class="fa icon-yujing"></i>
								<span class="title">传感器角度</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/angle/_list' target="mainFrame" class="nav-link">
										<span class="title">角度信息管理</span>
									</a>
								</li>
								<li class="nav-item-1">

									<a href='${pageContext.request.contextPath}/Warning/Warninglist' target="mainFrame" class="nav-link">
										<span class="title">预警管理</span>

									<a href='${pageContext.request.contextPath}/angle/countManage' target="mainFrame" class="nav-link">
										<span class="title">角度统计管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/angle/_accelationlist' target="mainFrame" class="nav-link">
										<span class="title">角度预警管理</span>

									</a>
								</li>
							</ul>
						</li>
						<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #021352; border-top: 1px solid #F0F5F7;    border-bottom: 1px solid #F0f5F7;"><i class="fa icon-yujing"></i>
								<span class="title">传感器加速度</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/accelation/_list' target="mainFrame" class="nav-link">
										<span class="title">加速度信息管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/accelation/countManage' target="mainFrame" class="nav-link">
										<span class="title">加速度统计管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/accelation/_accelationlist' target="mainFrame" class="nav-link">
										<span class="title">加速度预警管理</span>
									</a>
								</li>
							</ul>
						</li>
						<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #021352; border-top: 1px solid #F0F5F7;    border-bottom: 1px solid #F0f5F7;"><i class="fa icon-yujing"></i>
								<span class="title">传感器电阻应变</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/strain/_list' target="mainFrame" class="nav-link">
										<span class="title">电阻应变信息管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/strain/countManage' target="mainFrame" class="nav-link">
										<span class="title">电阻应变统计管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/strain/_accelationlist' target="mainFrame" class="nav-link">
										<span class="title">电阻应变预警管理</span>
									</a>
								</li>
							</ul>
						</li>
							<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #021352; border-top: 1px solid #F0F5F7;    border-bottom: 1px solid #F0f5F7;"><i class="fa icon-yujing"></i>
								<span class="title">传感器陀螺仪</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/gyro/_list' target="mainFrame" class="nav-link">
										<span class="title">陀螺仪信息管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/gyro/countManage' target="mainFrame" class="nav-link">
										<span class="title">陀螺仪统计管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/gyro/_accelationlist' target="mainFrame" class="nav-link">
										<span class="title">陀螺仪预警管理</span>
									</a>
								</li>
							</ul>
						</li>
							<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #021352; border-top: 1px solid #F0F5F7;    border-bottom: 1px solid #F0f5F7;"><i class="fa icon-yujing"></i>
								<span class="title">传感器温度</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/temperature/_list' target="mainFrame" class="nav-link">
										<span class="title">温度信息管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/temperature/countManage' target="mainFrame" class="nav-link">
										<span class="title">温度统计管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/temperature/_accelationlist' target="mainFrame" class="nav-link">
										<span class="title">温度预警管理</span>
									</a>
								</li>
							</ul>
						</li>
						<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #021352; border-top: 1px solid #F0F5F7;    border-bottom: 1px solid #F0f5F7;"><i class="fa icon-yujing"></i>
								<span class="title">传感器湿度</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/humidity/_list' target="mainFrame" class="nav-link">
										<span class="title">湿度信息管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/humidity/countManage' target="mainFrame" class="nav-link">
										<span class="title">湿度统计管理</span>
									</a>
								</li>
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/humidity/_accelationlist' target="mainFrame" class="nav-link">
										<span class="title">湿度预警管理</span>
									</a>
								</li>
							</ul>
						</li>
					

						<li class="nav-item">
							<a href="javascript:;" class="nav-link nav-toggle"  style="background: #021352; border-top: 1px solid #F0F5F7;    border-bottom: 1px solid #F0f5F7;"><i class="fa icon-yujing"></i>
								<span class="title">系统管理</span><span class="selected"></span><span class="arrow open"></span>
							</a>
							<ul class="sub-menu">
								<li class="nav-item-1">
									<a href='${pageContext.request.contextPath}/user/_list' target="mainFrame" class="nav-link">
										<span class="title">用户管理</span>
									</a>
								</li>


							</ul>
						</li>

				</div>
				<!-- END SIDEBAR -->
			</div>
			
			<!-- END SIDEBAR -->
			<!-- BEGIN CONTENT -->
			<div class="page-content-wrapper">
				<!-- BEGIN CONTENT BODY -->
				<div class="page-content">
					<iframe id="mainFrame" name="mainFrame" scrolling="no" src="${pageContext.request.contextPath}/HomePage/EarlyWarningStatistics" frameborder="0" style="padding: 0px; width: 100%; "></iframe>
				</div>
	
			</div>
			
			<div class="page-footer">
				<div class="page-footer-inner"> 2019 &copy; 
					<a href="http://www.softline.sh.cn" title="softline" target="_blank">技术支持：上海软中信息技术有限公司</a>
				</div>
				<div class="scroll-to-top">
					<i class="fa icon-arrow-up"></i>
				</div>
			</div>
			

		</div>
	</div>
</body>
</html>


<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<script src="js/excanvas.min.js"></script> 
	<script src="js/ie8.fix.min.js"></script> 
<![endif]-->
<script>
	(function(){
		var win = window;  
		while(win.parent != win){win = win.parent}; //循环判断是否是父级页面
		//init
		var tanchuceng = $('#tanchuceng')[0];
		var layer_html = tanchuceng.innerHTML;
		tanchuceng.innerHTML = '';
		var element_from_html = function(html){
			var element = document.createElement('div');
			return $(element).html(html).find('>*')[0];
		}
		win.openDialog = function(element){
			// 新建一层
			var layer = element_from_html(layer_html);
			tanchuceng.appendChild(layer)
			layer.style.display = 'block';
			// 填充内容
			$(layer).find('.tanc')[0].appendChild($(element).clone(true)[0]);
			var html = document.documentElement;    
			var top = 0;//html.scrollTop;   var top=document.body.scrollTop;   top的高度为滚动的高度
			var windowHeight = html.clientHeight;  
			layer.style.top=top + "px";  
			var windowWidth = html.clientWidth;  
			$("html,body").scrollTop(0);
			$("html,body").css({overflow:"hidden"}); //禁用滚动条  
			$(".jump-floor-1").css({display:"block"});
	        $(".jump-floor-1").addClass("ww_1");
		}
		win.closeDialog = function(element){
	        $(".jump-floor-1").removeClass("ww_1");
	        $(".jump-floor-1").addClass("ww");
			tanchuceng.removeChild(tanchuceng.childNodes[tanchuceng.childNodes.length-1]);
			var html = document.documentElement;   
			var top = 0;//html.scrollTop;  
			var windowHeight = html.scrollHeight;  
			if( typeof($(".jump-floor-1").css("display")) == "undefined"){
				$("html,body").css({overflow:"auto"});
			}
		}
	})();

	var set_height = function(){
		var subWeb = window.frames["mainFrame"].contentWindow || window.frames["mainFrame"].document;
		var ifm = $('#mainFrame')[0];
		
		// 子页面内容高度
		var sub_height = 10;// 设置给子页面html和body的冗余高度
		$(subWeb.body).find('>*').each(function(){
			sub_height += this.offsetHeight;
		});
		
		// menu的高度
		var menu_height;
		var menu = $('.page-sidebar-menu');
		if(menu.hasClass('page-sidebar-menu-closed')){
			menu_height = 40;
			$(menu).find('.nav-item').each(function(){
				var last = $(this).find('.sub-menu')[0];
				menu_height = Math.max(menu_height,this.clientHeight+this.offsetTop+last.offsetHeight+last.offsetTop);
			});
		}else{
			menu_height = $('.page-sidebar')[0].clientHeight;
		}
		
		// 当前页面高度-头-尾
		var page_height = document.documentElement.clientHeight-$('.page-header')[0].offsetHeight-$('.page-footer')[0].offsetHeight;
		
		var height = Math.max(sub_height,menu_height,page_height);
		
		var h = parseInt(ifm.height);
		if(h != height){
			ifm.height = height;
			return true;
		}
		return false;
	};
	var scroll_sidebar = function() {
		setTimeout(set_height, 15);
	};
	setInterval(scroll_sidebar,1000);
	$('#_menu').click(scroll_sidebar);
	$('.menu-toggler.sidebar-toggler').click(scroll_sidebar);
	
	
	function getConfirmCounts(){
		//var url="${pageContext.request.contextPath}/property/index";
		var url="http://localhost:8765/property/index";
		window.open(url, "首页");
	}
</script>
