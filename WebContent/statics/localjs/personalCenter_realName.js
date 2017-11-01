function idNumber(){
	var userName=$("#username").val();
	var idNumber=$("#idcard").val();
	var id=$("#userId").val();
	if(userName.length == 0 ){
		 $('#notification').html("请输入您的真实姓名");
	}else if(idNumber.length == 0 ){
		 $('#notification').html("请输入您的身份证号码");
	}else if(!idNumber.match(/^[0-9]{14,17}[0-9xX]$/) ){
		 $('#notification').html("请输入15或18位身份证号码");
	}else{
		$.ajax({
			url:"addIdNumber.html",
			type:"post",
			dateType:"json",
			data:{"id":id,"idNumber":idNumber,"userName":userName},
			success:function (data){
				if(data == 1){
					location.href="account.html?id="+id;
				}else{
					$('#notification').html("实名认证错误！");
				}
			}
		})
	}
}


