package mapper.user;

import org.apache.ibatis.annotations.Param;

import pojo.User;
import pojo.User_property;

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
	 * 用户充值
	 * @param userId 用户编号
	 * @param money 充值金额
	 * @return
	 * @throws Exception
	 */
	public int rechange(@Param("userId") int userId,@Param("money") int money) throws Exception;
}
