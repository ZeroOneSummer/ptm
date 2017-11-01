package pojo.view;

import java.util.Date;
/**
 * 视图实体类（三表联查：invest_product,invest_type,trade_record）
 * @author Administrator
 *
 */
public class Invest_msg {
	private String produceName;	
	private int invTypeId; 
	private double tradeMoney; 
	private Date tradeDate; 
	private int tradeStatus;
	
	public String getProduceName() {
		return produceName;
	}
	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}
	public int getInvTypeId() {
		return invTypeId;
	}
	public void setInvTypeId(int invTypeId) {
		this.invTypeId = invTypeId;
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
	
}
