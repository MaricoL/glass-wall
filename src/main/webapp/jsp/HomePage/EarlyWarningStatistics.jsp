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
    <link href="${pageContext.request.contextPath}/HomeAssets/css/p3.css" rel="stylesheet" type="text/css" />

	
</head>
<body>
<div class="container">
		<div class="main clearfix">
			<div class="leftPart_p3">
				<div class="block">
					<h2>预警处理统计</h2>
					<div class="block_chart_p3_1">
						<div class="p3_1_div">
								<div>已解决预警数量</div>
								<div class="p3_1_word1">351<span>件</span></div>
						</div>
						<div class="p3_1_div">
							<div>预警总量</div>
							<div class="p3_1_word2">432<span>件</span></div>
						</div>
						<div class="p3_1_div" id="getChart_p3_1"></div>
					</div>
				</div>
				<div class="block">
					<h2>预警实时统计</h2>
					<div id="getChart_p3_2"></div>
				</div>
			</div>
			<div class="rightPart_p3">
				<div class="block">
					<h2>预警类型统计</h2>
					<div id="getChart_p3_3"></div>
				</div>
				<div class="block">
					<h2>预警实时数据列表</h2>
					<div class="tablebox">
				        <table id="tableId" border="0" cellspacing="0" cellpadding="0">
				            <thead>
				                <tr>
				                    <th>预警信息</th>
									<th>预警类型</th>
									<th>预警时间</th>
									<th>预警处理人员</th>
									<th>预警处理状态</th>
				                </tr>
				            </thead>
				            <tbody>
				                <tr>
				                   <td>应力超出预警阔值，请及时处理1111122222222222333333322212121212111</td>
								   <td>应力</td>
								   <td>2019-01-01</td>
								   <td>王少波</td>
								   <td><span class="p3_table_finished">已完成</span></td>
				                </tr>
				                <tr>
				                   <td>应力超出预警阔值，请及时处理</td>
								   <td>应力</td>
								   <td>2019-01-01</td>
								   <td>王少波</td>
								   <td><span class="p3_table_untreated">未处理</span></td>
				                </tr>
				            </tbody>
				        </table>
				     </div>
				</div>
			</div>
	</div>
	<script src="${pageContext.request.contextPath}/HomeAssets/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/HomeAssets/plugins/echarts/echarts.js"></script>
	<script src="${pageContext.request.contextPath}/HomeAssets/js/menu.js"></script>
	
	
	<script type="text/javascript">
	// 参数1 tableID,参数2 div高度，参数3 速度，参数4 tbody中tr几条以上滚动
	tableScroll('tableId', 500, 30, 13)
	var MyMarhq;
	function tableScroll(tableid, hei, speed, len) {
	    clearTimeout(MyMarhq);
	    $('#' + tableid).parent().find('.tableid_').remove()
	    $('#' + tableid).parent().prepend(
	        '<table class="tableid_"><thead>' + $('#' + tableid + ' thead').html() + '</thead></table>'
	        ).css({
	            'position': 'relative',
	            'overflow': 'hidden',
	            'height': hei + 'px'
	        })
	        $(".tableid_").find('th').each(function(i) {
	            $(this).css('width', $('#' + tableid).find('th:eq(' + i + ')').width());
	        });
	        $(".tableid_").css({
	            'position': 'absolute',
	            'top': 0,
	            'left': 0,
	            'z-index': 9
	        })
	        $('#' + tableid).css({
	            'position': 'absolute',
	            'top': 0,
	            'left': 0,
	            'z-index': 1
	        })
        if ($('#' + tableid).find('tbody tr').length > len) {
            $('#' + tableid).find('tbody').html($('#' + tableid).find('tbody').html() + $('#' + tableid).find('tbody').html());
            $(".tableid_").css('top', 0);
            $('#' + tableid).css('top', 0);
            var tblTop = 0;
            var outerHeight = $('#' + tableid).find('tbody').find("tr").outerHeight();

            function Marqueehq() {
                if (tblTop <= -outerHeight * $('#' + tableid).find('tbody').find("tr").length) {
                    tblTop = 0;
                } else {
                    tblTop -= 1;
                }
                $('#' + tableid).css('margin-top', tblTop + 'px');
                clearTimeout(MyMarhq);
                MyMarhq = setTimeout(function() {
                    Marqueehq()
                }, speed);
            }

            MyMarhq = setTimeout(Marqueehq, speed);
            $('#' + tableid).find('tbody').hover(function() {
                clearTimeout(MyMarhq);
            }, function() {
                clearTimeout(MyMarhq);
                if ($('#' + tableid).find('tbody tr').length > len) {
                    MyMarhq = setTimeout(Marqueehq, speed);
                }
            })
        }
    }

		$(function() {
			getChart_p3_1()
			getChart_p3_2()
			getChart_p3_3()
		})
		function getChart_p3_1(){
	   		var myChart = echarts.init(document.getElementById('getChart_p3_1'));
			var option = {
			    series: [{
			        name: '第一个圆环',
			        type: 'pie',
			        clockWise: false,
			        radius: [65, 80],
			        itemStyle:  {
					    normal: {
					        label: {
					            show: false
					        },
					        labelLine: {
					            show: false
					        },
					        shadowBlur: 0,
					        shadowColor: '#203665'
					    }
					},
			        hoverAnimation: false,
			        center: ['50%', '50%'],
			        data: [{
			            value: 83,
			            label: {
			                normal: {
			                    rich: {
			                        a: {
			                            color: '#fff',
			                            align: 'center',
			                            fontSize: 40,
			                            fontWeight: "bold"
			                        }
			                    },
			                    formatter: function(params){
			                        return "{a|"+params.value+"%}";
			                    },
			                    position: 'center',
			                    show: true,
			                    textStyle: {
			                        fontSize: '14',
			                        fontWeight: 'normal',
			                        color: '#fff'
			                    }
			                }
			            },
			           itemStyle: {
				                normal: {
				                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{


				                     // 0% 处的颜色   
				                    offset: 0, color: '#f17527'  },
				                   {
				                    
				                    // 100% 处的颜色
				                   offset: 1, color: '#eed34e' 
				                  }], false)
				                }
				            },
			        }, {
			            value: 17,
			            name: 'invisible',
			            itemStyle: {
			                normal: {
			                    color: '#009eea'
			                },
			                emphasis: {
			                    color: '#009eea'
			                }
			            }
			        }]
			    }]
			};
			myChart.setOption(option)
		}
		function getChart_p3_2(){
	   		var myChart = echarts.init(document.getElementById('getChart_p3_2'));
	   		var option ={
				grid: {
			        left: '5%',
		            right: '10%',
		            top:'10%',
			        bottom: '15%',
			        containLabel: true
				},
				tooltip : {
					show: true,
					trigger: 'item'
				},
				xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            axisLabel:{
			            	color: '#30eee9',
			            	textStyle:{
								color:'rgba(255,255,255,1)'
							}
			            },
			            axisLine:{
		               		show:true,
		               		lineStyle:{
				            	color:'rgba(255,255,255,.6)'
				            }
						},
						axisTick:{
			            	show:false,
			            },  
			            splitLine:{
			            	show:true,
				            lineStyle:{
				            	color:'#a5a8a1'
				            }
				        },
			            data : ['6:00','10:00','14:00','18:00','22:00']
			        }
			    ],
			    yAxis : [
					{
						type : 'value',
						name : '信息量',
						min:0,
						max:35000,
						axisLabel : {
							formatter: '{value}',
							textStyle:{
								color:'rgba(255,255,255,.6)'
							}
						},
						axisLine:{
							lineStyle:{
								color:'rgba(255,255,255,.6)'
							}
						},
						axisTick:{
			            	show:false,
			            },
						splitLine:{
							show:true,
							lineStyle:{
								color:'#11366e'
							}
						}
					},
				],
				series : [
					
					{
						name:'已发布',
						type:'line',
						stack: '总量',
						symbol:'circle',
						symbolSize: 18,
						
			            itemStyle: {
					        normal: {
					            color:'#dac351',			            
					            lineStyle: {
									color: "#dac351",
									width:3
					            },
					            areaStyle: { 
									//color: '#94C9EC'
									color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [{
										offset: 0,
										color: 'rgba(222,201,86,.2)'
									}, {
										offset: 1,
										color: 'rgba(222,201,86,1)'
									}]),
					            }
					        }
						},
						data:[22000, 18200, 19100, 23400, 29000]
					},
				]
			};
			myChart.setOption(option)
	   	}
	   	function getChart_p3_3(){
	   		var myChart = echarts.init(document.getElementById('getChart_p3_3'));
	   		var xAxisData = ['应力', '应变','振动', '风压','倾斜角', '温度','湿度'];
			var data = [500,100,500,800,400,684,249];
	   		var option = {
			    xAxis: {
			        data: xAxisData,
			        axisLabel: {
			            textStyle: {
			                color: '#fff'
			            }
			        },
			        splitLine: {
			            show: false
			        }
			    },
			    yAxis: {
			        splitLine: {
						show: true,
						lineStyle: {
							color: ['#fff'],
							opacity:0.1
						}
					},
			        axisLine: {
			            show: false,
			            lineStyle: {
			                   color:'rgba(255,255,255,.6)'
			                }
			        }
			    },
			    series: [{
			        type: 'bar',
			        data: data,
			        barWidth: 40,
			        label: {
			            normal: {
			               show: true,
			               position: 'top',
			               textStyle: {
			                   color: '#a8aab0',
			                   fontStyle: 'normal',
			                   fontFamily: '微软雅黑',
			                   fontSize: 12,   
			               },
			            },
			        },
			        itemStyle: {
			                normal: {
			                    barBorderRadius: [30, 30, 0, 0],
			                    color: new echarts.graphic.LinearGradient(
			                        0, 0, 0, 1, [{
			                                offset: 0,
			                                color: '#00feff'
			                            },
			                            {
			                                offset: 0.5,
			                                color: '#027eff'
			                            },
			                            {
			                                offset: 1,
			                                color: '#0286ff'
			                            }
			                        ]
			                    )
			                }
			            },
			    }]
			};
			myChart.setOption(option)
	   	}
	</script>
</body>
</html>