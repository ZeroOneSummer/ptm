function alertConfirm() {
	showBg("detail_invest_confirm");
}
function closeConfirm() {
	closeBg("detail_invest_confirm");
}

//-------------------分页展示数据-----------------------

function sendPage(frm,num,type){
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
	var type = $("#msgType").val();
	if(num != ""){				
		sendPage(frm,num,type);
	}		
}

function sendType(frm,type){
  $("#msgType").val(type);
  frm.submit();
}


