package mapper.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Msg_push;

public interface Msg_pushMapper {

	/**
	 * 消息推送集合
	 * 
	 * @param userId 用户编号
	 * @param msgType 消息类型
	 * @param currentPageNo 起始位置
	 * @param pageSize 页面大小
	 * @return
	 * @throws Exception
	 */
	public List<Msg_push> getMsgList(@Param(value = "userId") Integer userId,@Param(value = "msgType") Integer msgType,
			@Param(value = "from") Integer currentPageNo, @Param(value = "pageSize") Integer pageSize) throws Exception;

	/**
	 * 统计消息推送总记录数
	 * 封装数据有：msgType、userId
	 * 
	 * @param msg_push
	 * @return
	 * @throws Exception
	 */
	public int count(Msg_push msg_push) throws Exception;

	/**
	 * 添加消息 封装数据有：msgType、content、releaseDate、title
	 * 
	 * @param msg_push
	 * @return
	 * @throws Exception
	 */
	public int addMsg_push(Msg_push msg_push) throws Exception;
	
	/**
	 * 获取具体消息 封装数据有：id
	 * 
	 * @param msg_push
	 * @return msg_push
	 * @throws Exception
	 */
	public Msg_push getMsg_pushById(Msg_push msg_push) throws Exception;
}
