package service.backend;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.Invest_type.Invest_typeMapper;
import pojo.Invest_type;
@Service
public class Invest_typeServiceImpl implements Invest_typeService{

	
	@Resource
	@Autowired
	private Invest_typeMapper  infoMapper;

	@Override
	public List<Invest_type> getInvest_typeList(Integer currentPageNo, Integer pageSize) throws Exception {
		
		return infoMapper.getInvest_typeList((currentPageNo-1)*pageSize, pageSize);
	}

	@Override
	public int count() throws Exception {
		
		return infoMapper.count();
	}

	@Override
	public boolean deleteInvest_typeById(Integer delId) throws Exception {
		boolean flags = false;
		if(infoMapper.deleteInvest_typeById(delId) > 0){
			flags = true;
		}
		return flags;
	}

	@Override
	public int modifyInvest_type(Invest_type invest_type) throws Exception {
		
		return infoMapper.modifyInvest_type(invest_type);
	}

	@Override
	public int addInvest_type(Invest_type invest_type) throws Exception {
		
		return infoMapper.addInvest_type(invest_type);
	}

	@Override
	public Invest_type getInvest_typeById(Integer id) throws Exception {
		
		return infoMapper.getInvest_typeById(id);
	}

	
	
	
	

}
