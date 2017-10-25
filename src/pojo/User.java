package pojo;
/**
 * 用户注册信息实体类
 * @author Administrator
 *
 */
public class User {
	
	private int id;//主键（编号）
	private String loginName;//登陆名（手机号码）
	private String password;//登陆密码
	private String idNumber;//身份证号码
	private String bankNumber;//银行卡号
	private String bankName;//银行名称
	private String exchangePassword;//交易密码
	private String userName;//姓名
	private int userType;//用户类型(1:管理员 2：普通用户)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getBankNumber() {
		return bankNumber;
	}
	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getExchangePassword() {
		return exchangePassword;
	}
	public void setExchangePassword(String exchangePassword) {
		this.exchangePassword = exchangePassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	
	
}
