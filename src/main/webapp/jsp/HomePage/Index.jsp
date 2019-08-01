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
	<title>首页</title>
	<link href="${pageContext.request.contextPath}/HomeAssets/css/gif.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/HomeAssets/css/style.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/HomeAssets/css/Leftstyle.css" rel="stylesheet" type="text/css" />


<style>
	
	
	
	
		/* fix 2018-9-11 */
		/* fix end */
	
		body{
			overflow:hidden;
			zoom:0.9;
		}
/* 	.main .rightPart { */
/*     width: 620px; */
/*     float: right; */
/*     padding-right: 35px; */
/*     position: relative; */
/*     /* left: 150px; */ */
/*     bottom: 20px; */
/* } */

.main .block h2 .todetail {
    font-weight: normal;
    font-size: 14px;
    flex: 1;
    text-align: right;
    opacity: 0.7;
    cursor: pointer;
    padding-right: 25px;
}
.gcc{
    color: white;
    height: 34px;
    width: 42px;
    font-size: 24px;
    color: #59baf2;
    font-weight: normal;
    /* padding: 15px 25px 15px 55px; */
    border: 3px solid #1f57c3;
    display: inline-block;
    /* border-left: 0; */
    border-bottom-right-radius: 40px;
    border-top-right-radius: 40px;
    /* position: relative; */
    float: right;
    /* top: -102px; */
    /* padding-left: 20px; */
    padding-right: 10px;
}

</style>


	  
</head>
<body>


<ul id="navigation" style="
    padding-top: 175px;
">
	<li class="home"><a href="${pageContext.request.contextPath}/index" title="工作台"></a></li>
	<li class="about"><a href="${pageContext.request.contextPath}/HomePage/SensorStatistics" title="传感器"></a></li>
	<li class="search"><a href="${pageContext.request.contextPath}" title="退出"></a></li>
<!-- 	<li class="photos"><a href="http://www.bingdou.net/" title="Photos"></a></li> -->
<!-- 	<li class="rssfeed"><a href="http://www.bingdou.net/" title="Rss Feed"></a></li> -->
<!-- 	<li class="podcasts"><a href="http://www.bingdou.net/" title="Podcasts"></a></li> -->
<!-- 	<li class="contact"><a href="http://www.bingdou.net/" title="Contact"></a></li> -->
</ul>


