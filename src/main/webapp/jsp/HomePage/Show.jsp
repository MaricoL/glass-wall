<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>城市建筑安全监测可视化平台</title>
	<link href="${pageContext.request.contextPath}/HomeAssets/css/gif.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/HomeAssets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/HomeAssets/css/p1.css" rel="stylesheet" type="text/css" />
   <link href="${pageContext.request.contextPath}/HomeAssets/css/Leftstyle.css" rel="stylesheet" type="text/css" />

</head>
<body>
<%-- <ul id="navigation" style="
    padding-top: 175px;
">
	<li class="about"><a href="${pageContext.request.contextPath}/HomePage/SensorStatistics" title="传感器"></a></li>
	<li class="home"><a href="${pageContext.request.contextPath}/index" title="工作台"></a></li>
	<li class="search"><a href="${pageContext.request.contextPath}" title="退出"></a></li>
<!-- 	<li class="photos"><a href="http://www.bingdou.net/" title="Photos"></a></li> -->
<!-- 	<li class="rssfeed"><a href="http://www.bingdou.net/" title="Rss Feed"></a></li> -->
<!-- 	<li class="podcasts"><a href="http://www.bingdou.net/" title="Podcasts"></a></li> -->
<!-- 	<li class="contact"><a href="http://www.bingdou.net/" title="Contact"></a></li> -->
</ul> --%>

	<div class="container">
	<div class="top-menu">
					<!--提示栏开始 -->
					<ul class="nav navbar-nav pull-right">

								<li class="dropdown dropdown-quick-sidebar-toggler">
									<a href='${pageContext.request.contextPath}/HomePage/Index' class="dropdown-toggle">
										<!-- <i class="iconfont icon-shujuchaxun"></i> -->
										<img src="${pageContext.request.contextPath}/img/home.png">
									</a>
								</li> 
								<li class="dropdown dropdown-quick-sidebar-toggler">
									<a href='${pageContext.request.contextPath}/HomePage/SensorStatistics' class="dropdown-toggle">
										<!-- <i class="iconfont icon-rizhi"></i> -->
										<img src="${pageContext.request.contextPath}/img/chuanganqi.png">
									</a>
								</li> 
								<li class="dropdown dropdown-quick-sidebar-toggler">
									<a href='${pageContext.request.contextPath}/index' class="dropdown-toggle">
										<!-- <i class="iconfont icon-yujing"></i> -->
										<img src="${pageContext.request.contextPath}/img/gongzuotai.png">
									</a>
								</li>
								<li class="dropdown dropdown-quick-sidebar-toggler">
									<a href='${pageContext.request.contextPath}/exit' class="dropdown-toggle">
										<!-- <i class="iconfont icon-chain-broken"></i> -->
										<img src="${pageContext.request.contextPath}/img/dianyuan.png">
									</a>
								</li>

							</ul>
					<!-- 提示栏结束 -->
				</div>
		<div class="main clearfix p1_margin" style="margin-top:20px">
			<div class='top_left_p1'>
				<div class="left">
					<div>
						<span>Com Num</span>
						<select>
							<option>COM3</option>
						</select>	
					</div>
					<div>
						<span>Baud Rate</span>
						<select>
							<option>COM3</option>
						</select>	
					</div>
					<div>
						<span>Data Bits</span>
						<select>
							<option>8</option>
						</select>	
					</div>
					<div>
						<span>SN</span>
						<select>
							<option>12</option>
						</select>	
					</div>
				</div>
				<div class="right">
					<div>
						<span>Parity Bit</span>
						<select>
							<option>NONE</option>
						</select>	
					</div>
					<div>
						<span>Stop Bit</span>
						<select>
							<option>1</option>
						</select>	
					</div>
					<div>
						<span>传感器编号</span>
						<select id="sensorSelect">
							<c:forEach var="sensorName" items="${sensorNameList }">
								<option name="sensorName">${sensorName }</option>
							</c:forEach>
							
						</select>	
					</div>
					<button class="btn_start" id="start">开始</button>
					<button class="btn_stop" id="end">暂停</button>
				</div>
			</div>
			<div class='top_right_p1'>
				<!-- <table class="blue_border" cellspacing="20">
							<tr>
								<td>Accleration</td>
								<td>Gyro</td>
								<td>Angle</td>
							</tr>
							<tr>
								<td>X DATA: 100</td>
								<td>X DATA: 93</td>
								<td>Angle_m: 137</td>
							</tr>
							<tr>
								<td>Y DATA: 88</td>
								<td>Y DATA: 113</td>
								<td></td>
							</tr>
							<tr>
								<td>Z DATA: 103</td>
								<td>Z DATA: 39</td>
								<td></td>
							</tr>
						</table> -->
						<div class="dateSearch">
							<label for="start" style="color:#b8bac9;">起始日期：</label><input id="dateTime1" type="text" class="start" style="height:25px;">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="end"   style="color:#b8bac9;">结束日期：</label><input id="dateTime2" type="text" class="end" style="height:25px;">
							<br/>
							<div style="margin-top:40px;color:#b8bac9;">
								<span>传感器编号</span>
								<select id="sensorSelect"  >
									<c:forEach var="sensorName" items="${sensorNameList }">
										<option name="sensorName">${sensorName }</option>
									</c:forEach>
								</select>	
							</div>
							
							<button class="btn_start"  id="searchByCondition">查询</button>
						</div>
						
			</div>
		</div>
		<div class="main p1_margin"  style="height:300px;">
			<div class="block">
				<h2>压力和温度视图</h2>
				<div class="block_chart" id="getLineChartP1_1" style="width:50%; height:260px; top:20px; float:left"></div>
				<div class="block_chart" id="getLineChartP1_2" style="width:50%; height:260px; top:20px; float:left"></div>
			</div>
		</div>
		<div class="main p1_margin"  style="height:300px;">
			<div class="block">
				<h2>加速度视图</h2>
				<div class="block_chart" id="getLineChartP1_3" style="width:33%; height:260px; top:20px; float:left"></div>
				<div class="block_chart" id="getLineChartP1_4" style="width:33%; height:260px; top:20px; float:left"></div>
				<div class="block_chart" id="getLineChartP1_5" style="width:33%; height:260px; top:20px; float:left"></div>
			</div>
		</div>
		
	<script src="${pageContext.request.contextPath}/HomeAssets/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/HomeAssets/plugins/echarts/echarts.js"></script>
	<script src="${pageContext.request.contextPath}/HomeAssets/js/menu.js"></script>
	<script src="${pageContext.request.contextPath}/HomeAssets/js/laydate.js"></script>

	<script type="text/javascript">
		$(function() {
			
			$('#navigation a').stop().animate({'marginLeft':'-85px'},1000);

			$('#navigation > li').hover(
				function () {
					$('a',$(this)).stop().animate({'marginLeft':'-2px'},200);
				},
				function () {
					$('a',$(this)).stop().animate({'marginLeft':'-85px'},200);
				}
			);
			
			getLineChartStrain("getLineChartP1_1")
			getLineChartTemperature("getLineChartP1_2")
			getLineChartAcceleration("getLineChartP1_3")
			getLineChartAngle("getLineChartP1_4")
			getLineChartGyro("getLineChartP1_5")
			
			/* 实例化日期时间控件 */
			laydate.render({
				  elem: '#dateTime1',
				  type:'datetime',
				  value:new Date(),
				  btns: ['now', 'confirm']
				});
			laydate.render({
				  elem: '#dateTime2',
				  type:'datetime',
				  value:new Date(new Date().getTime() + 24*60*60*1000),
				  btns: ['now', 'confirm']
				});
			

		})
		
		var myChartStrain;
		var myChartTemperature;
		var myChartAcceleration;
		var myChartAngle;
		var myChartGyro;
		
		function getLineChartStrain(id) {
			myChartStrain = echarts.init(document.getElementById(id));
			option = {
				grid: {
			        left: '3%',
			        right: '8%',
			        bottom: '8%',
			        top: '10%',
			        containLabel: true
			    },
			    title: {
			        text: 'Strain',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 16,
			            color: '#F1F1F3',
			        },
			        left: '50%',
			    },
			    visualMap: {
			    	show: false,
		            top: 10,
		            right: 10,
		            pieces: [{
		                gt: 0,
		                lte: 50,
		                color: '#096'
		            }, {
		                gt: 50,
		                lte: 100,
		                color: '#ffde33'
		            }, {
		                gt: 100,
		                lte: 150,
		                color: '#ff9933'
		            }, {
		                gt: 150,
		                lte: 200,
		                color: '#cc0033'
		            }, {
		                gt: 200,
		                lte: 300,
		                color: '#660099'
		            }, {
		                gt: 300,
		                color: '#7e0023'
		            }],
		            outOfRange: {
		                color: '#999'
		            }
		        },
			    series: [{
			        "data": [],
			        "markLine": {
			            "animation": false,
			            "symbol": "none",
			            "linStyle": {
			                "type": "soild",
			                "width": 4,
			            },
			            "data": [{
			                "name": "优",
			                "yAxis": 50,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#B3FFB3",
			                    }
			                }
			            }, {
			                "name": "良",
			                "yAxis": 100,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#FFFFB3"
			                    }
			                }
			            }, {
			                "name": "轻度",
			                "yAxis": 150,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#F5AF67"
			                    }
			                }
			            }, {
			                "name": "中度",
			                "yAxis": 200,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#FC2E43"
			                    }
			                }
			            }, {
			                "name": "重度",
			                "yAxis": 300,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#cc00cc"
			                    }
			                }
			            }, {
			                "name": "严重",
			                "yAxis": 400,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#990000"
			                    }
			                }
			            }],
			            "label": {
			                "normal": {
			                    "show": true,
			                    "formatter": "{b}"
			                }
			            }
			        },
			        "name": "压力",
			        "symbolSize": 5,
			        "type": "line",
			        "itemStyle": {
	                    "normal": {
	                        "color": "rgba(17,53,176,0.8)"
	                    }
	                }
			    }],			   
			    "tooltip": {
			        "show": true,
			        "trigger": "axis"
			    },
			    "xAxis": [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        "data": [],
			        "interval": 23,
			        "type": "category"
			    }],
			    "yAxis": [{
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            showMinLabel:false,
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        splitLine: {
			        	show:false,
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "min": 0,
			        //"max": 400,
			        "name": "",
			        "scale": false,
			        "type": "value",
			        "minInterval": 50,
			        "interval": 50,
			        
			    }]
			}
			myChartStrain.setOption(option)
		}
		
		// =================================================================
			
		function getLineChartTemperature(id){
			myChartTemperature = echarts.init(document.getElementById(id));
			option = {
				grid: {
			        left: '3%',
			        right: '8%',
			        bottom: '8%',
			        top: '10%',
			        containLabel: true
			    },
			    title: {
			        text: 'Temperature',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 16,
			            color: '#F1F1F3',
			        },
			        left: '50%',
			    },
			    visualMap: {
			    	show: false,
		            top: 10,
		            right: 10,
		            pieces: [{
		                gt: 0,
		                lte: 10,
		                color: '#096'
		            }, {
		                gt: 10,
		                lte: 20,
		                color: '#ffde33'
		            }, {
		                gt: 20,
		                lte: 30,
		                color: '#ff9933'
		            }, {
		                gt: 30,
		                lte: 40,
		                color: '#cc0033'
		            }, {
		                gt: 40,
		                lte: 50,
		                color: '#660099'
		            }, {
		                gt: 50,
		                color: '#7e0023'
		            }],
		            outOfRange: {
		                color: '#999'
		            }
		        },
			    series: [{
			        "data": [],
			        "markLine": {
			            "animation": false,
			            "symbol": "none",
			            "linStyle": {
			                "type": "soild",
			                "width": 4,
			            },
			            "data": [{
			                "name": "10",
			                "yAxis": 10,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#B3FFB3",
			                    }
			                }
			            }, {
			                "name": "20",
			                "yAxis": 20,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#FFFFB3",
			                    }
			                }
			            }, {
			                "name": "30",
			                "yAxis": 30,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#F5AF67",
			                    }
			                }
			            },{
			                "name": "40",
			                "yAxis": 40,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#FC2E43",
			                    }
			                }
			            }, {
			                "name": "50",
			                "yAxis": 50,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#cc00cc",
			                    }
			                }
			            }, {
			                "name": "良",
			                "yAxis": 100,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#FFFFB3"
			                    }
			                }
			            }, {
			                "name": "轻度",
			                "yAxis": 150,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#F5AF67"
			                    }
			                }
			            }, {
			                "name": "中度",
			                "yAxis": 200,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#FC2E43"
			                    }
			                }
			            }, {
			                "name": "重度",
			                "yAxis": 300,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#cc00cc"
			                    }
			                }
			            }],
			            "label": {
			                "normal": {
			                    "show": true,
			                    "formatter": "{b}"
			                }
			            }
			        },
			        "name": "温度",
			        "symbolSize": 5,
			        "type": "line",
			        "itemStyle": {
	                    "normal": {
	                        "color": "rgba(17,53,176,0.8)"
	                    }
	                }
			    }],			   
			    "tooltip": {
			        "show": true,
			        "trigger": "axis"
			    },
			    "xAxis": [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        "data": [],
			        "interval": 23,
			        "type": "category"
			    }],
			    "yAxis": [{
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            showMinLabel:false,
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        splitLine: {
			        	show:false,
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "min": 0,
			        //"max": 400,
			        "name": "",
			        "scale": false,
			        "type": "value",
			        "minInterval": 50,
			        "interval": 10,
			        
			    }]
			}
			myChartTemperature.setOption(option)
		}
			
			// ===========================================================
		

		function getLineChartP1_1(id) {
			var myChart = echarts.init(document.getElementById(id));
			option = {
				grid: {
			        left: '3%',
			        right: '8%',
			        bottom: '8%',
			        top: '10%',
			        containLabel: true
			    },
			    title: {
			        text: '标题',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 16,
			            color: '#F1F1F3',
			        },
			        left: '50%',
			    },
			    visualMap: {
			    	show: false,
		            top: 10,
		            right: 10,
		            pieces: [{
		                gt: 0,
		                lte: 50,
		                color: '#096'
		            }, {
		                gt: 50,
		                lte: 100,
		                color: '#ffde33'
		            }, {
		                gt: 100,
		                lte: 150,
		                color: '#ff9933'
		            }, {
		                gt: 150,
		                lte: 200,
		                color: '#cc0033'
		            }, {
		                gt: 200,
		                lte: 300,
		                color: '#660099'
		            }, {
		                gt: 300,
		                color: '#7e0023'
		            }],
		            outOfRange: {
		                color: '#999'
		            }
		        },
			    series: [{
			        "data": ["200", "270", "285", "300", "268", "271", "251", "230", "230", "226", "219", "212", "189", "142", "124", "129", "137", "139", "147", "159", "185", "202", "202", "183", "160", "147", "138", "127", "115", "100", "87", "78", "70", "67", "73", "75", "67", "60", "58", "58", "59", "63", "73", "97", "117", "138", "160", "176", "149", "127", "103", "90", "140", "165", "175", "170", "153", "145", "159", "172", "176", "147", "123", "108", "82", "60", "50", "38", "30", "28", "28", "25", "19", "19", "19", "19", "19", "19", "18", "18", "18", "16", "16", "16", "16", "16", "14", "14", "14", "14", "13", "13", "14", "14", "14", "15", "15", "16", "20", "30", "38", "33", "28", "28", "29", "29", "30", "33", "39", "42", "38", "33", "32", "30", "32", "29", "28", "26", "23", "22"],
			        "markLine": {
			            "animation": false,
			            "symbol": "none",
			            "linStyle": {
			                "type": "soild",
			                "width": 4,
			            },
			            "data": [{
			                "name": "优",
			                "yAxis": 50,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#B3FFB3",
			                    }
			                }
			            }, {
			                "name": "良",
			                "yAxis": 100,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#FFFFB3"
			                    }
			                }
			            }, {
			                "name": "轻度",
			                "yAxis": 150,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#F5AF67"
			                    }
			                }
			            }, {
			                "name": "中度",
			                "yAxis": 200,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#FC2E43"
			                    }
			                }
			            }, {
			                "name": "重度",
			                "yAxis": 300,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#cc00cc"
			                    }
			                }
			            }, {
			                "name": "严重",
			                "yAxis": 400,
			                "itemStyle": {
			                    "normal": {
			                        "color": "#990000"
			                    }
			                }
			            }],
			            "label": {
			                "normal": {
			                    "show": true,
			                    "formatter": "{b}"
			                }
			            }
			        },
			        "name": "压力",
			        "symbolSize": 5,
			        "type": "line",
			        "itemStyle": {
	                    "normal": {
	                        "color": "rgba(17,53,176,0.8)"
	                    }
	                }
			    }],			   
			    "tooltip": {
			        "show": true,
			        "trigger": "axis"
			    },
			    "xAxis": [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        "data": ["05日\n00时", "05日\n01时", "05日\n02时", "05日\n03时", "05日\n04时", "05日\n05时", "05日\n06时", "05日\n07时", "05日\n08时", "05日\n09时", "05日\n10时", "05日\n11时", "05日\n12时", "05日\n13时", "05日\n14时", "05日\n15时", "05日\n16时", "05日\n17时", "05日\n18时", "05日\n19时", "05日\n20时", "05日\n21时", "05日\n22时", "05日\n23时", "06日\n00时", "06日\n01时", "06日\n02时", "06日\n03时", "06日\n04时", "06日\n05时", "06日\n06时", "06日\n07时", "06日\n08时", "06日\n09时", "06日\n10时", "06日\n11时", "06日\n12时", "06日\n13时", "06日\n14时", "06日\n15时", "06日\n16时", "06日\n17时", "06日\n18时", "06日\n19时", "06日\n20时", "06日\n21时", "06日\n22时", "06日\n23时", "07日\n00时", "07日\n01时", "07日\n02时", "07日\n03时", "07日\n04时", "07日\n05时", "07日\n06时", "07日\n07时", "07日\n08时", "07日\n09时", "07日\n10时", "07日\n11时", "07日\n12时", "07日\n13时", "07日\n14时", "07日\n15时", "07日\n16时", "07日\n17时", "07日\n18时", "07日\n19时", "07日\n20时", "07日\n21时", "07日\n22时", "07日\n23时", "08日\n00时", "08日\n01时", "08日\n02时", "08日\n03时", "08日\n04时", "08日\n05时", "08日\n06时", "08日\n07时", "08日\n08时", "08日\n09时", "08日\n10时", "08日\n11时", "08日\n12时", "08日\n13时", "08日\n14时", "08日\n15时", "08日\n16时", "08日\n17时", "08日\n18时", "08日\n19时", "08日\n20时", "08日\n21时", "08日\n22时", "08日\n23时", "09日\n00时", "09日\n01时", "09日\n02时", "09日\n03时", "09日\n04时", "09日\n05时", "09日\n06时", "09日\n07时", "09日\n08时", "09日\n09时", "09日\n10时", "09日\n11时", "09日\n12时", "09日\n13时", "09日\n14时", "09日\n15时", "09日\n16时", "09日\n17时", "09日\n18时", "09日\n19时", "09日\n20时", "09日\n21时", "09日\n22时", "09日\n23时"],
			        "interval": 23,
			        "type": "category"
			    }],
			    "yAxis": [{
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            showMinLabel:false,
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        splitLine: {
			        	show:false,
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        "min": 0,
			        //"max": 400,
			        "name": "",
			        "scale": false,
			        "type": "value",
			        "minInterval": 50,
			        "interval": 50,
			        
			    }]
			}
			myChart.setOption(option)
		}
		function getLineChartP1_2(id) {
		 	var myChart = echarts.init(document.getElementById(id));
			option = {
				title: {
			        text: '标题',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 16,
			            color: '#F1F1F3',
			        },
			        left: '50%'
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    },
			    legend: {
			        icon: 'rect',
			        itemWidth: 14,
			        itemHeight: 5,
			        itemGap: 13,
			        data: ['1111', '2222', '3333'],
			        right: '3%',
			        top: '4%',
			        textStyle: {
			            fontSize: 12,
			            color: '#F1F1F3'
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '8%',
			        top: '20%',
			        containLabel: true
			    },
			    xAxis: [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
			    }],
			    yAxis: [{
			        type: 'value',
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        splitLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    }],
			    series: [{
			        name: '1111',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(218, 247, 89, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(218, 247, 89, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#dbf95a'
			            }
			        },
			        data: [96.3,96.4,97.5,95.6,98.1,94.8,89.6,94.1,80.1,52.4,75.8,94.7]
			    }, {
			        name: '2222',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(0, 255, 232, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(0, 255, 232, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#00ffe8'
			            }
			        },
			        data: [97.3,99.2,99.3,100.0,99.6,90.6,80.0,91.5,69.8,67.5,90.4,84.9]
			    }, {
			        name: '3333',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(34, 164, 255, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(34, 164, 255, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#22a4ff'
			            }
			        },
			        data: [84.2,81.0,67.5,72.1,43.7,88.5,91.9,101.8,79.7,87.6,92.9,0]
			    }, ]
			};
			myChart.setOption(option)
		}
		
		
		function getLineChartAcceleration(id) {
		 	myChartAcceleration = echarts.init(document.getElementById(id));
			option = {
				title: {
			        text: '加速度',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 16,
			            color: '#F1F1F3',
			        },
			        left: '50%'
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    },
			    legend: {
			        icon: 'rect',
			        itemWidth: 14,
			        itemHeight: 5,
			        itemGap: 13,
			        data: ['X', 'Y', 'Z'],
			        right: '3%',
			        top: '4%',
			        textStyle: {
			            fontSize: 12,
			            color: '#F1F1F3'
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '8%',
			        top: '20%',
			        containLabel: true
			    },
			    xAxis: [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        data: []
			    }],
			    yAxis: [{
			        type: 'value',
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        splitLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    }],
			    series: [{
			        name: 'X',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(218, 247, 89, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(218, 247, 89, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#dbf95a'
			            }
			        },
			        data: []
			    }, {
			        name: 'Y',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(0, 255, 232, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(0, 255, 232, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#00ffe8'
			            }
			        },
			        data: []
			    }, {
			        name: 'Z',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(34, 164, 255, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(34, 164, 255, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#22a4ff'
			            }
			        },
			        data: []
			    }, ]
			};
			myChartAcceleration.setOption(option)
		}
		
		// =============================
			
			
			
			
		function getLineChartAngle(id) {
		 	myChartAngle = echarts.init(document.getElementById(id));
			option = {
				title: {
			        text: '倾斜角',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 16,
			            color: '#F1F1F3',
			        },
			        left: '50%'
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    },
			    legend: {
			        icon: 'rect',
			        itemWidth: 14,
			        itemHeight: 5,
			        itemGap: 13,
			        data: ['X', 'Y', 'Z'],
			        right: '3%',
			        top: '4%',
			        textStyle: {
			            fontSize: 12,
			            color: '#F1F1F3'
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '8%',
			        top: '20%',
			        containLabel: true
			    },
			    xAxis: [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        data: []
			    }],
			    yAxis: [{
			        type: 'value',
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        splitLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    }],
			    series: [{
			        name: 'X',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(218, 247, 89, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(218, 247, 89, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#dbf95a'
			            }
			        },
			        data: []
			    }, {
			        name: 'Y',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(0, 255, 232, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(0, 255, 232, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#00ffe8'
			            }
			        },
			        data: []
			    }, {
			        name: 'Z',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(34, 164, 255, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(34, 164, 255, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#22a4ff'
			            }
			        },
			        data: []
			    }, ]
			};
			myChartAngle.setOption(option)
		}
		
		// =============================
		
		
		
		
		function getLineChartGyro(id) {
			myChartGyro = echarts.init(document.getElementById(id));
			option = {
				title: {
			        text: '陀螺仪',
			        textStyle: {
			            fontWeight: 'normal',
			            fontSize: 16,
			            color: '#F1F1F3',
			        },
			        left: '50%'
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    },
			    legend: {
			        icon: 'rect',
			        itemWidth: 14,
			        itemHeight: 5,
			        itemGap: 13,
			        data: ['X', 'Y', 'Z'],
			        right: '3%',
			        top: '4%',
			        textStyle: {
			            fontSize: 12,
			            color: '#F1F1F3'
			        }
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '8%',
			        top: '20%',
			        containLabel: true
			    },
			    xAxis: [{
			        type: 'category',
			        boundaryGap: false,
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        data: []
			    }],
			    yAxis: [{
			        type: 'value',
			        axisTick: {
			            show: false
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        },
			        axisLabel: {
			            margin: 10,
			            textStyle: {
			                fontSize: 12,
			                color: 'rgba(255,255,255,0.65)',
			            }
			        },
			        splitLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    }],
			    series: [{
			        name: 'X',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(218, 247, 89, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(218, 247, 89, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#dbf95a'
			            }
			        },
			        data: []
			    }, {
			        name: 'Y',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(0, 255, 232, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(0, 255, 232, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#00ffe8'
			            }
			        },
			        data: []
			    }, {
			        name: 'Z',
			        type: 'line',
			        smooth: true,
			        "symbol": "none",
			        lineStyle: {
			            normal: {
			                width: 2
			            }
			        },
			        areaStyle: {
			            normal: {
			                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
			                    offset: 0,
			                    color: 'rgba(34, 164, 255, 0.5)'
			                }, {
			                    offset: 0.8,
			                    color: 'rgba(34, 164, 255, 0)'
			                }], false),
			                shadowColor: 'rgba(0, 0, 0, 0.1)',
			                shadowBlur: 10
			            }
			        },
			        itemStyle: {
			            normal: {
			                color: '#22a4ff'
			            }
			        },
			        data: []
			    }, ]
			};
			myChartGyro.setOption(option)
		}

    	var strainDataValue = [];
    	var strainDataCreateTime = [];
    	var temperatureDataValue = [];
    	var temperatureDataCreateTime = [];
    	var accelationDataXValue = [];
    	var accelationDataYValue = [];
    	var accelationDataZValue = [];
    	var accelationDataCreateTime = [];
    	var angleDataXValue = [];
    	var angleDataYValue = [];
    	var angleDataZValue = [];
    	var angleDataCreateTime = [];
    	var gyroDataXValue = [];
    	var gyroDataYValue = [];
    	var gyroDataZValue = [];
    	var gyroDataCreateTime = [];
    	
    	

	function getData(startTime,endTime,sensorName){

		 $.ajax({
	            //请求方式
	            type : "GET",
	            //请求的媒体类型
	            contentType: "application/json;charset=UTF-8",
	            //请求地址
	            url : "${pageContext.request.contextPath}/sensor/statistics/"+sensorName+"/"+startTime+"/" + endTime,
	            //数据，json字符串
	            data : {},
	            //请求成功
	            success : function(result) {
	            	var strainData = result.entity.strainData;
	            	var temperatureData = result.entity.tempertureData;
	            	var accelationData = result.entity.accelationData;
	            	var angleData = result.entity.angleData;
	            	var gyroData = result.entity.gyroData;
	            	
	            	if(strainData != null){
	            		strainData.forEach(strain =>{
	            			strainDataValue.push(strain.value);
		            		strainDataCreateTime.push(strain.createTime);
		            		});	            		
	            		}
	            	
	            	if(temperatureData != null){
	            		temperatureData.forEach(teperature =>{
	            			temperatureDataValue.push(teperature.value);
	            			temperatureDataCreateTime.push(teperature.createTime);
		            		});	   
	            	}
	            	
	            	if(accelationData != null){
	            		accelationData.forEach(accelation =>{            			
	            			accelationDataXValue.push(accelation.xvalue);
	    	            	accelationDataYValue.push(accelation.yvalue);
	    	            	accelationDataZValue.push(accelation.zvalue); 
	    	            	accelationDataCreateTime.push(accelation.createTime)
		            		});	   
	            	}
	            	
	            	if(angleData != null){
	            		angleData.forEach(angle =>{            			
	            			angleDataXValue.push(angle.valueone);
	    	            	angleDataYValue.push(angle.valuetwo);
	    	            	angleDataZValue.push(angle.valuethree);
	    	            	angleDataCreateTime.push(angle.createTime);
		            		});	   
	            	}
	            	
	            	if(gyroData != null){
	            		gyroData.forEach(gyro =>{            			
	    	            	gyroDataXValue.push(gyro.xvalue);
	    	            	gyroDataYValue.push(gyro.xvalue);
	    	            	gyroDataZValue.push(gyro.xvalue);
	    	            	gyroDataCreateTime.push(gyro.createTime);
		            		});	   
	            	}	
	            	
	            /* 	
	            	strainDataValue.push(strainData.value);
	            	strainDataCreateTime.push(strainData.createTime);
	            	temperatureDataValue.push(temperatureData.value);
	            	temperatureDataCreateTime.push(temperatureData.createTime);

 	            	accelationDataXValue.push(accelationData.xvalue);
	            	accelationDataYValue.push(accelationData.yvalue);
	            	accelationDataZValue.push(accelationData.zvalue); 
	            	accelationDataCreateTime.push(accelationData.createTime)
	            	
	            	angleDataXValue.push(angleData.valueone);
	            	angleDataYValue.push(angleData.valuetwo);
	            	angleDataZValue.push(angleData.valuethree);
	            	angleDataCreateTime.push(angleData.createTime);
	            	
	            	gyroDataXValue.push(gyroData.xvalue);
	            	gyroDataYValue.push(gyroData.xvalue);
	            	gyroDataZValue.push(gyroData.xvalue);
	            	gyroDataCreateTime.push(gyroData.createTime);
	            	 */
	            	
	            	myChartStrain.setOption({ 
	            		  xAxis: 	{
	                            data: strainDataCreateTime
	                        },
                        series: [{
                            data: strainDataValue
                        }]
                    });
	            	
	            	myChartTemperature.setOption({    
	            		  xAxis: 	{
	                            data: temperatureDataCreateTime
	                        },
                      series: [{
                          data: temperatureDataValue
                      }]
                  });
	            	
	            	myChartAcceleration.setOption({    
	            		  xAxis: 	{
	                            data: accelationDataCreateTime
	                        },
                    	series: [{
                    		name:'X',
                       		data: accelationDataXValue
                    		},{
                    			name:'Y',
                    			data: accelationDataYValue
                    		},{
                    			name:'Z',
                    			data: accelationDataZValue
                    		}
                    ]
                });
	            	
	            	myChartAngle.setOption({    
	            		  xAxis: 	{
	                            data: angleDataCreateTime
	                        },
                  	series: [{
                  		name:'X',
                     		data: angleDataXValue
                  		},{
                  			name:'Y',
                  			data: angleDataYValue
                  		},{
                  			name:'Z',
                  			data: angleDataZValue
                  		}
                  ]
              });
	            	
	            	myChartGyro.setOption({    
	            		  xAxis: 	{
	                            data: gyroDataCreateTime
	                        },
                	series: [{
                		name:'X',
                   		data: gyroDataXValue
                		},{
                			name:'Y',
                			data: gyroDataYValue
                		},{
                			name:'Z',
                			data: gyroDataZValue
                		}
                ]
            });
	            	
	            	
/* 	                console.log(result.entity.strainData); */
	            },
	            //请求失败，包含具体的错误信息
	            error : function(e){
	                console.log(e.status);
	                console.log(e.responseText);
	            }
	        });
	}
	
	function cleanArray(){
		strainDataValue = [];
      	 strainDataCreateTime = [];
      	 temperatureDataValue = [];
      	 temperatureDataCreateTime = [];
      	 accelationDataXValue = [];
      	 accelationDataYValue = [];
      	 accelationDataZValue = [];
      	 accelationDataCreateTime = [];
      	 angleDataXValue = [];
      	 angleDataYValue = [];
      	 angleDataZValue = [];
      	 angleDataCreateTime = [];
      	 gyroDataXValue = [];
      	 gyroDataYValue = [];
      	 gyroDataZValue = [];
      	 gyroDataCreateTime = [];
	}
	
	//生成从minNum到maxNum的随机数
