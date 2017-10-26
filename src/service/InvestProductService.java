package service;

import java.util.List;

import pojo.Invest_product;
import pojo.Invest_type;

public interface InvestProductService {
	
	public List<Invest_type> geInvest_types();
	
	public List<Invest_product> getInvest_products(Invest_product invest_product);
	
}
