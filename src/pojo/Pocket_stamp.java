package pojo;
/**
 * 口袋券实体类
 * @author Administrator
 *
 */
public class Pocket_stamp {
	
	private int id;//主键
	private int pocketType;//类型（1:体验金券2:增长券）
	private double money;//金额
	private int deadline;//有效期（天）
	private int useStatus;//使用状态（1:未使用2:已使用3:已过期）
	private int changeValue;//兑换值
	private String range;//使用范围
	private int stock;//库存量
	private double rate;//增长率
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPocketType() {
		return pocketType;
	}
	public void setPocketType(int pocketType) {
		this.pocketType = pocketType;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public int getDeadline() {
		return deadline;
	}
	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}
	public int getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(int useStatus) {
		this.useStatus = useStatus;
	}
	public int getChangeValue() {
		return changeValue;
	}
	public void setChangeValue(int changeValue) {
		this.changeValue = changeValue;
	}
	public String getRange() {
		return range;
	}
	public void setRange(String range) {
		this.range = range;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	
	
}
