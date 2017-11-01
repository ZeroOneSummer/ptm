package pojo;
/**
 * 个人资产详情实体类
 * @author Administrator
 *
 */
public class User_property {
	
	private int id;//主键
	private int pocketId;//口袋券ID
	private int userId;//用户ID
	private double balance;//余额
	private int score;//积分
	private double withdrawMoney;//提现金额
	private double invProperty;//投资资产(持有资产)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPocketId() {
		return pocketId;
	}
	public void setPocketId(int pocketId) {
		this.pocketId = pocketId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public double getWithdrawMoney() {
		return withdrawMoney;
	}
	public void setWithdrawMoney(double withdrawMoney) {
		this.withdrawMoney = withdrawMoney;
	}
	public double getInvProperty() {
		return invProperty;
	}
	public void setInvProperty(double invProperty) {
		this.invProperty = invProperty;
	}
	
	
}
