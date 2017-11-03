package service.backend;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.info_statis.Info_statisMapper;
import pojo.Info_statis;
@Service
public class Info_statisServiceImpl implements Info_statisService{


	@Resource
	private Info_statisMapper  info;
	
	@Override
	public List<Info_statis> getStatisList(Integer currentPageNo, Integer pageSize) throws Exception {
		
		return info.getStatisList((currentPageNo-1)*pageSize, pageSize);
	}

	@Override
	public int count() throws Exception {
		
		return info.count();
	}

	@Override
	public int addInfo_statis(Info_statis info_statis) {		
		return info.addInfo_statis(info_statis);
	}


}
