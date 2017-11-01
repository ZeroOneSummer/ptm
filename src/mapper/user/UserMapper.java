package mapper.user;


import pojo.User;

public interface UserMapper {

	/**
	 * 查找用户
	 * @param user 根据用户名，登录密码（可选参数）
	 * @return
	 * @throws Exception
	 */
	public User getUser(User user) throws Exception;


	/**
	 *添加用户
	 * @param user （登录名，登录密码，用户类别）
	 * @return
	 * @throws Exception
	 */
	public int  addUser(User user) throws Exception;


	/**
	 * 修改登录密码
	 * @param user
	 * @return
	 */
	public int updatePassword(User user) throws Exception;
	
	/**
	 * 修改交易密码
	 * @param user
	 * @return
	 */
	public int updateExchangePassword(User user) throws Exception;


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
