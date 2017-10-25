package pojo;

/**
 * 绑定银行类别实体类
 * @author Administrator
 *
 */
public class Bank_Type {

	private int bankCode;//银行编码（编号）
	private String bankName;//银行名称
	public int getBankCode() {
		return bankCode;
	}
	public void setBankCode(int bankCode) {
		this.bankCode = bankCode;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
}
