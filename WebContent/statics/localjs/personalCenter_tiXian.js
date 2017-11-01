
var page = 1;
var pageSize = 10;
var bind_id = 0;
var pageIndex = 0;
$(document).ready(function() {
	checkInput();
	getAccountGet();
	getWithdrawLog();

	$("#shrinkage").click(function() {
		var Default = "${pageContext.request.contextPath }/statics/img/more.jpg";
		var Change = "${pageContext.request.contextPath }/statics/img/more1.jpg";
		if ($(this).find("img").attr("src") == Default) {
			$(this).find("img").attr("src", Change);
			$(this).parent().find("table").addClass("_hidden");
		} else {
			$(this).find("img").attr("src", Default);
			$(this).parent().find("table").removeClass("_hidden");
		}
	});
});

function callwithdraw(data) {
	if (data.code == 0) {
		location.href = "https://www.koudailc.com/prompt/general?type=success&t_type=%E6%8F%90%E7%8E%B0";
		$('#notification').html('操作成功');
	} else {
		$('#notification').html(data.message);
	}
	RestoreWithDraw();
}

function callWithdrawOrder(data) {
	if (data.code == 0) {
		var check = true;
		// 每月超过三次需付手续费
		if (parseInt(data.cur_month_times) >= parseInt(data.free_month_times)) {
			if (!confirm("您本月的免费提现机会已用完，需支付手续费2元，是否提现？")) {
				check = false;
			}
		}

		if (check) {
			var sign = "money=" + $('#pay_amount').val() + "&order_id="
					+ data.order_id + "&bind_id=" + bind_id + "&pay_password="
					+ $('#password').val() + "**kdlc**";
			var b = new Base64();
			sign = b.encode(sign);
			var w_data = {
				money : $('#pay_amount').val(),
				pay_password : $('#password').val(),
				order_id : data.order_id,
				bind_id : bind_id,
				sign : sign
			};
			//var url = "https://deposit.koudailc.com/account/withdraw?clientType=pc";
			//AjaxJsonP(callwithdraw, url, w_data);
		}
	} else {
		$('#notification').html('下单失败');
	}
	RestoreWithDraw();
}

function withdraw() {
	if (!$('#withdraw').hasClass("btn_eb4444")) {
			var exchangePassword = $("#exchangePassword").val(); //交易密码
			var pay_amount = $("#amount").val();  //提现金额
			if ($.trim(pay_amount) == "") {
				$('#notification').html('提取金额不能为空');
			}else if ($.trim(exchangePassword) == "") {
				$('#notification').html('交易密码不能为空');
			}else if (!reglx_pwd($('#exchangePassword').val())) {
				$('#notification').html('交易密码为6位数字');
			}else{
					EnableWithDraw();
					// 下单
					$.ajax({
						url:"doWithdrawDeposit",
						type:"POST",
						dataType:"json",
						data:{"exchangePassword":exchangePassword,"pay_amount":pay_amount},
						success:function(data){
							if(data){
								alert("提现成功！");
								RestoreWithDraw();
								location.href="jumpToMyInvest.html";
							}else{
								$('#notification').html("提现失败！");
							}
						}
					}); //end  $.ajax
			}
	}

}

function EnableWithDraw() {
	$('#withdraw').addClass("btn_eb4444");
	$('#withdraw').html('提取中');
}

function RestoreWithDraw() {
	$('#withdraw').removeClass("btn_eb4444");
	$('#withdraw').html('提取成功');
}

function checkInput() {
	var string_reg = /[^0-9.]/g;
	perg_str("money", string_reg);
}

function callback(data) {
	if (data.code == 0) {
		var html = '';
		if (data.data.length > 0) {
			$.each(data.data, function(index, value) {
				html += '<tr>';
				html += '<td class="a_center f_14_16 _333">'
						+ UnixToDate(value.created_at, true, false) + '</td>';
				html += '<td class="a_center f_14_16 _333">'
						+ safeConvertIntToCent(value.money) + '</td>';
				html += '<td class="a_center f_14_16 _333">'
						+ value.statusLabel + '</td>';
				html += '</tr>';
			});
			page++;
		} else {
			html = '<tr><td></td><td class="a_center f_14_16 b5b5b5">暂无数据</td><td></td></tr>';
			$('#div_foot').hide();
		}

		$('#div_log').append(html);
	}
}

/**
 * 获取提现记录
 */
function getWithdrawList() {
	//var url = "https://deposit.koudailc.com/account/withdraw-log?clientType=pc";
	pageIndex += 5;
	location.href="jumpToWithdrawDeposit.html?pageIndex="+pageIndex;
}

function AccountGet(data) {
	if (data.code == 0) {
		$('#usable_money').html(safeConvertIntToCent(data.usable_money));
		if (data.banks.length < 1) {
			alert('请先绑定银行卡');
			// 跳转绑定银行卡
			// location.href = '/account/user-center-bindcard';
		}
		bind_id = data.banks[0].bind_id;
		$('#bank').html(
				data.banks[0].bank_name + '  &nbsp;*'
						+ data.banks[0].tail_number);
	}
}

/**
 * 获取可用余额和银行卡列表
 */
function getAccountGet() {
	//var url = "https://deposit.koudailc.com/account/get?clientType=pc";
	//AjaxJsonP(AccountGet, url, '', 'GET');
}
