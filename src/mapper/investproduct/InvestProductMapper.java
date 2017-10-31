package mapper.investproduct;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import pojo.Invest_product;
import pojo.Invest_type;


public interface InvestProductMapper {
	
	public List<Invest_type> geInvest_types();
	
	public List<Invest_product> getInvest_products(Invest_product invest_product);
	
	public int countInvest_product();
		
	public List<Invest_product> getInvest_productsByPage(@Param("start")int start,@Param("size")int size);

	public int updateInvest_product(Invest_product invest_product);
}
