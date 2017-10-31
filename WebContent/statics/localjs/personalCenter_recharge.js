//var url = "https://deposit.koudailc.com/user/charge-list?clientType=pc";
var page = 1;
var pageSize = 10;

$(document).ready(function() {
	getChargeLog();

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

function selectBank(bank_code, third_platform) {
	// $('#notification').html($bank_code);
	//alert("bank_code>>"+bank_code+" >> third_platform >>"+third_platform);
	$('#bank_code').val(bank_code);
	$('#third_platform').val(third_platform);
	$('.icon-bank-selected').removeClass("icon-bank-selected").addClass(
			"icon-bank");
	$('#' + bank_code.toString()).addClass("icon-bank-selected");
}

function getChargeLog() {
	var data = {
		page : page,
		pageSize : pageSize
	};
	//AjaxJsonP(callback, url, data, 'GET');
}
/*function callback(data) {
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
						+ (value.statusLabel ? value.statusLabel : '----')
						+ '</td>';
				html += '</tr>';
			});
			page++;
		} else {
			html = '<tr><td></td><td class="a_center f_14_16 b5b5b5">暂无数据</td><td></td></tr>';
			$('#div_foot').hide();
		}

		$('#div_log').append(html);
	}
}*/

function userCharge() {
	$('#notification').html("&nbsp;");
	var bankName = $('#bank_code').val(); //银行名称
	var pay_amount = $('#pay_amount').val();  //充值金额
	
	if ( $.trim(bankName) == "") {
		$('#notification').html('请选择银行');
		return;
	}

	if ($.trim(pay_amount) == "") {
		$('#notification').html('请输入金额');
		return;
	}

	//alertPromt();
	//$("#user_charge_form").submit();
	$.ajax({
		url:"doRecharge",
		type:"POST",
		dataType:"json",
		data:{"pay_amount":pay_amount,"bankName":bankName},
		success:function(data){
			if(data){
				alert("充值成功！");
				location.href="jumpToMyInvest.html";
			}else{
				$('#notification').html("充值失败！");
			}
		}
	});
}

function yingtongCharge(order_char_id) {
	$("#order_char_id").val(order_char_id);
	$("#user_charge_form").submit();
}
// https://yintong.com.cn/payment/bankgateway.htm

function bankLimit() {
	var urllimit = 'https://www.koudailc.com/account/limit';
	var datalimit = {
		'bank_code' : $('#bank_code').val()
	};
	//AjaxJsonP(calllimit, urllimit, datalimit);
}
/*function calllimit(data) {
	// alert(data.responseText);
	$('#recharge_limit p').html(data.responseText);
}*/

function alertPromt() {

	showBg("recharge_prompt");

};
function closeConfirm() {
	// 关闭遮罩
	closeBg("recharge_prompt");

};
