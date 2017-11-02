
var currentPageNo = 0;

$(document).ready(function() {
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

function getChargeList() {
	currentPageNo += 5;
	//alert("currentPageNo>>"+currentPageNo);
	location.href="jumpToRecharge.html?currentPageNo="+currentPageNo;
}

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

/*function yingtongCharge(order_char_id) {
	$("#order_char_id").val(order_char_id);
	$("#user_charge_form").submit();
}
*/


function alertPromt() {

	showBg("recharge_prompt");

};
function closeConfirm() {
	// 关闭遮罩
	closeBg("recharge_prompt");

};
