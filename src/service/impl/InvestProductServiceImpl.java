package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.investproduct.InvestProductMapper;
import pojo.Invest_product;
import pojo.Invest_type;
import service.InvestProductService;
@Service
public class InvestProductServiceImpl implements InvestProductService {
	
	@Resource
	private InvestProductMapper investProductMapper;
	
	/**
	 * 获取投资产品类型列表
	 */
	@Override
	public List<Invest_type> geInvest_types() {
		return investProductMapper.geInvest_types();
	}
	
	/**
	 * 获取投资产品列表
	 */
	@Override
	public List<Invest_product> getInvest_products(Invest_product invest_product) {
		return investProductMapper.getInvest_products(invest_product);
	}

}
