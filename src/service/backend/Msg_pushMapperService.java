package service.backend;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Msg_push;

public interface Msg_pushMapperService {
	
	public List<Msg_push> getMsgList(Integer userId,Integer msgType,Integer currentPageNo,Integer pageSize)throws Exception;
	
	public int count()throws Exception;
	
	//删除
	public boolean deleteMsg_pushById(Integer delId)throws Exception;
	//添加
	public int addMsg_push(Msg_push msg_push) throws Exception;
	//修改
	public int modify(Msg_push msg_push)throws Exception;
	
	
    	

}
