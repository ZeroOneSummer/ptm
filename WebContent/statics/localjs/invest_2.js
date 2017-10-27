//口袋理财-报喜鸟上市系投资的专业移动理财平台
//-------------------分页展示数据-----------------------

	function sendPage(frm,num){
		var totalPageCount=$("#totalPageCount").val();
		if(num<1){
			num=1;
		}else if(num>totalPageCount){
			num=totalPageCount;
		}
		frm.currentPageNo.value=num;
		frm.submit();
	}

	function dumpPage(frm){
		var num=$("#dumpPage").val();//跳转页码	
		/*alert(num != "");*/
		if(num != ""){				
			sendPage(frm,num);
		}		
	}


// 风险提示lightbox效果
	$(function(){
		$('.rel').hover(function(){
			$(this).children('.relInfo').fadeIn(200);
		},function(){
			$(this).children('.relInfo').fadeOut(200);
		});
		$(".group1").colorbox({rel:'group1',width:"80%", height:"80%"});
		$(".group2").colorbox({rel:'group2',width:"80%", height:"80%"});
		$(".group3").colorbox({rel:'group3',width:"80%", height:"80%"});
		$(".group4").colorbox({rel:'group4',width:"80%", height:"80%"});
	});
	// <img src="https://www.koudailc.com/image/base/banner/channel_4.jpg" alt="">
	var channelid=4;
	var $banner=$('.banner');
	switch(channelid){
		case 4:
			$banner.css({
				'background-image': 'url(https://www.koudailc.com/image/base/banner/channel_4.jpg?ver=20170622)',
				'background-color': '#c1975d'
			});
			break;
		case 5:
			$banner.css({
				'background-image': 'url(https://www.koudailc.com/image/base/banner/channel_5.jpg)',
				'background-color': '#9c1617'
			});
			break;
		case 7:
			$banner.css({
				'background-image': 'url(https://www.koudailc.com/image/base/banner/channel_7.jpg)',
				'background-color': '#f39c25'
			});
			break;
		case 8:
			$banner.css({
				'background-image': 'url(https://www.koudailc.com/image/base/banner/channel_8.jpg)',
				'background-color': '#230036'
			});
			break;
		case 9:
			$banner.css({
				'background-image': 'url(https://www.koudailc.com/image/base/banner/channel_9.jpg)',
				'background-color': '#005065'
			});
			break;
		case 10:
			$banner.css({
				'background-image': 'url(https://www.koudailc.com/image/base/banner/channel_10.jpg)',
				'background-color': '#0d3371'
			});
			break;
	}
	
