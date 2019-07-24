
function InitData()
{
	var income=[];//收入
	var profit=[];//利润
	var fourrate=[];//四率
	var capital=[];//资金
	var accounting=[];//核算
	var audit=[];//稽核
	var tax=[];//税务
	//var compare=[];//外部对比

	console.log(2222)
	data1=[{"an":"","depart_id":"1","indexname":"收入本年累计","indextype":"A00074","indexvalue":"757.3521","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"1","indexname":"收入本年预算","indextype":"A00135","indexvalue":"778.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"1","indexname":"境外收入占比","indextype":"A00232","indexvalue":"3.4707","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"2","indexname":"利润本年累计","indextype":"A00075","indexvalue":"64.7691","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"2","indexname":"利润本年预算","indextype":"A00138","indexvalue":"62.7997","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"5.93","depart_id":"3","indexname":"四率-资产周转率","indextype":"A00066","indexvalue":"21.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"3","indexname":"四率-收入","indextype":"A00063","indexvalue":"1083.9500","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"3","indexname":"四率-平均总资产","indextype":"A00070_avg","indexvalue":"4174.5000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"23.99","depart_id":"3","indexname":"四率-资产负债率","indextype":"A00067","indexvalue":"60.4700","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"3","indexname":"四率-总负债","indextype":"A00072","indexvalue":"2908.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"3","indexname":"四率-总资产","indextype":"A00070","indexvalue":"4809.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"3","indexname":"四率-EBITDA利润率","indextype":"A00541","indexvalue":"7.1800","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201807"},{"an":"","depart_id":"3","indexname":"四率-EBITDA","indextype":"A00540","indexvalue":"65.8800","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201807"},{"an":"","depart_id":"3","indexname":"四率-资产利润率","indextype":"A00068","indexvalue":"","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"3","indexname":"四率-净利润","indextype":"A00065","indexvalue":"68.7500","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"3","indexname":"四率-平均资本金","indextype":"A00073_avg","indexvalue":"","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"1.63","depart_id":"3","indexname":"四率-净资产收益率","indextype":"A00069","indexvalue":"3.5100","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"3","indexname":"四率-平均净资产","indextype":"A00071_avg","indexvalue":"2137.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201809"},{"an":"","depart_id":"4","indexname":"资金-现金流入(执行)","indextype":"A00082_e","indexvalue":"222.6218","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-现金流出(执行)","indextype":"A00083_e","indexvalue":"227.8248","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-现金净流入(执行)","indextype":"A00084_e","indexvalue":"-5.2030","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-经营性现金流入(执行)","indextype":"A00085_e","indexvalue":"72.9891","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-经营性现金流出(执行)","indextype":"A00086_e","indexvalue":"68.2882","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-经营性现金净流入(执行)","indextype":"A00087_e","indexvalue":"4.7009","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-当月融资任务-筹资支出(执行)","indextype":"A00083_financing","indexvalue":"150.2225","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-当月融资任务-投资支出(执行)","indextype":"A00083_investment","indexvalue":"9.3141","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-现金流入(计划)","indextype":"A00082_p","indexvalue":"188.4879","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-现金流出(计划)","indextype":"A00083_p","indexvalue":"221.9972","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-现金净流入(计划)","indextype":"A00084_p","indexvalue":"-33.5093","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-现金流入(周计划)","indextype":"A00085_p","indexvalue":"496664.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201752"},{"an":"","depart_id":"4","indexname":"资金-现金流出(周计划)","indextype":"A00086_p","indexvalue":"700085.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201752"},{"an":"","depart_id":"4","indexname":"资金-现金净流入(周计划)","indextype":"A00087_p","indexvalue":"-203421.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201752"},{"an":"","depart_id":"4","indexname":"资金-周融资任务-筹资支出(计划)","indextype":"A00085_financing","indexvalue":"310580.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201752"},{"an":"","depart_id":"4","indexname":"资金-周融资任务-投资支出(计划)","indextype":"A00085_investment","indexvalue":"0.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201752"},{"an":"","depart_id":"4","indexname":"资金-经营性现金流入(周执行)","indextype":"A00089_p","indexvalue":"186084.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201752"},{"an":"","depart_id":"4","indexname":"资金-经营性现金流出(周执行)","indextype":"A00090_p","indexvalue":"202034.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201752"},{"an":"","depart_id":"4","indexname":"资金-经营性现金净流入(周执行)","indextype":"A00091_p","indexvalue":"-15950.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201752"},{"an":"","depart_id":"4","indexname":"资金-累计融资下账","indextype":"A00190","indexvalue":"1112.8559","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-累计融资任务","indextype":"A00191","indexvalue":"1311.5531","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-综合融资下账成本","indextype":"A00192","indexvalue":"6.7078","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-境外负债占比","indextype":"A00257","indexvalue":"14.2900","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-存量负债成本","indextype":"A00258","indexvalue":"6.9700","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-债券融资","indextype":"A00281","indexvalue":"19.1541","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-股权盘活融资","indextype":"A00282","indexvalue":"392.8762","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-权益性融资","indextype":"A00283","indexvalue":"101.9716","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-融资支出","indextype":"A00284","indexvalue":"824.6071","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-投资支出","indextype":"A00285","indexvalue":"486.9426","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-筹资任务完成情况","indextype":"A00286","indexvalue":"84.8502","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-存量负债总额","indextype":"A00259","indexvalue":"1717.8000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"4","indexname":"资金-长期负债占比","indextype":"A00260","indexvalue":"70.8724","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航实业","updatetime":"201712"},{"an":"","depart_id":"5","indexname":"核算-资产总额","indextype":"A00056","indexvalue":"3690.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201803"},{"an":"","depart_id":"5","indexname":"核算-境外资产总额","indextype":"A00229","indexvalue":"506.1200","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201803"},{"an":"","depart_id":"5","indexname":"核算-境外资产占比","indextype":"A00230","indexvalue":"13.7160","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201803"},{"an":"","depart_id":"6","indexname":"税务-年度节税任务完成情况","indextype":"A00204","indexvalue":"0.9272","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201810"},{"an":"","depart_id":"6","indexname":"税务-年度累计节税","indextype":"A00202","indexvalue":"223688.3782","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201810"},{"an":"","depart_id":"6","indexname":"税务-年度累计实缴","indextype":"A00198","indexvalue":"312589.3302","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201810"},{"an":"","depart_id":"7","indexname":"稽核与人事-财务专业资质合格率","indextype":"A00320","indexvalue":"40.0000","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201810"},{"an":"","depart_id":"7","indexname":"稽核与人事-稽核进度","indextype":"A00312","indexvalue":"45.4545","mom":"","org":"d4985136e97d11e7968906a2160000ae","orgName":"海航物流","updatetime":"201812"}];
	console.log(333)
	console.log(data1)
	if(data1!=""){

		$.each(data1,function(index,item){
			var dep=item.depart_id;//类别
			if(dep==1) income.push(item);
			else if(dep==2) profit.push(item);
			else if(dep==3) fourrate.push(item);
			else if(dep==4) capital.push(item);
			else if(dep==5) accounting.push(item);
			else if(dep==6) tax.push(item);
			else if(dep==7) audit.push(item);
			//else if(dep==8) compare.push(item);
			
		})
		fn_income(income);
		fn_profit(profit);
		fn_fourrate(fourrate);
		fn_capital(capital);
		fn_accounting(accounting);
		fn_audit(audit);
		fn_tax(tax);
		//首页头寸数据查询加载
		tcDataSet();
	}

	//外部对标
	$.ajax({
		url : basePath+"/finance/getOutCompareData",
		type : "POST",
		success : function(data1) {
			if(data1!=""){
				var data=JSON.parse(data1)
				createOutCompare(data);
			}
		}
	});
} 

