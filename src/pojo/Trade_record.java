package pojo;

import java.util.Date;
/**
 * 个人交易记录实体类
 * @author Administrator
 *
 */
public class Trade_record {
	
	private int id;//主键
	private int userId;//用户ID
	private int produceId;//产品ID
	private double tradeMoney;//交易金额
	private Date tradeDate;//交易日期
	private int tradeStatus;//交易状态(1:未完成2:已完成)
	private int tradeTypeId;//交易类别ID
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
	public int getProduceId() {
		return produceId;
	}
	public void setProduceId(int produceId) {
		this.produceId = produceId;
	}
	public double getTradeMoney() {
		return tradeMoney;
	}
	public void setTradeMoney(double tradeMoney) {
		this.tradeMoney = tradeMoney;
	}
	public Date getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}
	public int getTradeStatus() {
		return tradeStatus;
	}
	public void setTradeStatus(int tradeStatus) {
		this.tradeStatus = tradeStatus;
	}
	public int getTradeTypeId() {
		return tradeTypeId;
	}
	public void setTradeTypeId(int tradeTypeId) {
		this.tradeTypeId = tradeTypeId;
	}
	
	
}
