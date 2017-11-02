
//----------------------------自己添加----------------------------------	
    // 点击立即投资
    $('.invest_sure').click(function(){
    	var user_session=$("#user_session").val();
    	var bankNumber=$("#bankNumber").val();
    	if(user_session){    	
    		var invest_money=$('.user_invest_money').val();//投资金额    		
    		if(!bankNumber){
    			alert("您的账户还未绑定银行卡");
    			//未实名认证后绑定银行卡，跳转到账户中心
    			location.href="account.html";  			
    		}else if(invest_money>=1000 && invest_money<=30000 && invest_money%1000==0){
    			var userId=$('#userId').val();//用户id
    			var productId=$('#productId').val();//产品id
    			var tradeTypeId=1;//交易类型：投资
    			
    			$.ajax({
    				url:"doInvest",
    				type:"get",
    				data:{tradeMoney:invest_money,userId:userId,produceId:productId,tradeTypeId:tradeTypeId},
    				dataType:"json",
    				success:function(data){
    					if(data){
    						alert('投资成功');
    						location.href='jumpToMyInvest.html';
    					}else{
    						alert('投资失败，已回滚事物');
    					}
    				}
    			});   			
    		}else{
    			alert("单笔投资金额必须是在1000-30000之间1000的倍数")    					
    		}   		
    	}else{    		
    		location.href="login";//登录
    	}       
    });
   

//将可投余额按xx,xxx,xxx.xx显示
	var sz1=$("#bqze").text().split('.');	
	var a1=sz1[0].split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('');
	$("#bqze").text(a1+'.'+sz1[1]);
	
	var sz2=$("#sykt").text().split('.');
	var a2=sz2[0].split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('');
	$("#sykt").text(a2+'.'+sz2[1]);

//-------------------------------------------------------------
	
	
	
	
	
	
	
	
	
