package service.backend;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.news.Msg_pushMapper;
import pojo.Msg_push;

@Service
public class Msg_pushMapperServiceImpl implements Msg_pushMapperService{
	
	@Resource
	private Msg_pushMapper msg;
	
	@Override
	public List<Msg_push> getMsgList(Integer currentPageNo, Integer pageSize) throws Exception {
		
		return msg.getMsgList((currentPageNo-1)*pageSize, pageSize);
	}

	@Override
	public int count() throws Exception {
		
		return msg.count();
	}

}