//处理时间
function dealDate(date)
{
	return date.substring(0,4)+"年"+Number(date.substring(4))+"月"
}

//处理时间
function dealDateForWeek(date)
{
	return date.substring(0,4)+"年第"+Number(date.substring(4))+"周"
}

//收入
function fn_income(data)
{
	var date="";
	var finalprecet=[0,0]//预算达成率
	$.each(data,function(index,item){
		var indextype=item.indextype;
		date=item.updatetime;
		if(indextype=="A00074"){
			if(item.indexvalue!=""){
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
				finalprecet[0]=item.indexvalue;
			}else
				item.indexvalue="-"
			$("#A00074").text(parseFloat(item.indexvalue).toFixed(2));//本年累计
		}
		else if(indextype=="A00135"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
				finalprecet[1]=item.indexvalue;
			}else
				item.indexvalue="-"
			$("#A00135").text(parseFloat(item.indexvalue).toFixed(2));//本年累计
			
			
		}else if(indextype=="A00232"){
			var A00232=item.indexvalue/100;
			if(showoutIncome && showoutIncome== "true")
			{
				$("#outsideIncome").show();
				var color3='#ffb53c'
				var opt = node_circle({
					element:document.querySelector('.circle-1'),
					percent: parseFloat(A00232).toFixed(4),
					width: 106,
					duration:2e2,
					color:color3 ,
					text:function(v){
						v = A00232>100?v*A00232/100:v;
						var a = (v).toFixed(2).split('.');
						var p1 = '<span class="fs44" style="color:'+color3+';">'+(a[0]!=undefined ? a[0] : '')+'</span>';
						var p2 = '<span class="fs16" style="color:'+color3+';">'+(a[1]!=undefined ? '.'+a[1] : '.0')+'%</span>';
						return p1+p2
					},
				})
			}else{
				$("#outsideIncome").hide();
			}
				
			
		}
	})
	if(finalprecet[1]!=0){//预算达成率
		$("#incomeprecent").text( parseFloat(100*finalprecet[0]/finalprecet[1]).toFixed(2) );
		$("#incomeprecentprogress").css("width", (100<=parseFloat(100*finalprecet[0]/finalprecet[1]).toFixed(2) ? 100:parseFloat(100*finalprecet[0]/finalprecet[1]).toFixed(2))+"%");
	}else{
		$("#incomeprecent").text(0);
	}
	if(date!="")
		$("#income_date").text( dealDate(date))
}


//利润
function fn_profit(data)
{
	var date="";
	$.each(data,function(index,item){
		var indextype=item.indextype;
		date=item.updatetime;
		if(indextype=="A00075"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00075").text(parseFloat(item.indexvalue).toFixed(2));//本年累计
		}
		else if(indextype=="A00138"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00138").text(parseFloat(item.indexvalue).toFixed(2));//本年累计
		}
	})
	if(date!="")
		$("#profit_date").text(dealDate(date) )
	
	$.ajax({
		url : basePath+"/finance/getHomeProfitEchartData",
		type : "POST",
		data:{"date":date},
		success:function(data1){
	   data1='{"datavalue":[["51.9323","54.7718","64.7691"],["62.9613","62.9491","62.7997"],["82.48289028","87.00966336","103.13600224"]],"datax":[10,11,12],"legend_title":["当年累计","当年预算","预算达成率"]}';
				var data=JSON.parse(data1)
				
				createprofitechart(data,'profitechart')

		}
	});
}


function createprofitechart(data, profitechart) {
	console.log(document.getElementById(profitechart));
	var bar = echarts.init(document.getElementById(profitechart));
	var option = {
		title: {
			text: '',
			textStyle: {
				align: 'center'
			},
			left: 'left'
		},
		color: ['#f56666', '#308dce', '#f4fefe', '#cdcdcd', '#eec7d4'],
		tooltip: {
			trigger: 'axis',
		},
		grid: {
			top: 80
		},
		legend: {
			bottom: 0,
			data: data.legend_title.map(function(d) {
				if(d === "当年累计" || d === "当年预算")
					return {name:d,icon:"circle"}
				else
					return d
			}),
			textStyle: {
				color: '#ffffff'
			},
			itemGap: 50,
		},
		xAxis: [{
			type: 'category',
			data: data.datax,
			axisPointer: {
				type: 'shadow'
			},
			axisLine: {
				lineStyle: {
					color: '#ffffff'
				}
			}
		}],
		yAxis: [{
			type: 'value',
			name: '亿元',
			axisLine: {
				lineStyle: {
					color: '#ffffff'
				}
			},
			splitLine: {
				show: false
			}
		},
		{
			type: 'value',
			name: '%',
			axisLine: {
				lineStyle: {
					color: '#ffffff'
				}
			},
			axisLabel:{
				show:false
			},
			splitLine: {
				show: false
			}
		}]
	};

	var series = [];
	for (var i = 0; i < data.datavalue.length; i++) {
		var obj = new Object();
		obj.name = data.legend_title[i];
		if (i == 2) {
			obj.yAxisIndex = 1;
			obj.type = 'line';
			obj.markLine = {
					symbol:'',
						lineStyle:{
							type:'solid'
						},
	                    data : [{
	                        name: '',
	                        yAxis: 100,
	                        
	                    }]
	                } ; 
			
		} else obj.type = 'bar'

		data.datavalue[i].forEach(function(arra, index, array) {
			array[index] = dealvalue(arra, 2)　
		});
		obj.data = data.datavalue[i];
		series.push(obj);
	}
	
	option.series = series;
	bar.setOption(option, true);
	window.onresize = bar.resize;
}


