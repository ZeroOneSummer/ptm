package pojo;
/**
 * 交易类别实体类
 * @author Administrator
 *
 */
public class Trade_type {
	
	private int id;//主键
	private String tradeName;//交易名称(投资、提现等)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTradeName() {
		return tradeName;
	}
	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}
	
	
}
