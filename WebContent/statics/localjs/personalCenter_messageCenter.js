/*var _hmt = _hmt || [];
(function() {
	var hm = document.createElement("script");
	hm.src = "https://hm.baidu.com/hm.js?6938787281b59cbc7fcb6a9381463695";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);
})();*/

/*function withdraw() {
	var url = "https://deposit.koudailc.com/user/cards?clientType=pc";
	var params = {};
	KD.util.post(url, params, function(data) {
		if (data.code == 0) {
			if (data.cards.length < 1) {

				alertConfirm();
				return false;
			}
		}
		location.href = "https://www.koudailc.com/account/withdraw";
	});
}*/
function alertConfirm() {
	showBg("detail_invest_confirm");
}
function closeConfirm() {
	closeBg("detail_invest_confirm");
}

var page = 1;
var pageSize = 6;
var msg_type = '';
$(document).ready(function() {
	getNoticeList(page);
});

$("#msg_center_header > a").click(function() {
	msg_type = $(this).attr("msg_type");
	if (msg_type != undefined) {
		$(this).addClass("btn_fd5353 fff");
		$("#msg_center_header > a").not($(this)).removeClass("btn_fd5353 fff");
		getNoticeList(page);
	}
});

//-------------------分页展示数据-----------------------

function sendPage(frm,num){
	var totalPageCount=$("#totalPageCount").val();
	if(num<1){
		num=1;
	}else if(num>totalPageCount){
		num=totalPageCount;
	}
	frm.currentPageNo.value=num;
	frm.submit();
}

function dumpPage(frm){
	var num=$("#dumpPage").val();//跳转页码	
	/*alert(num != "");*/
	if(num != ""){				
		sendPage(frm,num);
	}		
}

/*function getNoticeList(page) {
	var url2 = "https://deposit.koudailc.com/account/notice-list?clientType=pc&page="
			+ page + "&pageSize=" + pageSize + "&type=" + msg_type;
	var html2 = '';
	var params = {};
	KD.util
			.post(
					url2,
					params,
					function(result) {
						if (result.code == 0) {
							html2 += '<table cellpadding=0 cellspacing=0>';
							html2 += '<tr class="_666 f_14_16">';
							html2 += '<td class="a_center">消息类型</td>';
							html2 += '<td>消息内容</td>';
							html2 += '<td class="a_center">接收时间</td>';
							html2 += '</tr>';
							if (result.data.length == 0) {
								html2 += '<tr>';
								html2 += '<td colspan=3 class="_666 f_14_16 a_center">暂无数据</td>';
								html2 += '</tr>';
								html2 += '</table>';
								$('#notice_list').html(html2);
								$('#notice_list_page').html('');
								return false;
							}
							$.each(result.data, function(index, value) {
								html2 += '<tr class="_666 f_14_16">';
								html2 += '<td  class="a_center">'
										+ value.msg_type + '</td>';
								html2 += '<td>' + value.remark + '</td>';
								html2 += '<td class="a_center _999 f_14_16">'
										+ value.created_date + '</td>';
								html2 += '</tr>';
							});
							html2 += '</table>';
							$('#notice_list').html(html2);

							var url1 = "/page/ajaxpages";
							$.ajax({
								url : url1,
								type : 'POST',
								dataType : 'json',
								data : {
									pages : result.pages,
									pageSize : pageSize,
									cur : page,
									methodName : 'getNoticeList'
								},
								success : function(data) {
									$('#notice_list_page').html(data);
								}
							});  //end $.ajax
						}
					});
}*/