function dealvalue(a,num)
{
	if(!a || a=="")
		return a;
	
	return parseFloat(a).toFixed(num)
}


//四率
function fn_fourrate(data)
{
	var date="";
	$.each(data,function(index,item){
		date=item.updatetime;
		var indextype=item.indextype;
		var an=item.an;
		if(indextype=="A00066"){
			var color = '#fa6d66'
			var opt = wave_circle({
				wave:true,
				element:document.querySelector('#AssetTurnoverRateDiv'),
				percent:parseFloat(item.indexvalue)/100,
				width: 120,
				color:color ,
				text:function(v){
					v = item.indexvalue>100?v*item.indexvalue/100:v;
					var a = (v).toFixed(2).split('.');
					var p1 = '<span class="fs44" style="color:'+color+';">'+(a[0]!=undefined ? a[0] : '')+'</span>';
					var p2 = '<span class="fs16" style="color:'+color+';">'+(a[1]!=undefined ? '.'+a[1] : '.0')+'%</span>';
					return p1+p2
				},
			})
			
			//$("#A00066").text(item.indexvalue);//资本周转率
			if(an && an!=""){
				$("#A00066_an").text( parseFloat(an).toFixed(2) );//同比
				if(an>=0)
					$("#A00066_an_parent").addClass("increase");
				else
					$("#A00066_an_parent").removeClass("increase");
			}
			if(date!=""){
				$("#zjzzl_date").text(dealDate(date))
			}
		}else if(indextype=="A00063"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00063").text(item.indexvalue);//营业收入
			$("#A00063_1").text(item.indexvalue);//营业收入
		}else if(indextype=="A00070_avg"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00070_avg").text(item.indexvalue);//
		}else if(indextype=="A00067"){
				var color = '#ff5c39'
				var opt = wave_circle({
					wave:true,
					element:document.querySelector('#AssetLiabilityRateDiv'),
					percent:parseFloat(item.indexvalue)/100,
					width: 120,
					color:color ,
					text:function(v){
						v = item.indexvalue>100?v*item.indexvalue/100:v;
						var a = (v).toFixed(2).split('.');
						var p1 = '<span class="fs44" style="color:'+color+';">'+(a[0]!=undefined ? a[0] : '')+'</span>';
						var p2 = '<span class="fs16" style="color:'+color+';">'+(a[1]!=undefined ? '.'+a[1] : '.0')+'%</span>';
						return p1+p2
					},
				})
				if(an && an!=""){
					$("#A00067_an").text(parseFloat(an).toFixed(2) );//同比
					if(an<0)
						$("#A00067_an_parent").addClass("increase");
					else
						$("#A00067_an_parent").removeClass("increase");
				}	
				if(date!=""){
					$("#zcfzl_date").text(dealDate(date))
				}	
		}else if(indextype=="A00072"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00072").text(item.indexvalue);//总负债
		}else if(indextype=="A00070"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00070").text(item.indexvalue);//总资产
		}else if(indextype=="A00541"){
				var color = '#fe7100'
				var opt = wave_circle({
					wave:true,
					element:document.querySelector('#AssetProfitRateDiv'),
					percent:parseFloat(item.indexvalue)/100,
					width: 120,
					color:color ,
					text:function(v){
						v = item.indexvalue>100?v*item.indexvalue/100:v;
						var a = (v).toFixed(2).split('.');
						var p1 = '<span class="fs44" style="color:'+color+';">'+(a[0]!=undefined ? a[0] : '')+'</span>';
						var p2 = '<span class="fs16" style="color:'+color+';">'+(a[1]!=undefined ? '.'+a[1] : '.0')+'%</span>';
						return p1+p2
					},
				})
				//资产利润率
			if(an && an!=""){
				$("#A00541_an").text(parseFloat(an).toFixed(2) );//同比
				if(an>=0)
					$("#A00541_an_parent").addClass("increase");
				else
					$("#A00541_an_parent").removeClass("increase");
			}
			if(date!=""){
				$("#zblrl_date").text(dealDate(date))
			}
		}else if(indextype=="A00540"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00540").text(item.indexvalue);//EBITDA
		}else if(indextype=="A00069"){
				var color = '#faac12'
				var opt = wave_circle({
					wave:true,
					element:document.querySelector('#AssetReturnRateDiv'),
					percent:parseFloat(item.indexvalue)/100,
					width: 120,
					color:color ,
					text:function(v){
						v = item.indexvalue>100?v*item.indexvalue/100:v;
						var a = (v).toFixed(2).split('.');
						var p1 = '<span class="fs44" style="color:'+color+';">'+(a[0]!=undefined ? a[0] : '')+'</span>';
						var p2 = '<span class="fs16" style="color:'+color+';">'+(a[1]!=undefined ? '.'+a[1] : '.0')+'%</span>';
						return p1+p2
					},
				})//净资产收益率
			if(an && an!=""){
				$("#A00069_an").text(parseFloat(an).toFixed(2) );//同比
				if(an>=0)
					$("#A00069_an_parent").addClass("increase");
				else
					$("#A00069_an_parent").removeClass("increase");
			}	
			if(date!=""){
				$("#jzcsyl_date").text(dealDate(date))
			}
		}else if(indextype=="A00065"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00065").text(item.indexvalue);//
		}else if(indextype=="A00071_avg"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			$("#A00071_avg").text(item.indexvalue);//
		}
		
	})
	if(date!=""){
		$("#fourrate_date").text(dealDate(date))
	}
	
}

