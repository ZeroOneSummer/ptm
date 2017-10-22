 var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          hm.src = "https://hm.baidu.com/hm.js?6938787281b59cbc7fcb6a9381463695";
          var s = document.getElementsByTagName("script")[0];
          s.parentNode.insertBefore(hm, s);
        })();
        
 
        function withdraw(){
      	  var url = "https://deposit.koudailc.com/user/cards?clientType=pc";
      	  var params = {};
      	  KD.util.post(url, params, function(data){
              if (data.code == 0){
                  if (data.cards.length < 1){

                      alertConfirm();                
                      return false;
                  }
              }
              location.href = "https://www.koudailc.com/account/withdraw";
          });
      }
       function alertConfirm(){ 
      	 showBg("detail_invest_confirm");
     }
       function closeConfirm(){ 
      	 closeBg("detail_invest_confirm");
      	 }
       
       var redirect_url = '';
       function setpwd(){    
       $('#notification').html("");
       if (check_password() && check_repassword()){
           var ajaxurl = "https://deposit.koudailc.com/user/set-paypassword?clientType=pc";
           var params =  {
                   password : $('#password').val()
               };
           KD.util.post(ajaxurl, params, function(data){
               if (data.code == 0){
                   if(redirect_url){
                       window.location.href = redirect_url;
                   }else{
                       var regurl =  "https://www.koudailc.com/account/user-center";
                       window.location.href = regurl;
                   }
               }else{
                   $('#notification').html(data.message);
               }
           });
       }
       

   }

   function check_password(){
       if ('' == $.trim($('#password').val())){
           $('#notification').html("密码不能为空");
           return false;
       }
       if (!reglx_pwd($('#password').val())){
           $('#notification').html('交易密码为6位数字');
           return false;
       }
       return true;
   }
   function check_repassword(){
       if ($('#repassword').val() != $('#password').val()){
           $('#notification').html('两次输入密码不一致'); 
           return false;
       }
       return true;
   }
   
   $(document).ready(function(){
       // 底部相关 begin
       $('.site-info .logo').addClass("_hidden");
       $('.site-info .logo').parent("a").mouseover(function(){
           $(this).find("img").addClass("_hidden");
           $(this).find(".logo").removeClass("_hidden");
       });
       $('.site-info .logo').parent("a").mouseout(function(){
           $(this).find("img").addClass("_hidden");
           $(this).find(".logo_hover").removeClass("_hidden");
       });
       // 底部相关 end

       $('.download_app').mouseover(function() {
           $(this).css("background","url(https://www.koudailc.com/image/site/index/201611/app_download.png?ver=0622) no-repeat scroll left center");
           $(this).children('#download_qrcode').show();
       });
       $('.download_app').mouseout(function() {
           $(this).css("background","url(https://www.koudailc.com/image/site/index/201611/app_download.png?ver=0622) no-repeat scroll left center");
           $(this).children('#download_qrcode').hide();
       });
       $('.weixin_dyh').mouseover(function() {
           $(this).css("background","url(https://www.koudailc.com/image/site/main/weixin_hover.png) no-repeat scroll right center");
           $(this).children('#weixin_qrcode').show();
       });
       $('.weixin_dyh').mouseout(function() {
           $(this).css("background","url(https://www.koudailc.com/image/site/main/weixin.png) no-repeat scroll right center");
           $(this).children('#weixin_qrcode').hide();
       });
       $('.dropdown-nav').hover(function() {
           $(this).css('backgroundColor', '#fff');
           $(this).find('.dropdown').show();
       }, function() {
           $(this).css('backgroundColor', '#fff');
           $(this).find('.dropdown').hide();
       });

       $('.mobile,.wechat,.weibo,.qq').hover(function() {
           $(this).children('img').toggle();
       });
       $('.site-map ul').find('li:last').addClass('on');
       $('.topNav-left').find('a').click(function() {
           $(this).addClass('on').siblings('a').removeClass('on');
       });

       // 右侧导航
       $('.one,.two').hover(function() {
           $(this).children('div').toggle();
       });
       $(window).on('resize load scroll',function(){
           var winWidth = $(window).width();
           if (winWidth > 1328) {
               $('.nav-right').css('visibility', 'visible');
           } else {
               $('.nav-right').css('visibility', 'hidden');
           }
           if ($(window).scrollTop() > 192) {
               $('.gotop').show();
           } else {
               $('.gotop').hide();
           }
       });
       $('.gotop').click(function(e){
           e.stopPropagation();
           $('html,body').animate({
               scrollTop: 0
           }, 300);
       })
   });

   //退出登录
   function loginOut(){
       var url = "https://deposit.koudailc.com/user/logout?clientType=pc";
       var url_redirect = "https://www.koudailc.com/site/index";
       var params = {};
       KD.util.post(url, params, function(data){
           if (data.code == 0 && data.result == true){
               delCookie('SESSIONID');
               location = url_redirect;
           }
       });
   }
   if (/*@cc_on!@*/true) {
       document.documentElement.className += ' ie' + document.documentMode;
   }