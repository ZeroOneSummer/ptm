package service;

import org.apache.ibatis.annotations.Param;

import pojo.User;
import pojo.User_property;

public interface UserService{

	/**
	 * 查找用户
	 * @param user 根据用户名，登录密码（可选参数）
	 * @return
	 * @throws Exception
	 */
	public User getUser(User user) throws Exception;
	
	/**
	 * 修改登录密码
	 * @param user
	 * @return
	 */
	public int updatePassword(User user)throws Exception;
	
	/**
	 * 修改交易密码
	 * @param user
	 * @return
	 */
	public int updateExchangePassword(User user)throws Exception;

	
	/**
	 *添加用户
	 * @param user （登录名，登录密码，用户类别）
	 * @return
	 * @throws Exception
	 */
	public int addUser(User user) throws Exception;
	
	/**
	 * 用户充值
	 * @param userId 用户编号
	 * @param money  充值金额
	 * @return
	 * @throws Exception
	 */
	public int rechange(@Param("userId") int userId,@Param("money") double money) throws Exception;
	
	/**
	 * 用户提现
	 * @param userId 用户编号
	 * @param balance 提现后用户的余额
	 * @return
	 * @throws Exception
	 */
	public int withdrawDeposit(@Param("userId") int userId,@Param("balance") double balance,@Param("withdrawMoney") double withdrawMoney) throws Exception;
	
	/**
	 * 根据用户id 获取用户财富
	 * @param userId 从session中传递userId
	 * @return
	 * @throws Exception
	 */
	public User_property getUserProperty(@Param("userId")int userId) throws Exception;
	
	/**
	 * 用户投资后个人资产更新
	 * @param user_property
	 * @return
	 */
	public int doInvest(User_property user_property);
	
}