//资金
function fn_capital(data)
{
	var date="";
	
	var a00258_value;
	var a00259_value;
	$.each(data,function(index,item){
		var indextype=item.indextype;
		if(indextype=="A00084_e"){
			date=item.updatetime;
			//$("#A00084_e").text(ne(parseFloat(item.indexvalue).toFixed(2)));//现金净流量
		}else if(indextype=="A00286"){
			//$("#A00190-i").text(ne(parseFloat(item.indexvalue).toFixed(2)));//融资任务完成情况
		}else if(indextype=="A00085_p"){
			$("#A00085_p").text(ne((parseFloat(item.indexvalue)/10000).toFixed(2)));//现金流入
			$("#cfeDate").text(dealDateForWeek(item.updatetime)+"资金平衡计划");//现金流执行-时间
		}else if(indextype=="A00086_p"){
			$("#A00086_p").text(ne((parseFloat(item.indexvalue)/10000).toFixed(2)));//现金流出
		}else if(indextype=="A00087_p"){
			$("#A00087_p").text(ne((parseFloat(item.indexvalue)/10000).toFixed(2)));//现金流出
		}else if(indextype=="A00085_financing"){
			$("#A00085_financing").text(ne((parseFloat(item.indexvalue)/10000).toFixed(2)));//当月筹资性支出
		}else if(indextype=="A00085_investment"){
			$("#A00085_investment").text(ne((parseFloat(item.indexvalue)/10000).toFixed(2)));//当月投资性支出
		}else if(indextype=="A00082_p"){
			$("#A00082_p").text(ne(parseFloat(item.indexvalue).toFixed(2)));//计划现金流入
			$("#cfpDate").text(dealDate(item.updatetime)+"资金平衡计划");//现金流计划-时间
		}else if(indextype=="A00083_p"){
			$("#A00083_p").text(ne(parseFloat(item.indexvalue).toFixed(2)));//计划现金流出
		}else if(indextype=="A00084_p"){
			$("#A00084_p").text(ne(parseFloat(item.indexvalue).toFixed(2)));//计划现金净流量
		}else if(indextype=="A00190"){
			$("#A00190").text(ne(parseFloat(item.indexvalue).toFixed(2)));//累计筹资下账
			//$("#A00190-i").text(ne(parseFloat(item.indexvalue).toFixed(2)));//融资任务完成情况
			$("#rzDate").text(dealDate(item.updatetime));//筹资下账时间
		}else if(indextype=="A00281"){
			$("#A00281").text(ne(parseFloat(item.indexvalue).toFixed(2)));//债券融资
		}else if(indextype=="A00282"){
			$("#A00282").text(ne(parseFloat(item.indexvalue).toFixed(2)));//股权盘活融资
		}else if(indextype=="A00283"){
			$("#A00283").text(ne(parseFloat(item.indexvalue).toFixed(2)));//权益性融资
		}else if(indextype=="A00192"){
			$("#A00192").text(ne(parseFloat(item.indexvalue).toFixed(2)));//综合融资下账成本
		}else if(indextype=="A00258" || indextype=="A00259"){
			if(indextype=="A00258")
				a00258_value = ne(parseFloat(item.indexvalue).toFixed(4));
			if(indextype=="A00259"){
				$("#A00259").text(ne(parseFloat(item.indexvalue).toFixed(2)));//存量负债总额度
				a00259_value = ne(parseFloat(item.indexvalue).toFixed(4));	
			}
			
			if(a00259_value &&
					a00259_value != 0 &&
					a00258_value)
				$("#A00258").text(parseFloat(a00258_value/a00259_value).toFixed(2));//存量负债成本
		}else if(indextype=="A00191"){
			$("#A00191").text(ne(parseFloat(item.indexvalue).toFixed(2)));//累计筹资任务
		}else if(indextype=="A00284"){
			$("#A00284").text(ne(parseFloat(item.indexvalue).toFixed(2)));//融资支出
		}else if(indextype=="A00285"){
			$("#A00285").text(ne(parseFloat(item.indexvalue).toFixed(2)));//投资支出
		}else if(indextype=="A00257"){
			$("#A00257").text(ne(parseFloat(item.indexvalue).toFixed(2)));//境外负债占比
		}else if(indextype=="A00085_e"){
			var dateExecute = item.updatetime;
			var dateExecuteMonthYear = dateExecute.substring(0,4);
			var datedateExecuteMonth = dateExecute.substring(5,dateExecute.length);		
			$("#A00011_m").text(ne(parseFloat(item.indexvalue).toFixed(2)));//经营性现金流月执行流入金额
			$("#executeMonthDate").text(dateExecuteMonthYear+'年'+datedateExecuteMonth+'月'+'经营性现金流月执行');//经营性现金流月执行流入金额时间
		}else if(indextype=="A00086_e"){
			$("#A00012_m").text(ne(parseFloat(item.indexvalue).toFixed(2)));//经营性现金流月执行流出金额
		}else if(indextype=="A00087_e"){
			$("#A00013_m").text(ne(parseFloat(item.indexvalue).toFixed(2)));//经营性现金流月执行净流入金额
		}else if(indextype=="A00089_p"){
			var dateExecute = item.updatetime;
			var dateExecuteMonthYear = dateExecute.substring(0,4);
			var datedateExecuteMonth = dateExecute.substring(5,dateExecute.length);	
			$("#A00014_w").text(ne(parseFloat(item.indexvalue).toFixed(2))/10000);//经营性现金流周执行流入金额
			$("#executeWeekDate").text(dateExecuteMonthYear+'年第'+datedateExecuteMonth+'周'+'经营性现金流周执行');//经营性现金流周执行流入金额时间
		}else if(indextype=="A00090_p"){
			$("#A00015_w").text(ne(parseFloat(item.indexvalue).toFixed(2))/10000);//经营性现金流周执行流出金额
		}else if(indextype=="A00091_p"){
			$("#A00016_w").text(ne(parseFloat(item.indexvalue).toFixed(2))/10000);//经营性现金流周执行净流入金额
		}else if(indextype=="A00260"){
			$("#A00260").text(ne(parseFloat(item.indexvalue).toFixed(2)));//长期负债占比
		}
	})
	
	
	if(date!="")
		$("#capital_date").text(dealDate(date));
		$("#f1_date").text(dealDate(date));
		$("#f2_date").text(dealDate(date));
}

