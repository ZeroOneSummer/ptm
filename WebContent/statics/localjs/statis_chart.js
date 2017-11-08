

$(document).ready(function() {
	$("#jqChart").jqChart({		
		title: {
			text: '平台运营统计数据'
		},
		axes: [{
			location: 'left', //y轴位置，取值：left,right
			minimum: 0, //y轴刻度最小值
			maximum: 800, //y轴刻度最大值
			interval: 100 //刻度间距
		}],
		series: [
			//数据1开始
			{
				type: 'line', //图表类型，取值：column 柱形图，line 线形图
				title: '本月交易金额（千万元）', //标题
				data: [
					['1月', 181.4],
					['2月', 201.4],
					['3月', 225.4],
					['4月', 265.4],
					['5月', 260.4],
					['6月', 225.6],
					['7月', 325.6],
					['8月', 367.6],
					['9月', 346.7],
					['10月', 324.6],
					['11月', ],
					['12月', ]
				] //数据内容，格式[[x轴标题,数值1],[x轴标题,数值2],......]
			},
			//数据1结束
			//数据2
			{
				type: 'line',
				title: '累计交易金额（亿元）',
				data: [
					['一月', 212.3],
					['二月', 212.5],
					['三月', 212.8],
					['四月', 213.0],
					['五月', 213.3],
					['六月', 221.0],
					['七月', 228.1],
					['八月', 231.6],
					['九月', 251.0],
					['十月', 284.7],
					['十一月', ],
					['十二月', ]
				]
			},
			//数据2结束
			//数据3
			{
				type: 'line',
				title: '累计用户数（万人）',
				data: [
					['一月', 412.9],
					['二月', 428.4],
					['三月', 443.6],
					['四月', 461.8],
					['五月', 470.6],
					['六月', 564.3],
					['七月', 653.5],
					['八月', 755.4],
					['九月', 756.3],
					['十月', 786.4],
					['十一月', ],
					['十二月', ]
				]
			},
			//数据3结束	
			//数据4
			{
				type: 'line',
				title: '累计收益（千万元）',
				data: [
					['一月', 33.4],
					['二月', 38.4],
					['三月', 41.4],
					['四月', 43.4],
					['五月', 48.4],
					['六月', 48.7],
					['七月', 49.6],
					['八月', 50.4],
					['九月', 51.5],
					['十月', 52.9],
					['十一月', ],
					['十二月', ]
				]
			},
			//数据4结束	
		]
	});
});
