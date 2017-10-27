package mapper.user;

import org.apache.ibatis.annotations.Param;

import pojo.User;
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
}