//核算
function fn_accounting(data)
{
	var date="";var all="";var out="";
	$.each(data,function(index,item){
		var indextype=item.indextype;
		date=item.updatetime;
		
		if(indextype=="A00056"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			all=item.indexvalue;
			$("#A00056").text(all);//资产总额
		}else if(indextype=="A00229"){
			if(item.indexvalue!="")
			{
				item.indexvalue=parseFloat(item.indexvalue).toFixed(2);
			}else
				item.indexvalue="-"
			out=item.indexvalue
			$("#A00229").text(out);//境外资产总额
		}else if(indextype=="A00230" && item.indexvalue!="" ){
			$("#A00230").text( parseFloat(item.indexvalue).toFixed(2));//境外资产占比
			
		} 
	})
	if(out!="" && all!="")
		createAccountingEchart(out,all)
	if(date!="")
		$("#accounting_date").text(dealDate(date) )
}


function createAccountingEchart(out,all)
{
	var rzxzEcharts = echarts.init(document.getElementById("accountingdiv"));
	var option = {
			tooltip: {
		        trigger: 'item',
		        formatter: "{b}:{c}亿 ({d}%)"
		    },
		    color:['#a2aab5','#276699'],
		    legend: {
		    	show:false,
		        orient: 'vertical',
		        x: 'left',
		        data:['境内资产(亿)','境外资产(亿)']
		    },
		    series: [
		        {
		           
		            type:'pie',
		          
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: false
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value: parseFloat( all-out).toFixed(2), name:'境内资产'},
		                {value:out, name:'境外资产'}
		            ]
		        }
		    ]
	};

	rzxzEcharts.setOption(option,true);
	window.onresize = rzxzEcharts.resize;
}

//稽核
function fn_audit(data)
{
	var date="";
	$.each(data,function(index,item){
		var indextype=item.indextype;
		
		if(indextype=="A00312"){
			var value=parseFloat(item.indexvalue).toFixed(2);
			
			createAudi2Echart(value,value>=100? 0:parseFloat( 100-value).toFixed(2))
			
			$("#A00312_1").text(value);//稽核进度
		}else if(indextype=="A00320"){
			var value=parseFloat(item.indexvalue).toFixed(2);
			createAudi1Echart(value,value>=100? 0: parseFloat(100-value).toFixed(2))
			date=item.updatetime;
			$("#A00320_1").text(value);//财务专业资质合格率
		}
	})
	if(date!="")
		$("#audit_date").text(dealDate(date) )
}



function createAudi1Echart(had,having)
{
	var rzxzEcharts = echarts.init(document.getElementById("Audi1echart"));
	var option = {
			tooltip: {
		        trigger: 'item',
		        formatter: "{b}: {c}%"
		    },
		    color:['#d66b73','#5b566c'],
		    series: [
		        {
		           
		            type:'pie',
		            radius: ['30%', '70%'],
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: false,
		                    textStyle: {
		                        fontSize: '30',
		                        fontWeight: 'bold'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value:had, name:'合格比率'},
		                {value:having, name:'不合格'}
		            ]
		        }
		    ]
	};

	rzxzEcharts.setOption(option,true);
	window.onresize = rzxzEcharts.resize;

}



function createAudi2Echart(had,having)
{
	var rzxzEcharts = echarts.init(document.getElementById("Audi2echart"));
	var option = {
			tooltip: {
		        trigger: 'item',
		        formatter: "{b}:{c}%"
		    },
		    color:['#3b82b8','#5b566c'],
		    series: [
		        {
		           
		            type:'pie',
		            radius: ['30%', '70%'],
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: false,
		                    textStyle: {
		                        fontSize: '30',
		                        fontWeight: 'bold'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value:had, name:'稽核进度'},
		                {value:having, name:'未完成比率'}
		            ]
		        }
		    ]
	};

	rzxzEcharts.setOption(option,true);
	window.onresize = rzxzEcharts.resize;

}




//核算
function fn_tax(data)
{
	var date="";
	$.each(data,function(index,item){
		var indextype=item.indextype;
		date=item.updatetime;
		if(indextype=="A00204"){
			if(item.indexvalue!=""){
				$("#A00204").text(parseFloat(item.indexvalue).toFixed(2));//年度节税任务完成情况
				$("#A00204_1").text(parseFloat(item.indexvalue*100).toFixed(2));//年度节税任务完成情况
				var value=parseFloat(item.indexvalue*100).toFixed(2);
				createTaxEchart(value,value>=100? 0:100-value);
			}
		}else if(indextype=="A00202"){
			$("#A00202").text((parseFloat(item.indexvalue)/10000).toFixed(2));//年度年度累计节税
		}else if(indextype=="A00198"){
			$("#A00198").text((parseFloat(item.indexvalue)/10000).toFixed(2));//年度年度累计实缴
		}
	})
	if(date!="")
		$("#tax_date").text(dealDate(date) )
}

