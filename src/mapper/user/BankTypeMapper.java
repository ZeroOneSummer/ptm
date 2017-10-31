package mapper.user;

import pojo.Bank_Type;

/**
 * 获取用户的银行信息
 * 
 * @author Administrator
 *
 */
public interface BankTypeMapper {

	/**
	 * 获取当前用户绑定银行卡的名称
	 * @param bank_Type 通过session传递当前用户,查询该用户的银行卡信息
	 * @return
	 * @throws Exception
	 */
	public Bank_Type getUserBankNameByUserId(Bank_Type bank_Type)throws Exception;
}
