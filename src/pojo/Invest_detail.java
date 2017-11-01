package pojo;

import java.util.Date;
/**
 * 投资详情实体类
 * @author Administrator
 *
 */
public class Invest_detail {
	private int id;//主键
	private int produceId;//产品ID
	private int userId;//用户ID
	private Date tradeDate;//交易日期
	private double tradeMoney;//交易金额
	private int tradeStatus;//交易状态(1:已预约2:投资中3：已结束)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduceId() {
		return produceId;
	}
	public void setProduceId(int produceId) {
		this.produceId = produceId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(Date tradeDate) {
		this.tradeDate = tradeDate;
	}
	public double getTradeMoney() {
		return tradeMoney;
	}
	public void setTradeMoney(double tradeMoney) {
		this.tradeMoney = tradeMoney;
	}
	public int getTradeStatus() {
		return tradeStatus;
	}
	public void setTradeStatus(int tradeStatus) {
		this.tradeStatus = tradeStatus;
	}
	
	
}
