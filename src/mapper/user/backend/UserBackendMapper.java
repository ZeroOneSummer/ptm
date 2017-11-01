package mapper.user.backend;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.User;

public interface UserBackendMapper {
	
	/**
	 * 用户列表
	 * @param currentPageNo
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<User> getUserList(
		@Param(value="from")Integer currentPageNo,
		@Param(value="pageSize")Integer pageSize)throws Exception;
	/**
	 * 总记录数		
	 * @return
	 * @throws Exception
	 */
	 public int count()throws Exception;


}
