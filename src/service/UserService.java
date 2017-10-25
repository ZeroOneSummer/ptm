package service;

import pojo.User;

public interface UserService{
	
	public User getUser(User user)throws Exception;
	
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
	
}