function createTaxEchart(had,having)
{
	var rzxzEcharts = echarts.init(document.getElementById("taxechart"));
	var option = {
			tooltip: {
		        trigger: 'item',
		        formatter: "{b}:{c}%"
		    },
		    color:['#dea345','#5b566c'],
		    legend: {
		    	show:false,
		        orient: 'vertical',
		        x: 'left',
		        data:['完成百分比(%)','未完成百分比(%)']
		    },
		    series: [
		        {
		           
		            type:'pie',
		            radius: ['30%', '70%'],
		            avoidLabelOverlap: false,
		            label: {
		                normal: {
		                    show: false,
		                    position: 'center'
		                },
		                emphasis: {
		                    show: false,
		                    textStyle: {
		                        fontSize: '30',
		                        fontWeight: 'bold'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:[
		                {value:had, name:'年度节税任务完成情况'},
		                {value:having, name:'未完成百分比'}
		            ]
		        }
		    ]
	};

	rzxzEcharts.setOption(option,true);
	window.onresize = rzxzEcharts.resize;

}
//头寸数据查询
function tcDataSet(){
	$.ajax({
		url : basePath+"/finance/getHomeTcData",
		type : "POST",
		success:function(data1){
			if(data1!=null &&　data1!='')
			{
				var data=JSON.parse(data1)
				loadTcData(data);
			}
		}
	});
}

//首页头寸数据加载
function loadTcData(dataTc){
	var jrye="";	//今日余额
	var jrkytc="";  //今日可用头寸
	var year="",month="",day="";
	//echrts图数据
	var tcTitle;
	var xAxis=new Array();		//xAxis x轴
	var seriesData=new Array();		//series 分度数据
	var seriesKytcData = new Array();
	var seriesJnkyData = new Array();
	var seriesJwkyData = new Array();
	var stack=['0','1','1'];	//叠加参数
	var legend=['可用头寸','境内可用头寸','境外可用头寸'];//legend 选项
	var type='bar';			//bar 柱状图 line  折线图
	
	if(dataTc[0]){
		//整体资金头寸当日余额
		jrye=ne0(dataTc[0].a00217);
		jrkytc=(parseFloat(ne0(dataTc[0].a00220))+parseFloat(ne0(dataTc[0].a00221))+parseFloat(ne0(dataTc[0].a00222))+parseFloat(ne0(dataTc[0].a00278))).toFixed(2);
		year=dataTc[0].date_y;
		month=dataTc[0].date_m;
		day=dataTc[0].date_d;
		//设置头寸日期
		$("#f3_date").text(year+"年"+month+"月"+day+"日");//+day+"日"
	}
	
	//数据遍历获取//echarts图数据获取
	//修改资金头寸首页坐标显示，改成周显示
	//var dLength=getDLength(year,month);
	var dLength=7;		
	//设置季度为空数据
	// -----初始时间
	var day_temp_str = dataTc[0].date_y+'-'+
	(String(dataTc[0].date_m).length==1?('0'+dataTc[0].date_m):dataTc[0].date_m)+
	'-'+
	(String(dataTc[0].date_d).length==1?('0'+dataTc[0].date_d):dataTc[0].date_d);
	var day_temp_date = new Date(new Date(day_temp_str).getTime()-6*86400000);
	var day_temp = dateToString(day_temp_date);	
	
	for(var j=dLength-1;j>=0;j--){
		var flag = 0;	
		for(var k = 0;k<dataTc.length;k++){
			if(k==0){
				tcTitle=dataTc[0].orgnm+dataTc[0].date_y+"年"+dataTc[0].date_m+"月每日可用头寸情况表趋势图";
				var date = dataTc[0].date_y+'-'+
				   		   (String(dataTc[0].date_m).length==1?('0'+dataTc[0].date_m):dataTc[0].date_m);
			}
			if(dataTc[k]&&
					dataTc[k].date_d && j == k ){  //&&parseInt(dataTc[k].date_d)==d
				//x轴  
				var date_temp1=date+'-'+(String(dataTc[k].date_d).length==1?('0'+dataTc[k].date_d):dataTc[k].date_d);
				xAxis.push(parseToWeekDay(date_temp1)+'('+dataTc[k].date_m+'.'+dataTc[k].date_d+'号)');				
				//可用头寸
				seriesKytcData.push((parseFloat(ne0(dataTc[k].a00220))+parseFloat(ne0(dataTc[k].a00221))+parseFloat(ne0(dataTc[k].a00222))+parseFloat(ne0(dataTc[k].a00278))).toFixed(2));
				//境内可用
				seriesJnkyData.push((parseFloat(ne0(dataTc[k].a00220))+parseFloat(ne0(dataTc[k].a00221))).toFixed(2));
				//境外可用
				seriesJwkyData.push((parseFloat(ne0(dataTc[k].a00222))+parseFloat(ne0(dataTc[k].a00278))).toFixed(2));
				flag = 1;
				break;
			}
		}
		if(flag != 1){	
			xAxis.push(parseToWeekDay(day_temp));
			seriesKytcData.push("-");
			seriesJnkyData.push("-");
			seriesJwkyData.push("-");
		}	
		//console.log(day_temp);
		day_temp = dateToString(new Date(new Date(day_temp).getTime() + 86400000));
	}
	//头寸当日余额/10000
	$("#tcdryeId").html((parseFloat(ne0(jrkytc))).toFixed(2)+"<span class='fs14'>亿元</span>");//+"<span class='danwei'>亿元</span>"
	$("#tcTitle").text(year+"年"+month+"月"+day+"日可用头寸");
	//charts数据
	seriesData.push(seriesKytcData);/*.reverse()*/
	seriesData.push(seriesJnkyData);/*.reverse()*/
	seriesData.push(seriesJwkyData);/*.reverse()*/
	//创建Echarts
	createLineCharts("tcHomeEchartsId",legend,xAxis/*.reverse()*/,seriesData,stack,type,tcTitle);
}


function parseToWeekDay(date){
	
	var day = new Date(date).getDay();
	
	switch(day){
	case 0:
		return '星期日';
		break;
	case 1:
		return '星期一';
		break;
	case 2:
		return '星期二';
		break;
	case 3:
		return '星期三';
		break;
	case 4:
		return '星期四';
		break;
	case 5:
		return '星期五';
		break;
	case 6:
		return '星期六';
		break;
	default:
		return '';
	break;
	}	;
}

function parseToWeekDay2(d){
	
	switch(d){
	case 7:
		return '星期日';
		break;
	case 1:
		return '星期一';
		break;
	case 2:
		return '星期二';
		break;
	case 3:
		return '星期三';
		break;
	case 4:
		return '星期四';
		break;
	case 5:
		return '星期五';
		break;
	case 6:
		return '星期六';
		break;
	default:
		return '';
	break;
	}	;
}


function dateToString(date) {
    var datetime = date.getFullYear()
            + "-"// "年"
            + ((date.getMonth() + 1) > 10 ? (date.getMonth() + 1) : "0"
                    + (date.getMonth() + 1))
            + "-"// "月"
            + (date.getDate() < 10 ? "0" + date.getDate() : date
                    .getDate());
    return datetime;
}

function ne(value){
	return (!value||isNaN(value))?"-":value;
}
function ne0(value){
	return (!value||isNaN(value))?"0":value;
}
/*
 * 头寸charts
 */
function createLineCharts(chartsId,legend,xAxis,seriesData,stack,type,title){
	var BarCWObj = echarts.init(document.getElementById(chartsId));
	option = {
		title : {
	        text: title,
	        x:'center',
	        textStyle:{
	        	align:'center',
	        	color: "#ffffff"
	        }
	    },
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    color: ['#f996cd','#c9909b','#cfceb9','#cdcdcd','#eec7d4'],
	    legend: {
	        data:legend,
	        right:'0%',
	        top:30,
	        textStyle:{
	        	color: "#ffffff"
	        },
            crossStyle: {
                color: '#999'
            }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	        	axisLabel: {
	        	     interval:0//横轴信息全部显示
	        	},
	        	axisLine: {
                    lineStyle: {
                        type: 'solid',
                        color: '#ffffff',//底线的颜色
                        width:'1'//底线的宽度
                    }
                },
	            type : 'category',
	            data : xAxis  //['星期一','星期二','星期三','星期四','星期五','星期六','星期天'] 
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name: '亿元',
	            axisLine: {
                    lineStyle: {
                        color: '#ffffff',//右边线的颜色
                    }
                }
	        }
	    ],
	    series : 
	    	[
                {
                    name:legend[0],
                    type:type,
                    stack:stack[0],
                    data:seriesData[0],
                    width:'0.1'
                },
                {
                    name:legend[1],
                    type:type,
                    stack:stack[1],
                    data:seriesData[1],
                    width:'0.1'
                },{
                    name:legend[2],
                    type:type,
                    stack:stack[2],
                    data:seriesData[2],
                    width:'0.1'
                }
            ]
	};
	BarCWObj.setOption(option,true);
	window.onresize = BarCWObj.resize;
}
/**
 * 获取月最大天数
 */
function getDLength(year,month){
	if(month==2&&(((year % 4)==0) && ((year % 100)!=0) || ((year % 400)==0))){
		return 29;
	}else if(month==2&&!(((year % 4)==0) && ((year % 100)!=0) || ((year % 400)==0))){
		return 28;
	}else if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
		return 31;
	}else{//4 6 9 11
		return 30;
	}
}

function createOutCompare(data)
{ 
	var rzxzEcharts = echarts.init(document.getElementById("outcompare"));
	
	var maxData=0;
	
	$.each(data.data,function(index,item){
		if(item.a00488 && item.a00488!=""){
			var val=parseFloat(item.a00488)
			if(maxData< val)
				maxData=val;
		}
	})

	var inorgNm=[];
	var inorg=[]
	var outorgNm=[];
	var outorg=[];
	var datainfo=[];//给echart加载的数据
	var datasrc=[];//原始数据，因为收入的显示数据和真实数据不一致
	for ( var int = 0; int < 4; int++) {
		datainfo[int]=[];
		datasrc[int]=[];
		for ( var int2 = 0; int2 < data.orgcom.length; int2++) {
			datainfo[int][int2]='';
			datasrc[int][int2]='';
		}
	}
	for ( var i = 0; i < data.orgcom.length; i++) {
		var rowdata=[];
		var orgobj=data.orgcom[i];
		inorgNm.push(orgobj.publicorgNm);
		outorgNm.push(orgobj.outorgNm);
		inorg.push(orgobj.publicorg);
		outorg.push(orgobj.outorg);
		for ( var j = 0; j < data.data.length; j++) {
			
			var dataobj=data.data[j];
			var income=dataobj.a00488==undefined? 0: parseFloat(dataobj.a00488);//收入
			var profit=dataobj.a00489==undefined? 0: parseFloat(dataobj.a00489);//利润
			//做比较是因为数据量级查太多，所以数据都取了In 函数的值，缩小差距，选择2是因为 数学里e的值的2.3
			var incomedealval=Math.log(((Math.abs(income)-Math.abs(profit))>2? (Math.abs(income)-Math.abs(profit)):(Math.abs(income)-Math.abs(profit)+2 )))
			var profitdealval=Math.log((profit>2? profit:profit+2))
			if(orgobj.publicorg==dataobj.org)
			{
				datasrc[0][i]=income;
				datasrc[1][i]=profit;
				datainfo[0][i]= - incomedealval;
				datainfo[1][i]= - profitdealval;
			}else if(orgobj.outorg==dataobj.org){
				datasrc[2][i]=income;
				datasrc[3][i]=profit;
				datainfo[2][i]= incomedealval;
				datainfo[3][i]= profitdealval;
			}
			
		}
	}
	if(data.year && data.season)
		$("#compare_date").text(data.year+"年"+data.season+"季度");
	var option = {
            legend: {
                data:['收入','利润'],
                textStyle:{
		        	color: "#ffffff"
		        },
            },
            grid: {
                top: '15%',
                left: '3%',
                right: '4%',
                bottom: '0%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'value', show:false,
                    max:Math.log(maxData)+2.30,min:-Math.log(maxData)-2.30
                }
            ],
            yAxis : [
                {
                    type : 'category',
                    axisTick : {show: false},
                    data:inorgNm,
                    axisLine: {
	                    lineStyle: {
	                        type: 'solid',
	                        color: '#ffffff',//左边线的颜色
	                        width:'1'//坐标线的宽度
	                    }
	                },
	                zlevel:1
                    
                }, {
                    type : 'category',
                    axisTick : {show: false},
                    data:outorgNm,
                    splitLine:{
		            	lineStyle:{
		            		color: '#ffffff'
		            	},
		            	show: false
		            },
                    axisLine: {
	                    lineStyle: {
	                        type: 'solid',
	                        color: '#ffffff',//左边线的颜色
	                        width:'1'//坐标线的宽度
	                    }
	                }
                }
            ],
            tooltip : {
                show:true,
                formatter:function(p){
                    var i = p.dataIndex,abs = Math.abs
                    return (p.seriesIndex < 2 ?   inorgNm[i]+'<br>'+'收入 ' + abs( datasrc[0][i])+ '亿元<br>利润 ' + abs(datasrc[1][i])+'':
                    	outorgNm[i]+'<br>'+'收入 ' + abs(datasrc[2][i]) + '亿元<br>利润 ' + abs(datasrc[3][i]))+'亿元';
                }
            },
            series : [

				{
				    name:'利润',
				    type:'bar',
				    stack: '1',
				    data:datainfo[1],
				    itemStyle:{
				        normal:{
				            color:'#2f8fcb'
				        }
				    },
	                barWidth:16,
				},
                {
                    name:'收入',
                    type:'bar',
                    stack: '1',
                    data:datainfo[0],
                    itemStyle:{
                        normal:{
                            color:'#f46766'
                        }
                    },
	                barWidth:16,
                },
                {
                    name:'利润',
                    type:'bar',
                    stack: '1',
                    data:datainfo[3],
                    itemStyle:{
                        normal:{
                            color:'#2f8fcb'
                        }
                    },
	                barWidth:16,
                },
                {
                    name:'收入',
                    type:'bar',
                    stack:'1',
                    data:datainfo[2],
                    itemStyle:{
                        normal:{
                            color:'#f46766'
                        }
                    },
	                barWidth:16,
                }
                
            ]
        };

	
	rzxzEcharts.setOption(option,true);
	window.onresize = rzxzEcharts.resize;

}


