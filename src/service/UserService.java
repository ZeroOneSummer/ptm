package service;

import org.apache.ibatis.annotations.Param;
import pojo.Msg_push;
import pojo.Trade_record;
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
	 * 用户充值 / 提现方法
	 * @param user_property 用户编号/充值金额
	 * @param msg_push 用户编号/消息类型/创建时间/消息标题/消息内容
	 * @param trade_record 交易金额/交易时间/用户编号/交易类别
	 * @return
	 * @throws Exception
	 */
	public int addRechangeAndWithdrawDeposit(User_property user_property,Msg_push msg_push,Trade_record trade_record) throws Exception;
	
	
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
	public int doInvest(User_property user_property) throws Exception;
	
	
	/**
	 * 实名认证
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int addIdNumber(User user) throws Exception;
	
	

	/**
	 * 绑定银行卡
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int addBackNumber(User user)throws Exception;
	
}
