package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.investproduct.InvestProductMapper;
import pojo.Invest_type;
import service.InvestProductService;
@Service
public class InvestProductServiceImpl implements InvestProductService {
	
	@Resource
	private InvestProductMapper investProductMapper;
	
	@Override
	public List<Invest_type> geInvest_types() {
		return investProductMapper.geInvest_types();
	}

}
