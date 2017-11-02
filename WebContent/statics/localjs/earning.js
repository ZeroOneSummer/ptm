//周收益曲线
/*确定坐标上的点，y轴自动生成刻度*/
	var myData = new Array([1, 0.10], [2, 0.25], [3, 0.30], [4, 0.45], [5, 0.50], [6, 0.90], [7, 0.70]);
	
	/*指定载体和图表类型*/
	var myChart = new JSChart('mychart', 'line');
	
	/*将坐标数据加载到图表中*/
	myChart.setDataArray(myData);
	
	/*图表标题及颜色、大小*/
	myChart.setTitle('收益曲线');
	myChart.setTitleColor('#8E8E8E');	
	myChart.setTitleFontSize(11);
	
	/*x、y轴说明*/
	myChart.setAxisNameX('收益（元）');
	myChart.setAxisNameY('');
	
	/*坐标轴颜色*/
	myChart.setAxisColor('#8420CA');
	
	/*坐标轴上值的颜色*/
	myChart.setAxisValuesColor('#949494');
	
	/*图表内边距*/
	myChart.setAxisPaddingLeft(100);
	myChart.setAxisPaddingRight(120);
	myChart.setAxisPaddingTop(50);
	myChart.setAxisPaddingBottom(50);
	
	/*y坐标精度*/
	myChart.setAxisValuesDecimals(2);
	
	/*x坐标距离*/
	myChart.setAxisValuesNumberX(1);
	
	/*清晰显示x坐标的值*/
	myChart.setShowXValues(false);
	
	/*网格颜色*/
	myChart.setGridColor('#C5A2DE');
	
	/*折线颜色、宽度*/
	myChart.setLineColor('#BBBBBB');	
	myChart.setLineWidth(2);
	
	/*折线点颜色、半径*/
	myChart.setFlagColor('#9D12FD');
	myChart.setFlagRadius(4);
	
	/*x坐标对应点的鼠标悬浮时提示的文字*/
	myChart.setTooltip([1, '0.10']);
	myChart.setTooltip([2, '0.25']);
	myChart.setTooltip([3, '0.30']);
	myChart.setTooltip([4, '0.45']);
	myChart.setTooltip([5, '0.50']);
	myChart.setTooltip([6, '0.90']);
	myChart.setTooltip([7, '0.70']);	
	
	/*x坐标对应显示的值*/
	myChart.setLabelX([1, '11/4']);
	myChart.setLabelX([2, '11/5']);
	myChart.setLabelX([3, '11/6']);
	myChart.setLabelX([4, '11/7']);
	myChart.setLabelX([5, '11/8']);
	myChart.setLabelX([6, '11/9']);
	myChart.setLabelX([7, '11/10']);	
	
	/*图表大小*/
	myChart.setSize(616, 321);
	
	/*图表背景图片*/
	//myChart.setBackgroundImage('img/chart_bg.jpg');
	
	/*绘制图表（显示）*/
	myChart.draw();
	
	$("#mychart").css("padding-left","160px");