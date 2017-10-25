package mapper.user;

import pojo.User;

public interface UserMapper {
	
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public User getUser(User user);
	

	/**
	 * 修改登录密码
	 * @param user
	 * @return
	 */
	public int updatePassword(User user);
	
	/**
	 * 修改交易密码
	 * @param user
	 * @return
	 */
	public int updateExchangePassword(User user);

	public int addUser(User user);
	
}
