package pojo;

import java.util.Date;
/**
 * 信息统计实体类
 * @author Administrator
 *
 */
public class Info_statis {
	private int id;//主键
	private Date monthStatis;//月统计时间（每月最后一天）
	private double tradeAmount;//当月交易金额
	private double totalAmount;//累计交易金额
	private int userAmount;//用户总数
	private double totalIncome;//累计收益额
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getMonthStatis() {
		return monthStatis;
	}
	public void setMonthStatis(Date monthStatis) {
		this.monthStatis = monthStatis;
	}
	public double getTradeAmount() {
		return tradeAmount;
	}
	public void setTradeAmount(double tradeAmount) {
		this.tradeAmount = tradeAmount;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public int getUserAmount() {
		return userAmount;
	}
	public void setUserAmount(int userAmount) {
		this.userAmount = userAmount;
	}
	public double getTotalIncome() {
		return totalIncome;
	}
	public void setTotalIncome(double totalIncome) {
		this.totalIncome = totalIncome;
	}
	
	
}