<div class="container containerBg">


		<div class="main clearfix">
			<div class="leftPart">
				<div class="top">
					<h2>武康大楼</h2>
      
                  <a class="menu i i_btn" no=text href="${pageContext.request.contextPath}/index" title="工作台">
			<i class="iconfont icon-gongzuotai"></i>
		</a>
	
					<div class="building">
						<img class="imgLight" src="${pageContext.request.contextPath}/HomeAssets/images/building/light.png" alt="">
						<img class="imgBuilding imgBuildingBorder" src="${pageContext.request.contextPath}/HomeAssets/images/building/buildingBorder.png" alt="">
						<img class="imgBuilding" src="${pageContext.request.contextPath}/HomeAssets/images/building/building.png" alt="">
				
			
				
					</div>
					<div class="tooltipBox">
						<ul>
							<li><span>风压</span> <strong class="data_yellow"></strong></li>
							<li><span>振动</span> <strong class="data_yellow"></strong></li>
							<li><span>倾斜角</span> <strong class="data_yellow"></strong></li>
							<li><span>应力</span> <strong class="data_yellow"></strong></li>
							<li><span>温度</span> <strong class="data_yellow"></strong></li>
							<li><span>应变</span> <strong class="data_yellow"></strong></li>
							<li><span>湿度</span> <strong class="data_yellow"></strong></li>
						</ul>
					</div>
					<div class="buildingSpot">
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>							
						</ul>
						<ul>					
							<li>4</li>
							<li>5</li>
							<li>6</li>							
						</ul>
						<ul>
							<li>7</li>
							<li>8</li>
							<li>9</li>
						</ul>
					</div>
				</div>
				<div class="bottom">
					<div class="block">
						<h2>倾斜角<span class="todetail">>></span></h2>
						<div class="block_chart" id="getPointer1"></div>
					</div>
					<div class="block">
						<h2>温湿度<span class="todetail">>></span></h2>
						<div class="block_chart" id="getLiquidfill1"></div>
					</div>
				</div>
			</div>
			<div class="rightPart">
				<div class="block">
					<h2>应力<span class="todetail">>></span></h2>
					<div class="block_chart" id="getLineChart1"></div>
				</div>
				<div class="block">
					<h2>应变<span class="todetail">>></span></h2>
					<div class="block_chart" id="getLineChart2"></div>
				</div>
				<div class="block">
					<h2>振动<span class="todetail">>></span></h2>
					<div class="block_chart" id="getLineChart3"></div>
				</div>
				<div class="block">
					<h2>风压<span class="todetail">>></span></h2>
					<div class="block_chart" id="getBarChart1"></div>
				</div>
			</div>
			
	
	</div>
	
	
	<script src="${pageContext.request.contextPath}/HomeAssets/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/HomeAssets/plugins/echarts/echarts.js"></script>
	<script src="${pageContext.request.contextPath}/HomeAssets/plugins/echarts/echarts-liquidfill.min.js"></script>
	<script src="${pageContext.request.contextPath}/HomeAssets/js/menu.js"></script>
	
	
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
			
			getLineChart1("getLineChart1")
			getLineChart1("getLineChart2")
			getLineChart2("getLineChart3")
			getBarChart1("getBarChart1")

			getPointer1("getPointer1")
			getLiquidfill1("getLiquidfill1")

			var buildingData=[
				['1','351','39°','213','27℃','12','82°'],
				['2','321','49°','113','22℃','12','82°'],
				['3','351','29°','213','27℃','13','82°'],
				['4','351','39°','213','23℃','12','82°'],
				['5','351','49°','203','27℃','22','82°'],
				['6','331','89°','213','21℃','12','82°'],
				['7','351','49°','223','27℃','9','82°'],
				['8','311','19°','213','20℃','12','82°'],
				['9','301','49°','216','27℃','12','82°']
			]
			$(".buildingSpot li").click(function(event) {
				var index=$(this).html();
				var dataLength=$(".data_yellow").length;

				$(".buildingSpot li").removeClass("active")
				$(this).addClass("active")
				for(var i=0;i<dataLength;i++){
					$(".data_yellow").eq(i).html(buildingData[index-1][i])
				}
			});
			$(".buildingSpot li").eq(0).trigger("click");

		})
		function getLineChart1(id) {
		 	var myChart = echarts.init(document.getElementById(id));
			option = {
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
			        data: ['AAA', 'BBB', 'CCC'],
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
			        axisLabel:{
			        	textStyle:{
			        		fontSize:12,
			        		color:"rgba(255,255,255,0.65)"
			        	}
			        },
			        axisLine: {
			            lineStyle: {
			                color: '#57617B'
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
      		         	showMinLabel:false,
			            textStyle: {
			                fontSize: 14,
			                color:"rgba(255,255,255,0.65)"
			            }
			        },
			        splitLine: {
			            lineStyle: {
			                color: '#57617B'
			            }
			        }
			    }],
			    series: [{
			        name: 'AAA',
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
			        name: 'BBB',
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
			        name: 'CCC',
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

		function getLineChart2(id) {
			var myChart = echarts.init(document.getElementById(id));
			option = {
				grid: {
			        left: '3%',
			        right: '8%',
			        bottom: '8%',
			        top: '15%',
			        containLabel: true
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
			    "series": [{
			        "data": ["217", "270", "285", "300", "268", "271", "251", "230", "230", "226", "219", "212", "189", "142", "124", "129", "137", "139", "147", "159", "185", "202", "202", "183", "160", "147", "138", "127", "115", "100", "87", "78", "70", "67", "73", "75", "67", "60", "58", "58", "59", "63", "73", "97", "117", "138", "160", "176", "149", "127", "103", "90", "140", "165", "175", "170", "153", "145", "159", "172", "176", "147", "123", "108", "82", "60", "50", "38", "30", "28", "28", "25", "19", "19", "19", "19", "19", "19", "18", "18", "18", "16", "16", "16", "16", "16", "14", "14", "14", "14", "13", "13", "14", "14", "14", "15", "15", "16", "20", "30", "38", "33", "28", "28", "29", "29", "30", "33", "39", "42", "38", "33", "32", "30", "32", "29", "28", "26", "23", "22"],
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
			        "name": "振动",
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
			                color:"rgba(255,255,255,0.65)"
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
			                fontSize: 14,
			                color:"rgba(255,255,255,0.65)"
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
		function getBarChart1(id) {
			var myChart = echarts.init(document.getElementById(id));
			option = {
			     grid: {
			         left: '3%',
			         right: '4%',
			         bottom: '3%',
			         top: '12%',
			         containLabel: true
			     },
			     yAxis: [{
			         type: 'value',
			         axisLabel: {
			            interval: 0,
			            fontSize: 14,
			            color:"rgba(255,255,255,0.65)"
			         },
			         splitLine: {
			             show: false
			         },
			         axisLine: {
			             show: false
			         },
			         axisTick: {
			             show: false
			         }
			     }],
			     xAxis: [{
			         type: 'category',
			         axisTick: {
			             show: false
			         },
			         data: ['周一', '周二', '周三', '周四', '周五'],
			         axisLabel: {
			             interval: 0,
			             fontSize: 14,
			             color:"rgba(255,255,255,0.65)"
			         },
			         axisTick: {
			             show: false
			         },
			         splitLine: {
			             show: false
			         },
			         axisLine: {
			             show: false
			         },
			         splitArea: {
			             show: false,
			             //  areaStyle: {
			             //      color: ['rgba(250,250,250,0.0)', 'rgba(250,250,250,0.05)']
			             //  }
			         }
			     }],
			     series: [{
			             type: 'pictorialBar',
			             symbol: 'path://M35,0L35,70L0,70z M35,0L35,70L70,70z',
			             data: [320, 302, 341, 374, 390],
			             barWidth: '50%',
			             // barGap: 1, //柱子之间间距
			             symbolOffset: [0, -15],
			             //					xAxisIndex: 0,
			             //					yAxisIndex: 0,
			             z: 99,
			             label: {
			                 show: true,
			                 position: 'top',
			                 color: '#fff',
			                 fontSize: 24,
			             },
			             itemStyle: {
			                 normal: {
			                     color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
			                         offset: 0,
			                         color: 'rgba(51,189,216,0.3)'
			                     }, {
			                         offset: 0.5,
			                         color: 'rgba(51,189,216,0.3)'
			                     }, {
			                         offset: 0.5,
			                         color: 'rgba(51,189,216,1)'
			                     }, {
			                         offset: 1,
			                         color: 'rgba(51,189,216,1)'
			                     }]),
			                     opacity: 1,
			                 }
			             }
			         },
			         {
			             name: '风压',
			             type: 'pictorialBar',
			             symbol: 'diamond',
			             barWidth: '50%',
			             symbolSize: ['100%', 30],
			             // symbolOffset: [0, 13],
			             //					xAxisIndex: 0,
			             //					yAxisIndex: 0,
			             z: 99,
			             itemStyle: {
			                 normal: {
			                     color: new echarts.graphic.LinearGradient(0, 1, 1, 1, [{
			                         offset: 0,
			                         color: 'rgba(51,189,216,0.8)'
			                     }, {
			                         offset: 0.5,
			                         color: 'rgba(51,189,216,0.8)'
			                     }, {
			                         offset: 0.5,
			                         color: 'rgba(51,189,216,1)'
			                     }, {
			                         offset: 1,
			                         color: 'rgba(51,189,216,1)'
			                     }]),
			                     opacity: 1,
			                 }
			             },
			             data: [320, 302, 341, 374, 390],
			         }
			     ]
			 };
			myChart.setOption(option)
		}
		function getPointer1(id) {
			var myChart = echarts.init(document.getElementById(id));
			var gauge_value=40
			
			option = {
				title: {
					show: true,
					x: "center",
					bottom: '16%',
			     	text: Math.floor(gauge_value) + '°',
					textStyle: {
						fontWeight: 'bold',
						fontSize: 44,
						color: "#eed34e"
					},
				},
			    // tooltip: {
			    //     formatter: "{a} <br/>{b} : {c}%"
			    // },
			    // grid:{
			    //     width:200,
			    //     height:95
			    // },
			    series: [
				{
	            	name: '外层数据刻度',
	            	type: "gauge",
	            	startAngle: 180,
	            	endAngle: 0,
	            	radius: "110%",
	            	center: ["50%", "75%"],
	            	axisLine: {
	            	  lineStyle: {
	            	    width: 15,
	            	    color: [
	            	      [1, new echarts.graphic.LinearGradient(0, 0, 1, 0, [
	            	        {
	            	          offset: 0.33,
	            	          color: '#08fcfe'
	            	        },
	            	        {
	            	          offset: 0.66,
	            	          color: '#e5e46e'
	            	        },
	            	        {
	            	          offset: 1,
	            	          color: '#EB3457'
	            	        }
	            	      ])]],
	            	  }
	            	},
	            	axisTick: {show: false},
	            	axisLabel: {show: false,},
	            	splitLine: {show: false},
	            	// pointer: {
	            	//   show: false,
	            	//   width: "2%",
	            	//   length: '80%',
	            	// },
	            	itemStyle: {
	            	  color: '#fff'
	            	},
	            	detail: {
			            show: false,
			            formatter: '{value}%',
			            // backgroundColor:'#fff'
			        },
	            	pointer:{
			            width:5,
			            length:'80%'
			        },
			        data: [{
			            value:gauge_value,
			            // name:'倾斜度'
			        }]
	            },
			    // {
			    //     name: '内层数据刻度',
			    //     type: 'gauge',
			    //     radius: '90%',
			    //     center: ['50%', '70%'],
			    //     startAngle: 180,
			    //     endAngle: 0,
			    //     axisLine: {
			    //         lineStyle: {
			    //             opacity:0
			    //         },
			    //     },
			    //     splitLine: {
			    //         length: 20,
			    //     },
			    //     axisLabel: {
			    //     	show:false,
			    //         distance: -80,
			    //         color:'#fff',
			    //         fontSize:24,
			    //         formatter:function(param){
			    //             if ((param % 50)==0) {
			    //                 return param
			    //             }
			    //         }
			    //     },
			    //     detail: {
			    //         show: false,
			    //         formatter: '{value}%',
			    //         // backgroundColor:'#fff'
			    //     },
			    //     itemStyle:{
			    //         normal:{
			    //             color:'cyan'
			    //         }
			    //     },
			    //     pointer:{
			    //         width:10,
			    //         length:'90%'
			    //     },
			    //     data: [{
			    //         value:gauge_value,
			    //         // name:'倾斜度'
			    //     }]
			    // },
			   
			    {
			        name: '饼图',
			        tooltip:{
			            show:false
			        },
			        type: 'pie',
			        radius: ['0%', '40%'],
			        center: ['50%', '72%'],
			        hoverAnimation:false,
			        itemStyle:{
			            normal:{
			                color:'rgba(5,21,64,0.9)'
			            },
			        
			        },
			        labelLine:{
			            normal:{
			                show:false
			            }
			        },
			        animation:false,
			        data: [1]
			    }]
			}
			myChart.setOption(option)
		}
		function getLiquidfill1(id) {
			var myChart = echarts.init(document.getElementById(id));

			var option = {
			    title: [{
			        text: ' 温度',
			        subtext: 27+'°',
			        subtextStyle: {
			            fontWeight:'bold',
			            color: '#eed34e',
			            fontSize:44
			        },
			        left: '28%',
			        top: '36%',
			        textAlign: 'left',
			        textStyle: {
			        	fontWeight:'normal',
			            color: '#fff',
			            fontSize:14
			        }
			    }, {
			        text: ' 湿度',
			        subtext: 27+'°',
			        subtextStyle: {
			            fontWeight:'bold',
			            color: '#eed34e',
			            fontSize:44
			        },
			        left: '78%',
			        top: '36%',
			        textAlign: 'left',
			        textStyle: {
			        	fontWeight:'normal',
			            color: '#fff',
			            fontSize:14
			        }
			    }],
			    series: [{
			        type: 'liquidFill',
			        data: [0.6, 0.5, 0.4, 0.3],
			        radius: '33%',
			        shape: 'roundRect',
			        outline: {
			            show: false
			        },
			        center: ['15%', '50%'],
			        shape: 'path://M 631.467 607.573 c 1.70667 -6.82667 1.70667 -13.6533 1.70667 -20.48 V 182.613 c 0 -52.9067 -42.6667 -97.28 -97.28 -97.28 c -52.9067 0 -97.28 42.6667 -97.28 97.28 v 404.48 c 0 6.82667 1.70667 13.6533 1.70667 20.48 c -56.32 32.4267 -93.8667 92.16 -93.8667 162.133 c 0 104.107 83.6267 187.733 187.733 187.733 s 187.733 -83.6267 187.733 -187.733 c 3.41333 -69.9733 -34.1333 -129.707 -90.4533 -162.133 Z',
			        backgroundStyle: {
			            borderWidth: 3,
			            borderColor: 'rgba(14,139,230,0.5)',
			            color: 'transparent'
			        },
			        label: {
			            normal: {
			                position: ['38%', '40%'],
			                formatter: function() {
			                    return '';
			                },
			                textStyle: {
			                    fontSize: 40,
			                    color: '#D94854'
			                }
			            }
			        }
			        
			    }, {
			        type: 'liquidFill',
			        data: [0.6, 0.5, 0.4, 0.3],
			        direction: 'left',
			        radius: '30%',
			        shape: 'pin',
			        center: ['65%', '50%'],
			        shape: 'path://M512 1021.952a358.4 358.4 0 0 1-358.4-358.4C153.6 465.7152 512 0 512 0s358.4 465.664 358.4 663.552a358.4 358.4 0 0 1-358.4 358.4zM318.2592 499.712c-33.4336 64.3072-57.4976 125.696-57.4976 169.1136a256 256 0 0 0 354.0992 236.544 358.5024 358.5024 0 0 1-302.8992-354.1504c0-15.616 2.2016-32.8704 6.2976-51.456z',
			        outline: {
			            show: false
			        },
			        backgroundStyle: {
			            borderWidth: 3,
			            borderColor: 'rgba(14,139,230,0.5)',
			            color: 'transparent'
			        },
			        label: {
			            normal: {
			                position: ['38%', '40%'],
			                formatter: function() {
			                    return '';
			                },
			                textStyle: {
			                    fontSize: 40,
			                    color: '#D94854'
			                }
			            }
			        }
			    },
			    {
			        name: '圈',
			        tooltip:{
			            show:false
			        },
			        type: 'pie',
			        radius: ['45%', '50%'],
			        center: ['15%', '50%'],
			        hoverAnimation:false,
			        itemStyle:{
			            normal:{
			                color:'rgba(14,139,230,0.8)'
			            },
			        
			        },
			        labelLine:{
			            normal:{
			                show:false
			            }
			        },
			        animation:false,
			        data: [1]
			    },
			    {
			        name: '圈',
			        tooltip:{
			            show:false
			        },
			        type: 'pie',
			        radius: ['45%', '50%'],
			        center: ['65%', '50%'],
			        hoverAnimation:false,
			        itemStyle:{
			            normal:{
			                color:'rgba(14,139,230,0.8)'
			            },
			        
			        },
			        labelLine:{
			            normal:{
			                show:false
			            }
			        },
			        animation:false,
			        data: [1]
			    }
			    ]
			};
			myChart.setOption(option)
		}
	
	</script>
</body>
</html>