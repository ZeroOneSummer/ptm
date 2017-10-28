
package mapper.user;

import org.apache.ibatis.annotations.Param;

import pojo.User_property;

/**
 * 获取用户的资产信息
 * 
 * @author Administrator
 *
 */
public interface UserPropertyMapper {

	/**
	 * 根据userId 获取用户财富
	 * @param userId 从session中传递获取userId
	 * @return
	 * @throws Exception
	 */
	public User_property getUserProperty(@Param("userId")int userId) throws Exception;
	

	/**
	 * 用户充值
	 * @param userId 用户编号
	 * @param balance 充值金额
	 * @return
	 * @throws Exception
	 */
	public int rechange(@Param("userId") int userId,@Param("balance") double money) throws Exception;
	
	/**
	 * 用户提现
	 * @param userId 用户编号
	 * @param balance 提现后用户的余额
	 * @return
	 * @throws Exception
	 */
	public int withdrawDeposit(@Param("userId") int userId,@Param("balance") double balance,@Param("withdrawMoney") double withdrawMoney) throws Exception;
	
	/**
	 * 用户投资后个人资产更新
	 * @param user_property
	 * @return
	 */
	public int doInvest(User_property user_property);
}
