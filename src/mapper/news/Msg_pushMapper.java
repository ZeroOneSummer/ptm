package mapper.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Msg_push;


	public interface Msg_pushMapper {
		//信息推送
		public List<Msg_push> getMsgList(
				@Param(value="from")Integer currentPageNo,
				@Param(value="pageSize")Integer pageSize)throws Exception;
		
		public int count()throws Exception;

}
