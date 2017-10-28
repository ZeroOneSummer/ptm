package mapper.msg_push;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Msg_push;

/**
 * 消息推送Mapper接口
 * 
 * @author Administrator
 *
 */
public interface Msg_pushMapper {

	/**
	 * 动态查询获取消息推送集合
	 * 
	 * @return
	 * @throws Exception
	 */
	/**
	 * 
	 * 
	 * @param msg_push 可以存储msgType
	 * @param currentPageNo 起始下标位置
	 * @param pageSize 查询页面数量
	 * @return
	 * @throws Exception
	 */
	public List<Msg_push> getMsg_pushList(@Param(value="msgType")int msgType,
			@Param(value="from")int currentPageNo,
			@Param(value="pageSize")int pageSize) throws Exception;
}
