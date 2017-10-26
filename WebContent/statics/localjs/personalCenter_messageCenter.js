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
      }function alertConfirm(){ 
      	showBg("detail_invest_confirm");}
      function closeConfirm(){ 
      	closeBg("detail_invest_confirm");}
      
      var page = 1;
      var pageSize = 6;
      var msg_type = '';
      $(document).ready(function(){
          getNoticeList(page);
      });

      $("#msg_center_header > a").click(function(){
          msg_type = $(this).attr("msg_type");
          if(msg_type != undefined){
              $(this).addClass("btn_fd5353 fff");
              $("#msg_center_header > a").not( $(this) ).removeClass("btn_fd5353 fff");
              getNoticeList(page);
          }
      });

      function getNoticeList(page){
          var url2 = "https://deposit.koudailc.com/account/notice-list?clientType=pc&page="+page+"&pageSize="+pageSize+"&type="+msg_type;
          var html2 ='';
          var params =  {};
          KD.util.post(url2, params, function(result){
              if( result.code == 0){
                  html2 +='<table cellpadding=0 cellspacing=0>';
                  html2 +='<tr class="_666 f_14_16">';
                  html2 +='<td class="a_center">消息类型</td>';
                  html2 +='<td>消息内容</td>';
                  html2 +='<td class="a_center">接收时间</td>';
                  html2 +='</tr>';
                  if (result.data.length == 0) {
                      html2 +='<tr>';
                      html2 +='<td colspan=3 class="_666 f_14_16 a_center">暂无数据</td>';
                      html2 +='</tr>';
                      html2 +='</table>';
                      $('#notice_list').html(html2);
                      $('#notice_list_page').html('');
                      return false;
                  }
                  $.each(result.data,function(index,value){
                      html2 +='<tr class="_666 f_14_16">';
                      html2 +='<td  class="a_center">'+value.msg_type+'</td>';
                      html2 +='<td>'+value.remark+'</td>';
                      html2 +='<td class="a_center _999 f_14_16">'+value.created_date+'</td>';
                      html2 +='</tr>';
                  });
                  html2 +='</table>';
                  $('#notice_list').html(html2);

                  var url1 = "/page/ajaxpages";
                  $.ajax({
                      url: url1,
                      type: 'POST',
                      dataType: 'json',
                      data: {
                          pages: result.pages,
                          pageSize: pageSize,
                          cur:page,
                          methodName: 'getNoticeList'
                      },
                      success: function (data) {
                          $('#notice_list_page').html(data);
                      }
                  });
              }
          });
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