function randomNum(minNum,maxNum){ 
    switch(arguments.length){ 
        case 1: 
            return parseInt(Math.random()*minNum+1,10); 
        break; 
        case 2: 
            return parseInt(Math.random()*(maxNum-minNum+1)+minNum,10); 
        break; 
            default: 
                return 0; 
            break; 
    } 
} 
	

Date.prototype.format = function(fmt) { 
     var o = { 
        "M+" : this.getMonth()+1,                 //月份 
        "d+" : this.getDate(),                    //日 
        "h+" : this.getHours(),                   //小时 
        "m+" : this.getMinutes(),                 //分 
        "s+" : this.getSeconds(),                 //秒 
        "q+" : Math.floor((this.getMonth()+3)/3), //季度 
        "S"  : this.getMilliseconds()             //毫秒 
    }; 
    if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
    }
     for(var k in o) {
        if(new RegExp("("+ k +")").test(fmt)){
             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
         }
     }
    return fmt; 
}   
	
	function generateRandomData(date,startTime,endTime){
		var hours;
		var strainValue;
		var temperaturValue;
		var accelationXvalue;
		var accelationYvalue;
		var accelationZvalue;
		var angleOneValue;
		var angleTwoValue;
		var angleThreeValue = randomNum(3,5);
		var gyroXvalue;
		var gyroYvalue;
		var gyroZvalue;
		
		if(!startTime && !endTime){
			hours = 1;
		}else {
			var d1 = new Date(startTime);
			var d2 = new Date(endTime);
			hours = parseInt(d2 - d1) / 1000 / 60 / 60;
		}
			for(var i = 0 ; i < hours ; i++){
				strainValue = randomNum(50,200);
				temperaturValue = randomNum(20,40);
				accelationXvalue = randomNum(40,150);
				accelationYvalue = randomNum(60,240);
				accelationZvalue = randomNum(0,0);
				angleOneValue = randomNum(3,5);
				angleTwoValue= randomNum(3,5);
				angleThreeValue = randomNum(3,5);
				gyroXvalue = randomNum(200,250);
				gyroYvalue  = randomNum(200,250);
				gyroZvalue  = randomNum(200,250);
				
		    	strainDataValue.push(strainValue);
				strainDataCreateTime.push(date);
		    	
				temperatureDataValue.push(temperaturValue);
				temperatureDataCreateTime.push(date);
		
				accelationDataXValue.push(accelationXvalue);
		       	accelationDataYValue.push(accelationYvalue);
		       	accelationDataZValue.push(accelationZvalue); 
		       	accelationDataCreateTime.push(date);
		
				angleDataXValue.push(angleOneValue);
		       	angleDataYValue.push(angleTwoValue);
		       	angleDataZValue.push(angleThreeValue);
		       	angleDataCreateTime.push(date);
		
		       	gyroDataXValue.push(gyroXvalue);
		       	gyroDataYValue.push(gyroYvalue);
		       	gyroDataZValue.push(gyroZvalue);
		       	gyroDataCreateTime.push(date); 
			}
		
		myChartStrain.setOption({ 
	  		  xAxis: 	{
	                  data: strainDataCreateTime
	              },
	          series: [{
	              data: strainDataValue
	          }]
	      });
	  	
	  	myChartTemperature.setOption({    
	  		  xAxis: 	{
	                  data: temperatureDataCreateTime
	              },
	        series: [{
	            data: temperatureDataValue
	        }]
	    });
	  	

	  	myChartAcceleration.setOption({    
	  		  xAxis: 	{
	                  data: accelationDataCreateTime
	              },
	      	series: [{
	      		name:'X',
	         		data: accelationDataXValue
	      		},{
	      			name:'Y',
	      			data: accelationDataYValue
	      		},{
	      			name:'Z',
	      			data: accelationDataZValue
	      		}
	      ]
	  });

	  	myChartAngle.setOption({    
	  		  xAxis: 	{
	                  data: angleDataCreateTime
	              },
	    	series: [{
	    		name:'X',
	       		data: angleDataXValue
	    		},{
	    			name:'Y',
	    			data: angleDataYValue
	    		},{
	    			name:'Z',
	    			data: angleDataZValue
	    		}
	    ]
	});

	  	myChartGyro.setOption({    
	  		  xAxis: 	{
	                  data: gyroDataCreateTime
	              },
			  	series: [{
			  		name:'X',
			     		data: gyroDataXValue
			  		},{
			  			name:'Y',
			  			data: gyroDataYValue
			  		},{
			  			name:'Z',
			  			data: gyroDataZValue
			  		}
			  ]
			});	

    	

	}
	

	

	
	var job;
	var flag =0;
	var currentSensorName = $('#sensorSelect option:selected') .val();
		/* 开始按钮 */
		$("#start").click(function(){
			var sensorName = $('#sensorSelect option:selected') .val();
	
			if(flag != 0 || currentSensorName != sensorName){
				 cleanArray();
				 flag=0;
			}
			
			// job = window.setInterval("getData(null,null,'"+sensorName+"')",3000);
 			job = window.setInterval("generateRandomData(new Date().format('yyyy-MM-dd hh:mm:ss'))",1000);
 			$("#start").attr('disabled',true);

		});
		
		/* 暂停按钮 */
		$("#end").click(function(){
			window.clearInterval(job);
			$("#start").attr('disabled',false);
		});
		
		$("#searchByCondition").click(function(){
			var startTime = $(".start").val();
			var endTime = $(".end").val();
			if(startTime=='' || endTime==''){
				alert("请选择日期！");
				return false;
			}
			window.clearInterval(job);
			var sensorName = $('#sensorSelect option:selected') .val();
			if(currentSensorName != sensorName){
				 cleanArray();
			}
			flag = 1;
			 cleanArray();
			 generateRandomData(new Date().format('yyyy-MM-dd hh:mm:ss'),startTime,endTime);
		});
	</script>
</body>
</html>