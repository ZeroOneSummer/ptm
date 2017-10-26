package service.backend;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Msg_push;

public interface Msg_pushMapperService {
	
	public List<Msg_push> getMsgList(
			@Param(value="from")Integer currentPageNo,
			@Param(value="pageSize")Integer pageSize)throws Exception;
	
	public int count()throws Exception;

}
