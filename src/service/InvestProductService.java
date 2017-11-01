package service;

import java.util.List;
import pojo.Invest_product;
import pojo.Invest_type;
import pojo.view.Invest_msg;

public interface InvestProductService {
	
	public List<Invest_type> geInvest_types();
	
	public List<Invest_product> getInvest_products(Invest_product invest_product);
	
	public int countInvest_product();
	
	public List<Invest_product> getInvest_productsByPage(int start,int size);
	
	public int updateInvest_product(Invest_product invest_product);
	
	public List<Invest_msg> getInvest_msgList(int invTypeId,int start,int size);

	public int countInvest_msg(int invTypeId);
	
	//删除(后台功能)
	public boolean deleteInvest_productById(Integer delId) throws Exception;

}
