package pojo;
/**
 * 投资产品类别实体类
 * @author Administrator
 *
 */
public class Invest_type {

	private int id;//主键
	private String invTypeName;//类别名称
	private double annualYield;//年华收益率
	private double purchaseMoney;//起购金额
	private int deadline;//投资期限（天）
	
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInvTypeName() {
		return invTypeName;
	}
	public void setInvTypeName(String invTypeName) {
		this.invTypeName = invTypeName;
	}
	
	
	
}
