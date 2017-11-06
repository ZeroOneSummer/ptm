package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Invest_product;
import pojo.Invest_type;
import pojo.Trade_record;
import pojo.view.Invest_msg;

public interface InvestProductService {
	
	public List<Invest_type> geInvest_types();
	
	public List<Invest_product> getInvest_products(Invest_product invest_product);
	
	public int countInvest_product();
	
	public List<Invest_product> getInvest_productsByPage(int start,int size);
	
	public int updateInvest_product(Invest_product invest_product) throws Exception;
	
	public List<Invest_msg> getInvest_msgList(int invTypeId,int start,int size);

	public int countInvest_msg(int invTypeId);
	
	public boolean updateInvestData(Trade_record trade_record) throws Exception;
	
	//删除(后台功能)
	public boolean deleteInvest_productById(Integer delId) throws Exception;
	//修改(后台功能)
	public int modifyInvest_product(Invest_product invest_product)throws Exception;
	//添加(后台功能)
	public int addInvest_product(Invest_product invest_product) throws Exception;
	//更新产品信息状态(后台功能)
	public int updateInvStatus(@Param(value="invStatus")Integer invStatus,@Param(value="id")Integer id)throws Exception;
	//根据Id查找具体产品(后台功能)
	public Invest_product getInvest_productById(@Param(value="id")Integer id) throws Exception;

	//根据产品类别获的产品集合 (后台功能)
		public List<Invest_product> getInvest_productListByInvTypeId(@Param("invTypeId")int invTypeId)throws Exception;
}