/**
 *  初始化资金重点支出大项表格
 */
//加载index对应的数据
function getData(index){
	var dd = $("#cfpDate").text();
	var year = dd.substring(0,4);
	var month = dd.substring(5,7);
	console.log(year);
	console.log(month);
	var org = "";
	var result = "";
	//获取数据
	$.ajax({
		url : basePath+"/finance/cashflowMonthly/get"+index,
		type : "POST",
		 async: false,
		data : {"year":year,"month":month,"orgID":org},
		success : function(data1) {
				var data=JSON.parse(data1)
				openlevel1window();
				result = createPinPaiLevel(data,index);
		}
	});
	return result;
}

function dd(){
	var level1chartOBj='<div align="center" style="margin-top:20px;overflow-y:auto;height:400px;margin-left:20px;">';
	var a = getData('MonthlyInvestmentOutDetailPlanS') ;
	var b = getData('MonthlyFinancingOutDetailPlanS');
	
	level1chartOBj = a+'<br>'+b+'</div>';
	$('#level1_title').html("重点支出大项");
	$('#level1_chart').html(level1chartOBj);
}

/**
 * 打开一级弹窗
 */
function openlevel1window(){
	$('#chart-modal').jqm({overlay:75}).jqmShow();
}

/**
 * 现金流下周计划筹资、投资性详情信息
 * @param data      数据
 */
