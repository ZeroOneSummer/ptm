package pojo;

import java.util.Date;
/**
 * 个人收益实体类
 * @author Administrator
 *
 */
public class User_income {
	
	private int id;//主键
	private int userId;//用户ID
	private double dayAccount;//日收益金额
	private Date incomeDay;//时间(每天)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getDayAccount() {
		return dayAccount;
	}
	public void setDayAccount(double dayAccount) {
		this.dayAccount = dayAccount;
	}
	public Date getIncomeDay() {
		return incomeDay;
	}
	public void setIncomeDay(Date incomeDay) {
		this.incomeDay = incomeDay;
	}
	
	
}
