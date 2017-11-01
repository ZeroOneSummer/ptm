package mapper.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Msg_push;


	public interface Msg_pushMapper {
		//信息推送
		public List<Msg_push> getMsgList(@Param(value="userId")Integer userId,
				@Param(value="msgType")Integer msgType,
				@Param(value="from")Integer currentPageNo,
				@Param(value="pageSize")Integer pageSize)throws Exception;
		
		public int count()throws Exception;
		
		//删除
		public int deleteMsg_pushById(@Param(value="id")Integer delId)throws Exception;
		//修改消息推送	
		public int modify(Msg_push msg_push)throws Exception;
		//添加消息推送
		public int addMsg_push(Msg_push msg_push) throws Exception;
		
}