function createPinPaiLevel(data,index){
	var level1chartOBj="";
	if (level1chartOBj && level1chartOBj.dispose) {
		level1chartOBj.dispose();
    } 
	var nameTitle = "";
	if(index == 'MonthlyFinancingOutDetailPlanS'){
		nameTitle = "筹资性支出";
	}else{
		nameTitle = "投资性支出";
	}
	level1chartOBj='<div>'+nameTitle+'</div>';
	level1chartOBj+='<table border="1" cellspacing="0" cellpadding="0" id="PPXX" style="width:95%" class="table  table-striped table-bordered table-hover">';
	// 表头
	if(index == 'MonthlyFinancingOutDetailPlanS')
	{
		level1chartOBj+='<tr>';
	    level1chartOBj+='<th width="10%" style="text-align:center;">序号</th>';
	    level1chartOBj+='<th width="10%" style="text-align:center;">操作单位</th>';
	    level1chartOBj+='<th width="10%" style="text-align:center;">还款金额（亿元）</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">还贷日期</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">还贷类型</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">金融机构</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">是否续作</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">还款币种</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">保障还款项目</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">是否有保障还款计划</th>';
	    level1chartOBj+='</tr>';
	    // 数据
	    if(data.length > 0){
	    	for(var i=0;i<data.length; i++){
	    		var ppList = data[i];
	    		level1chartOBj+='<tr><td width="10%" align="center">'+(i+1)+'</td>';
	    		for(var j=0;j<ppList.length;j++){
	    			level1chartOBj+='<td width="10%" align="center">'+ppList[j]+'</td>';
	    		}
	    		level1chartOBj+='</tr>';
	    	}
	    }else{
	    	level1chartOBj+='<tr><td colspan="10" align="center">无数据</td></tr>'
	    }
		level1chartOBj+='</table>';
		
	}
	else
	{
		level1chartOBj+='<tr>';
	    level1chartOBj+='<th width="10%" style="text-align:center;">序号</th>';
	    level1chartOBj+='<th width="10%" style="text-align:center;">操作单位</th>';
	    level1chartOBj+='<th width="10%" style="text-align:center;">投资日期</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">投资项目名称</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">投资金额（亿元）</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">专项资金保障方案</th>';
	    level1chartOBj+='<th width="10%" style="text-align:center;">投资币种</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">投资类型</th>';
		level1chartOBj+='<th width="10%" style="text-align:center;">是否有保障还款计划</th>';
	    level1chartOBj+='</tr>';
	    // 数据
	    if(data.length > 0){
	    	for(var i=0;i<data.length; i++){
	    		var ppList = data[i];
	    		level1chartOBj+='<tr><td width="10%" align="center">'+(i+1)+'</td>';
	    		for(var j=0;j<ppList.length;j++){
	    			level1chartOBj+='<td width="10%" align="center">'+ppList[j]+'</td>';
	    		}
	    		level1chartOBj+='</tr>';
	    	}
	    }else{
	    	level1chartOBj+='<tr><td colspan="9" align="center">无数据</td></tr>'
	    }
		level1chartOBj+='</table>';
		
	}
	
	return level1chartOBj;
}






