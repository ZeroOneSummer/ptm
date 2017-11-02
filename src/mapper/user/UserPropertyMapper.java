
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
	 * 用户充值 | 提现
	 * @param userId 用户编号
	 * @param balance 变更余额
	 * @return
	 * @throws Exception
	 */
	public int doRechangeAndWithdrawDeposit(@Param("userId") int userId,@Param("balance") double money) throws Exception;

	/**
	 * 用户投资后个人资产更新
	 * @param user_property
	 * @return
	 */
	public int doInvest(User_property user_property) throws Exception;
}
