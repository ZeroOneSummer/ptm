
function back(){
	var id=$("#userId").val();
	var backNumber=$("#bank_card").val();
	
	if($.trim(backNumber) == ''){
		$("#notification").html("银行卡号不能为空！");
	}else{
		$.ajax({
			url:"addBackNumber.html",
			data:{"id":id,"backNumber":backNumber},
			dateType:"json",
			type:"post",
			success:function(data){
				if(data == 1){
					location.href="account.html?id="+id;
				}else{
					$('#notification').html('绑定失败！');
				}
			}
		});
	}
}
