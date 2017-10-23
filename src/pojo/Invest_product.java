package pojo;
/**
 * 投资产品信息实体类
 * @author Administrator
 *
 */
public class Invest_product {

	private int id;//主键
	private String produceName;//产品名称
	private int invTypeId;//产品类别
	private double annualYield;//年华收益率
	private double purchaseMoney;//起购金额
	private int deadline;//投资期限（天）
	private int investor;//投资人数
	private double totalAmount;//本期可投总金额
	private double residueAmount;//剩余可投金额
	private int invStatus;//产品投资状态(1:未发布2:可投3:已投满)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	public double getAnnualYield() {
		return annualYield;
	}
	public void setAnnualYield(double annualYield) {
		this.annualYield = annualYield;
	}
	public double getPurchaseMoney() {
		return purchaseMoney;
	}
	public void setPurchaseMoney(double purchaseMoney) {
		this.purchaseMoney = purchaseMoney;
	}
	public int getDeadline() {
		return deadline;
	}
	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}
	public int getInvestor() {
		return investor;
	}
	public void setInvestor(int investor) {
		this.investor = investor;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public double getResidueAmount() {
		return residueAmount;
	}
	public void setResidueAmount(double residueAmount) {
		this.residueAmount = residueAmount;
	}
	public int getInvStatus() {
		return invStatus;
	}
	public void setInvStatus(int invStatus) {
		this.invStatus = invStatus;
	}
    
	
    
}
