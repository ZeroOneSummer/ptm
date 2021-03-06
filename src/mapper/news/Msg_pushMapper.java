package mapper.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Invest_product;
import pojo.Msg_push;
import pojo.News;

public interface Msg_pushMapper {
	
	public int count1() throws Exception;
	
	
	public List<Msg_push> getMsg_pushList(
					@Param(value="from")Integer currentPageNo,
					@Param(value="pageSize")Integer pageSize)throws Exception;
	//删除
	public int deleteMsg_pushById(@Param(value="id")Integer delId)throws Exception;
	//修改消息推送	
	public int modify(Msg_push msg_push)throws Exception;
	

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
