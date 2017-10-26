
var $arrowLeft=$('.arrow-left'),
	$arrowRight=$('.arrow-right');
var mySwiper = new Swiper('.swiper-parent',{
		mode:'horizontal',
		loop: true,
		resizeReInit:true,
		keyboardControl : true,
		// mousewheelControl:true,
		onInit:function(){
			$('.menucon a').eq(0).addClass('active');
		},
		onSlideChangeEnd:function(swiper){
			var index=swiper.activeIndex-1;
			if (index==3||index==4||index==5) {
				$('.menucon a').eq(3).addClass('active').siblings().removeClass('active');
			}else{
				$('.menucon a').eq(index).addClass('active').siblings().removeClass('active');
			}
			if ($('.swiper-slide-active').hasClass('swiper-slide-duplicate')) {
				$('.menucon a').removeClass();
			}
		}
	});

var news=new Swiper('.swiper-news',{
	wrapperClass:'swiper-news-wrapper',
	slideClss:'swiper-news-slide',
	pagination :'.swiper-news-pagination',
	mode:'horizontal',
	loop: true,
	mousewheelControl:true,
	paginationClickable :true
});

	$(function() {
		$(window).on('load resize', function() {
			resize();
		});
		$('.menucon a').each(function() {
			var thisIndex=$(this).index();
			$(this).attr('onclick', 'mySwiper.swipeTo('+thisIndex+')');
		});
		$arrowRight.on('click',function(event) {
			event.preventDefault();
			mySwiper.swipeNext();
		});
		$arrowLeft.on('click',function(event) {
			event.preventDefault();
			mySwiper.swipePrev();
		});

		$('.tab-hd a').click(function() {
			$(this).addClass('active').siblings().removeClass('active');
			$(this).parent().siblings('.tab-bd').children().eq($(this).index()).show().siblings().hide();
		});
		$('.news-hd a').click(function() {
			$(this).addClass('active').siblings().removeClass('active');
			$(this).parent().siblings('.news-bd').children().eq($(this).index()).fadeIn().siblings().fadeOut();
		});
		// 第二页滚动条
		$(".message-con,#section5 .con,#section7.con").mCustomScrollbar();
	});

	function showDia(id){
	    showDialog.show({
	        id:id,      //需要弹出的id，如果是弹出页面上的div，则该选项为必选
	        bgcolor:"#000",//弹出“遮罩”的颜色，格式为"#FF6600"，可选，默认为"#fff"
	        opacity:50     //弹出“遮罩”的透明度，格式为｛10-100｝，可选
	    });
	}

	function resize(){
		$('.con').each(function(index) {
			var w=$(this).width();
			var h=$(this).height();
			var winW=document.body.clientWidth;
			console.log(winW);
			var ratio=winW/1903;
			if ($('html').hasClass('no-supports')) {
				$(this).css({
					'margin-top': '-'+h/2+'px',
					'margin-left': '-'+w/2+'px'
				});
			}else{
				$(this).css({
					'-webkit-transform':'scale('+ratio+')',
					'-moz-transform':'scale('+ratio+')',
					'-ms-transform':'scale('+ratio+')',
					'transform':'scale('+ratio+')'
				});
			}
		});
	}

	var u = navigator.userAgent;
    window.browser = {};
    window.browser.safari = u.indexOf('Safari') > -1;
    window.browser.chrome = u.indexOf('Chrome') > -1;
    console.log(window.browser.safari && !window.browser.chrome);
    if (window.browser.safari && !window.browser.chrome) {
    	$('.con').addClass('fucksafari');
    };

