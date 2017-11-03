package job;

import java.util.Date;

import javax.annotation.Resource;

import pojo.Info_statis;
import service.backend.Info_statisService;

/**
 * 任务调度--平台月统计数据
 * @author Administrator
 *
 */
public class Month_statis {
	
	@Resource
	private Info_statisService info_statisService;
	
	public void addStatis(){
		//由于统计复杂，这里封装模拟数据
		Info_statis info_statis=new Info_statis();
		info_statis.setMonthStatis(new Date());//月统计时间
		info_statis.setTotalAmount(666666666.0);//当月交易金额
		info_statis.setTotalIncome(88888888888.0);//累计交易金额
		info_statis.setTradeAmount(6666666);//用户总数
		info_statis.setUserAmount(88888888);//累计收益额
		
		int num = info_statisService.addInfo_statis(info_statis);	
		if (num > 0) {
			System.out.println("任务调度，添加数据OK");
		} else {
			System.out.println("任务调度，添加数据失败");
		}
	}
}