//投资频道-口袋理财
	var a,b,c,d;
	var tips=Array();
	tips['jsx'] =  "项目购买成功第二天至项目满款审核期间按口袋宝利率计息";
	tips['sjk'] =  "支持明星组合活动";
	tips['novice'] =  "仅限未曾投资新手项目者投资";
	tips['voucher'] =  "可使用口袋券";
	tips['transfer'] =  "本项目在持满30天至距离还款日还有30天期间允许转让";
	tips['pttx'] =  "平台贴息";
	tips['kdr'] =  "口袋日专享项目";
	tips['jmjsx'] =  "投资成功次日即开始计息";
	var use_money = 0;
	var id = Number("18124");
	var is_kdb_pay = 0;
	var uid = 3710556;
	var real_verify_status = 0;
	var invest_money = $('.user_invest_money').val();
	var page = 1;
    var pageSize = 5;
    var history_url = window.location.href;
    var result_msg = '';
    var remain_money = 194000;
    var invest_min_money = 1000;
    var invest_max_money = 30000;
    var temp_money = 1000;
    var is_get_voucher = 0;
	$(function(){
		getVouchers();
		getInvestList(page); // 获取项目投资记录
		$('.selec').click(function(event) {
			event.stopPropagation();
			if(is_get_voucher == 0){
				$(this).next('ul').slideToggle();
			}
		});
		$('.kdq').find('li').click(function(){
			$('.selec').val($(this).html());
			$(this).parent('.kdq').slideUp();
		});
		$(window).on('load resize',function(event) {
			$('.showtip').each(function(index) {
				$(this).hover(function(e) {
					var key;
					key = $(this).attr('id');
					c=$(this).offset().left;
					a=e.pageX;
					b=e.pageY;
					$('.tips').html(tips[key]+'<div class="triangle-up"></div>').css({
						top: 41,
						left: c-parseInt($('h3:first').offset().left)+40
					}).show();
				}, function() {
					$('.tips').hide();
				});
			});
		});
	});
	$('.checkbox').click(function(){
		$(this).children('i').toggleClass('checked');
		if($(this).children('i').attr('class') == 'checked'){
			$('.user_invest_money').val(use_money);
			if(use_money){
				getVouchers();
			}else{
				outVouchers();
			}
			var userId=$("#userId").val();	
			if(userId){
				//获取我的账户余额
				$.ajax({
					url:"getBalance",
					data:{userId:userId},
					dataType:"json",
					type:"get",
					success:function(data){
						$(".readonly").html(data.balance);
						$(".user_invest_money").val(data.balance);
					}
				});				
			}
						
		}else{
			$('.user_invest_money').val('').css('color','#333333');
			outVouchers();
			$(".readonly").html(0);
		}
	});
	$('.user_invest_money').focus(function(){
		if($('.user_invest_money').val() == result_msg){
			$('.user_invest_money').attr('placeholder','10,000').val('').css('color','#333333');
		}
	});

	$('.user_invest_money').keyup(function(event){
		if((event.keyCode >= 48 && event.keyCode <=105) || event.keyCode == 8){
			if($('.user_invest_money').val() != '' && '1'){
				getVouchers();
			}else{
				outVouchers();
			}
		}
	});

	var voucher_id = 0;
	//拉取用户当前项目可用券
	function getVouchers(){
		is_get_voucher = 0;
		invest_money = $('.user_invest_money').val();
        var ajax_url = "https://deposit.koudailc.com/voucher/show-available-vouchers?clientType=pc";
        var btn_id = '.selec';
        var btn_text = "请选择优惠券";
        var a_js_var = "javascript:void(0);";
        $.ajax({
            url : ajax_url,
            type: 'GET',
            dataType: "jsonp",
            jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
            jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
            data : {
                project_id : id,
                money : invest_money,
                page:page,
                pageSize:100
            },
            // beforeSend : function(){
            //     $(btn_id).attr('href','#');
            //     $(btn_id).html("载入中…");
            // },
            complete : function(){
                $(btn_id).attr('href', a_js_var);
                $(btn_id).html(btn_text).css('color','#999999');
            },
            success : function(result){
                if( result.code == 0){
                	$('.triangle-down').addClass('triangle-down-active');
                    //拉取券数据成功 行为
                    var li = '<li class="open" select_voucher_id="">请选择口袋券</li>';
                    $('.selec').val('请选择口袋券');
                    for(i=0;i<result.data.length;i++){
                        li += '<li class="open" select_voucher_id="' + result.data[i].id + '" >'+ result.data[i].voucher_detail.title +'</li>';
                    }
                    $('.kdq').html(li);
                    $('.kdq li').click(function(){
                    	voucher_id = $(this).attr('select_voucher_id');
                    	$('.selec').val($(this).html()).next('ul').slideToggle();
                    });
                }else{
                    // var box = '<li class="voucher-msg">'+result.message+'</li>';
                    // $('.kdq').html(box);
                    $('.selec').val(result.message);
                    outVouchers();
                }
            }
        });
	}

	// 清除口袋券
	function outVouchers(){
		is_get_voucher = 1;
        $('.kdq').slideUp();
		$('.selec').val('');
		$('.triangle-down').removeClass('triangle-down-active');
	}

	// 实名认证
    function go_id_verify(){
        window.location.href = "/account/user-center-real"+'?redirect_url='+history_url;
    }
    // 绑定银行卡
    function go_bank(){
        window.location.href = "/account/user-center-bindcard"+'?redirect_url='+history_url;
    }
    // 登录
    function go_login(){
        window.location.href = "/site/login";
    }
    // 充值
    function add_money(){
        window.location.href = "/account/recharge"+'?redirect_url='+history_url;
    }

    // 弹窗-输入交易密码
	function popBox(){
		layer.open({
	    	title:'确认投标',
	    	skin:'invest-popbox',
	        type: 1,
	        area: ['300px', '200px'],
	        shadeClose: true, //点击遮罩关闭
	        content: '<div id="popbox_invest"><p class="popbox_pwd"><label for="">交易密码</label><input type="password" id="password" maxlength="6"/></p><p id="notifications">&nbsp;</p><button class="db bg_fd5353 popbox_invest" onclick="f_pay()">确认投资</button></div>'
	    });
	}

	// 点击立即投资
    /*$('.invest_sure').click(function(){
    	place();
    });*/
	

    var order_id = '';
    //下单
    function projectBuyTips(result_msg){
        // $('.user_invest_money').val(result_msg).css('color','#FD5353');
        alert(result_msg);
        return false;
    }
    function place(){
    	    	invest_money = $('.user_invest_money').val() ? $('.user_invest_money').val() : 0;
    	if(uid){
    		if(real_verify_status){
		        if( invest_money == "" ){
			        return projectBuyTips('请输入投资金额');
		        }else if( invest_money < invest_min_money && remain_money > invest_min_money ){
			        return projectBuyTips('您的投资金额不能少于起投金额！');
		        }else if( invest_money > remain_money ){
			        return projectBuyTips('超过投资上限喽！');
		        }else if( invest_money % temp_money != 0 ){
			        return projectBuyTips("请输入"+temp_money+"的整数倍！");
		        }else if( invest_money < remain_money && remain_money <= invest_min_money ){
			        return projectBuyTips("项目剩余金额不多啦, 马上投资完成临门一脚");
		        }else if( invest_money > invest_max_money && invest_max_money > 0 ){
			        return projectBuyTips("单笔限购"+invest_max_money+'元');
		        }else if(invest_money > use_money){
    				add_money();
			        return false;
    			}else{
    				var ajax_url = "https://deposit.koudailc.com/project/invest-order?clientType=pc";
			        var btn_id = '#place_btn';
			        var btn_text = "立即投资";
			        var a_js_var = "javascript:void(0);";
			        $.ajax({
			            url : ajax_url,
			            type: 'POST',
			            dataType: "jsonp",
			            jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			            jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
			            data : {
			                money : invest_money,
			                voucher_id : voucher_id
			            },
			            // beforeSend : function(){
			            //     $(btn_id).attr('href','#');
			            //     $(btn_id).html("载入中…");
			            // },
			            complete : function(){
			                $(btn_id).attr('href', a_js_var);
			                $(btn_id).html(btn_text);
			            },
			            success : function(result){
			                if( result.code == 0){
			                    //下单成功 行为
			                    order_id = result.order_id;
			                    popBox();
			                }else{
			                	result_msg = result.message;
			                    $('.user_invest_money').val(result_msg).css('color','#FD5353');
			                }
			            }
			        });
    			}
			}else{
    			go_id_verify();
    		}
    	}else{
    		go_login();
    	}
    }

    // 投资
    function f_pay(){
        invest_money = $('.user_invest_money').val();
        var pay_password = $('#password').val();
        if (check_pwd()){
            var b = new Base64();
            var sign = "id="+id
                +"&is_kdb_pay="+is_kdb_pay
                +"&money="+invest_money
                +"&order_id="+order_id
                +"&pay_password="+pay_password
                +"&voucher_id="+voucher_id
                +"**kdlc**";
            sign = b.encode(sign);
            var url = "https://deposit.koudailc.com/project/invest-v2?clientType=pc";
            $.ajax({
                url : url,
                type : 'POST',
                data : {
                    id : id,
                    is_kdb_pay : is_kdb_pay,
                    money : invest_money,
                    voucher_id : voucher_id,
                    pay_password : pay_password,
                    order_id : order_id,
                    sign: sign
                },
                dataType : 'jsonp',
                jsonp : 'callback',
                success:function(data){
                    if (data.code == 0){
                        var params = "?project=" + "新手宝-信17IQW1期" + "&money=" + invest_money;
                        window.location.href = "/prompt/buy-success"+params;
                    }else{
                        alert(data.message);
                    }
                }
            });
        }
    }

    // 检查密码
    function check_pwd(){
        var password_reg = /^[0-9]{6}$/;
        if (!password_reg.test($('#password').val())){
            $('#notifications').html('请输入6位交易密码');
            return false;
        }
        return true
    }

    //获取项目投资记录
    function getInvestList(page){
        var url2 = "https://deposit.koudailc.com/project/invest-list?clientType=pc";
        var html2 ='';
        $.ajax({
            url: url2,
            type: 'GET',
            dataType: 'jsonp',
            jsonp: 'callback',
            data: {
            	id:id,
            	page:page,
            	pageSize:pageSize
            },
            success:function(data){
                if( data.code == 0){
                    if (data.invests.length < 1){
                        html2 = '<tr><td>暂无数据</td></tr>';
                    }else{
                        $.each(data.invests,function(index,value){
                            html2 +='<tr>';
                            html2 +='<td width="40%">'+getLocalTime(value.created_at)+'</td>';
                            html2 +='<td width="20%">'+value.username+'</td>';
                            html2 +='<td width="20%">'+'￥'+value.invest_money / 100+'</td>';
                            html2 +='<td width="20%">'+value.statusLabel+'</td>';
                            html2 +='</tr>';
                        });
                    }
                    $('.table-detail table tbody').html(html2);
                    var ajaxpage ="/page/ajaxpages";
                    $.ajax({
                        url :ajaxpage,
                        type: 'POST',
                        dataType: 'json',
                        data: {
                        	pages:data.pages.totalCount,
                        	cur:page,
                        	pageSize:pageSize,
                        	methodName:'getInvestList',
                        	hiddenNumber:'0',
                            display : 1
                        },
                        success:function(data){
                            $('.page_ul').html(data);
                        }
                    });
                }else{
                    $('.table-detail table tbody').html('<tr><td>数据加载失败...</td></tr>');
                }
            }
        });
    }

    // 时间戳转化为时间格式
    function getLocalTime(nS) {
    	var date=new Date(parseInt(nS)*1000);
    	var y=date.getFullYear();
    	var m=date.getMonth()+1;
    	var d=date.getDate();
    	var h=date.getHours();
    	var min=date.getMinutes();
    	var s=date.getSeconds();
    	if (h < 10) {
            h = '0' + h;
        }
        if (min < 10) {
            min = '0' + min;
        }
        if (s < 10) {
            s = '0' + s;
        }
       return y+'年'+m+'月'+d+'日&nbsp;'+h+':'+min+':'+s;
    }
        