//--------------------2------------------------
	var page = 1;
 	var pageSize = 6;
    var channelId = Number("4");
    var status = 0;
    var period = 0;
    var apr = 0;
	$(function(){
		getPaging(page); // ajax拉取列表数据
		$('.site-map ul').find('li:last').children('a').css('color', '#fb5353');
		$('.pro-list ul li').each(function(index){
			$(this).click(function(event) {
				event.stopPropagation();
				$(this).addClass('on').siblings().removeClass('on');
			});
		});
		$('.social a').hover(function() {
			$(this).children('img').prop('src', 'https://www.koudailc.com/image/base/'+$(this).prop('class')+'-active.png').siblings('.tips').show();
		}, function() {
			$(this).children('img').prop('src', 'https://www.koudailc.com/image/base/'+$(this).prop('class')+'.png').siblings('.tips').hide();;
		});

	});
	! function (a) {
	    var b = function () {
	        this.init()
	    };
	    b.prototype = {
	        init: function () {this.productShow()},
	        productShow: function () {
	            var b = a(".slide"),
	                c = b.find("li"),
	                d = function () {
	                    var b = a(window).width();
	                    return 760 > b ? !0 : !1
	                };
	            c.hover(function () {
	                var b = a(this),
	                    e = d() ? 142 : 142,
	                    f = d() ? 421 : 421;
	                c.not(b).stop().animate({
	                    width: e
	                }).removeClass("active").children().find('.extension').addClass('dn').siblings().find('.overlay').fadeIn(200), b.stop().animate({
	                    width: f
	                }).addClass("active").children().children('.extension').removeClass('dn');
	                $(this).children().children().find('.overlay').fadeOut(200);
	            }), a(window).resize(function () {
	                c.filter(".active").mouseenter()
	            })
	        }
	    }, new b
	}(jQuery);

	// ajax拉取列表数据
    function getPaging(page){
        var url2 = "https://www.koudailc.com/list/list-data";
        var searcher ='';
        var is_day = '天';
        $.ajax({
            url : url2,
            type: 'POST',
            dataType: 'json',
            jsonp: 'callback',
            data : {
            	channelId:channelId,
            	page:page,
            	pageSize:pageSize,
         		status:status,
         		period:period,
         		apr:apr
            },
            success:function(data){
                if( data.code == 0){
                	var html2 ='';
                	$.each(data.search,function(index,value){
                		searcher += '<div class="pro-'+index+'">';
                		searcher +=	'<ul class="clearfix">';
                		searcher += '<li class="font16 _999">'+data.title_head_ch[index]+'</li>';
                		$.each(value,function(k,v){
                			if((index == 'status' && status == k) || (index == 'period' && period == k) || (index == 'apr' && apr == k)){
                				searcher += "<li class='on _333' onClick='Searcher("+'"'+index+'"'+","+k+")'><a>"+v+"</a></li>";
                			}else{
                				searcher += "<li class='_333' onClick='Searcher("+'"'+index+'"'+","+k+")'><a>"+v+"</a></li>";
                			}

                		});
                		searcher += '</ul>';
                		searcher += '</div>';
                	});
                	$('#pro-list').html(searcher);
                    if(data.projects.length == 0){
                        html2 = '<tr><td colspan="10">暂无数据</td></tr>';
                        $('#paging').html('');
                        $('#pc_list_data').html(html2);
                    }else{
                        $.each(data.projects,function(index,value){
                        	var novice = '';
					        var corner_1 = '';
					        var corner_2= '';
                        	if(value.is_novice == 1){
                        		novice = '<span class="td-img"><img src="https://www.koudailc.com/image/base/icon-new.png" alt=""  class="icon-img" onmouseenter="showTips(this);" onmouseout="hideTips(this);"/><img src="https://www.koudailc.com/image/base/new-tips.png" alt=""  class="icon-tips"/></span>';
                        	}
                        	if(value.corner_text == '抢'){
                        		corner_1 = '<span class="td-img"><img src="https://www.koudailc.com/image/base/icon-qiang.png" alt=""  class="icon-img" onmouseenter="showTips(this);" onmouseout="hideTips(this);"/><img src="https://www.koudailc.com/image/base/qiang-tips.png" alt=""  class="icon-tips"/></span>';
                        	}
                        	if(value.corner_text == '送'){
                        		corner_2 = '<span class="td-img"><img src="https://www.koudailc.com/image/base/icon-song.png" alt=""  class="icon-img" onmouseenter="showTips(this);" onmouseout="hideTips(this);"/><img src="https://www.koudailc.com/image/base/song-tips.png" alt=""  class="icon-tips"/></span>';
                        	}
                            html2 +='<tr>';
                            html2 +='<td class="firstchild"><span class="pan"><a href="/list/detail?id='+value.id+'&channelId='+channelId+'">'+value.name+'</a>'+'</span>'+novice+corner_1+corner_2+'</td>';
                            html2 +='<td>'+value.apr+'</td>';
                            html2 +='<td>'+value.min_invest_money/100+'</td>';
                            if(value.floating_period != ''){
                            	html2 +='<td>'+value.floating_period+'</td>';
                            }else{
                            	html2 +='<td>'+value.period+'</td>';
                            }
                            html2 +='<td>'+value.success_number+'</td>';
                            if(value.type == 3){
                            	if(value.status == 3){
                            		html2 +='<td class="lastchild"><a href="/list/detail?id='+value.id+'&channelId='+channelId+'">立即预约</a></td>';
                            	}else{
                            		html2 +='<td class="lastchild"><a href="/list/detail?id='+value.id+'&channelId='+channelId+'">查看详情</a></td>';
                            	}
                            }else{
                            	html2 +='<td class="lastchild"><a href="/list/detail?id='+value.id+'&channelId='+channelId+'">'+value.btn_desc+'</a></td>';
                            }
                            html2 +='</tr>';
                        });

						$('#pc_list_data').html(html2);
	                    var ajaxpage ="/page/ajaxpages-get";
	                    $.ajax({
	                        url :ajaxpage,
	                        type: 'GET',
	                        dataType: 'json',
	                        data: {
	                        	pages: data.pages.totalCount,
								pageSize: pageSize,
								cur:page,
	                        	methodName:'getPaging',
	                        	hiddenNumber:'0'
	                        },
	                        success:function(data){
	                            $('#paging').html(data);
	                        }
	                    });
                    }
                }else{
                    $('#pc_list_data').html('<tr><td colspan="10" align="center">数据加载失败</td></tr>');
                }
            }
        });
    }
    function Searcher(index,v){
    	if(index == 'status'){
    		status = v;    	}
    	if(index == 'period'){
    		period = v;
    	}
    	if(index == 'apr'){
    		apr = v;
    	}
    	getPaging(page);
    }
    function showTips(e){
    	$(e).next('.icon-tips').show();
    }
    function hideTips(e){
    	$(e).next('.icon-tips').hide();
    }
    function goKdb() {
        window.location.href = "/list/kdb-invest?channelId=4";
    }

 
	
	
	
	
	
	
	
	
	
	
	
	