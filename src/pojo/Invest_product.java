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
	private int investor;//投资人数
	private double totalAmount;//本期可投总金额
	private double residueAmount;//剩余可投金额
	private int invStatus;//产品投资状态(1:未发布2:可投3:已投满)
	private Invest_type invest_type;//1对1关联
	
	public Invest_type getInvest_type() {
		return invest_type;
	}
	public void setInvest_type(Invest_type invest_type) {
		this.invest_type = invest_type;
	}
	
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
