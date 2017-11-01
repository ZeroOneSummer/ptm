package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Invest_product;
import pojo.Invest_type;

public interface InvestProductService {
	
	public List<Invest_type> geInvest_types();
	
	public List<Invest_product> getInvest_products(Invest_product invest_product);
	
	public int countInvest_product();
	
	public List<Invest_product> getInvest_productsByPage(int start,int size);
	
	public int updateInvest_product(Invest_product invest_product);
	//删除(后台功能)
	public boolean deleteInvest_productById(@Param(value="id")Integer delId)throws Exception;
	
}
