function setpwd(){
	var id=$("#userId").val();
	var password=$("#password").val();
	var repassword=$("#repassword").val();
	if ('' == $.trim(password)){
        $('#notification').html("密码不能为空");
    }else if (!reglx_pwd(repassword)){
        $('#notification').html('交易密码为6位数字');
    }else if (repassword != password){
        $('#notification').html('两次输入密码不一致'); 
    }else{
    	$.ajax({

    		url:"updateExchangePassword.html",
    		dateType:"json",
    		type:"post",
    		data:{"password":password,"id":id},
    		success:function(data){
    			if(data == 1){
    				location.href="account.html?id="+id;
    			}else{
    				 $('#notification').html('设置失败！');
    			}
    		}
    	})
    }
	
}