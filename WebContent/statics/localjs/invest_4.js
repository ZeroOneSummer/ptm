//大额充值扫一扫-口袋理财
$(document).ready(function(){

	function check_state() {
		$.getJSON('https://deposit.koudailc.com/charge/charge-qr-code-state?clientType=pc&jsoncallback=?', function(result) {

			if(result.state == 1) {//等待扫码
				//console.log('等待扫描');
			}
			else {//刷新二维码
				if(result.state == 2) {//登录成功
					window.location.href='/account/recharge?t=vip';
				}
				else {//二维码失效
					window.location.reload();
				}
			}
		});
	}
	
	setInterval(check_state, 6000);
});
