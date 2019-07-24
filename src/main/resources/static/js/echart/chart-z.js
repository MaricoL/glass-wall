var myChart = echarts.init(document.getElementById('main'));
var dataAxis = ['上海市', '北京市', '合肥市', '南京市', '成都', '重庆市', '深圳市', '天津市'];
var data = [220, 182, 191, 234, 290, 330, 310, 123];
var yMax = 500;
var dataShadow = [];

for (var i = 0; i < data.length; i++) {
	dataShadow.push(yMax);
}

option = {
	title: {
		text: ' ',
		subtext: ' '
	},
	xAxis: {
		data: dataAxis,
		axisLabel: {
			inside: true,
			show: false,
			textStyle: {
				color: '#fff'
			}
		},
		axisTick: {
			show: false
		},
		axisLine: {
			show: false
		},
		z: 10
	},
	yAxis: {
		axisLine: {
			show: false
		},
		axisTick: {
			show: false
		},
		axisLabel: {
			textStyle: {
				color: '#d8b173'
			}
		}
	},
	dataZoom: [{
		type: 'inside'
	}],
	series: [{ // For shadow
		type: 'bar',
		itemStyle: {
			normal: {
				color: 'rgba(0,0,0,0.05)'
			}
		},
		barGap: '-100%',
		barCategoryGap: '40%',
		data: dataShadow,
		animation: false
	}, {
		type: 'bar',
		itemStyle: {
			normal: {
				color: new echarts.graphic.LinearGradient(
					0, 0, 0, 1, [{
						offset: 0,
						color: '#ffdda7'
					}, {
						offset: 0.5,
						color: '#d8b173'
					}, {
						offset: 1,
						color: '#9f7533'
					}]
				)
			},
			emphasis: {
				color: new echarts.graphic.LinearGradient(
					0, 0, 0, 1, [{
						offset: 0,
						color: '#9f7533'
					}, {
						offset: 0.7,
						color: '#9f7533'
					}, {
						offset: 1,
						color: '#9f7533'
					}]
				)
			}
		},
		data: data
	}]
};

// Enable data zoom when user click bar.
var zoomSize = 6;
myChart.on('click', function(params) {
	console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
	myChart.dispatchAction({
		type: 'dataZoom',
		startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
		endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
	});
});
myChart.setOption(option);
window.onresize = myChart.resize;



///
var myChart_1 = echarts.init(document.getElementById('main_1'));
option = {

    title : {
    	show: false,

        text: '',

        subtext: ''

    },

    tooltip : {

        trigger: 'axis'

    },

    legend: {

        data:['意向','预购','成交']

    },

    toolbox: {

        show : true,

        feature : {

            mark : {show: true},

            dataView : {show: true, readOnly: false},

            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},

            restore : {show: true},

            saveAsImage : {show: true}

        }

    },

    calculable : true,

    xAxis : [

        {

            type : 'category',

            boundaryGap : false,

            data : ['周一','周二','周三','周四','周五','周六','周日']

        }

    ],

    yAxis : [

        {

            type : 'value'

        }

    ],

    series : [

        {

            name:'成交',

            type:'line',

            smooth:true,

            itemStyle: {normal: {areaStyle: {type: 'default'}}},

            data:[10, 12, 21, 54, 260, 830, 710]

        },

        {

            name:'预购',

            type:'line',

            smooth:true,

            itemStyle: {normal: {areaStyle: {type: 'default'}}},

            data:[30, 182, 434, 791, 390, 30, 10]

        },

        {

            name:'意向',

            type:'line',

            smooth:true,

            itemStyle: {normal: {areaStyle: {type: 'default'}}},

            data:[1320, 1132, 601, 234, 120, 90, 20]

        }

    ]

};
myChart_1.setOption(option);
window.onresize = myChart_1.resize;