
function changepwd(){
	var id=$("#userId").val();
	var password=$('#password').val();
	var password_reg = /^[a-zA-Z0-9]{6,16}$/;
	var repassword=$('#repassword').val();
	
  if ('' == $.trim(password)){
      $('#notification').html("密码不能为空");
  }else if (!password_reg.test(password)){
      $('#notification').html('密码必须由6-16位数字和字母组成');
  }else if ( repassword!= password){
	  $('#notification').html('两次输入密码不一致'); 
  }else{
	  
	  $.ajax({
		   url:"updateLoginPassword.html",
		   data:{"password":password,"id":id},
		   type:"post",
		   dateType:"json",
		   success:function (data){
			   if(data == 1){
				   location.href="account.html?id="+id;
			   }else{
				   $('#notification').html('修改失败');
			   }
		   }
	   });
  }
}