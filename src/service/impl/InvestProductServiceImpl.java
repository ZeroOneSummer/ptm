package service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import mapper.investproduct.InvestProductMapper;
import pojo.Invest_product;
import pojo.Invest_type;
import pojo.view.Invest_msg;
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

	/**
	 * 分页获取投资产品列表
	 */
	@Override
	public List<Invest_product> getInvest_productsByPage(int start, int size) {
		return investProductMapper.getInvest_productsByPage(start, size);
	}

	/**
	 * 投资产品总记录数
	 */
	@Override
	public int countInvest_product() {
		return investProductMapper.countInvest_product();
	}

	/**
	 * 投资产品可投金额、可投状态等更新
	 */
	@Override
	public int updateInvest_product(Invest_product invest_product) {
		return investProductMapper.updateInvest_product(invest_product);
	}

	/**
	 * 个人中心-交易记录
	 */
	@Override
	public List<Invest_msg> getInvest_msgList(int invTypeId, int start, int size) {
		return investProductMapper.getInvest_msgList(invTypeId, start, size);
	}

	/**
	 * 个人中心-统计交易记录条数
	 */
	@Override
	public int countInvest_msg(int invTypeId) {
		return investProductMapper.countInvest_msg(invTypeId);
	}
	
	@Override
	public boolean deleteInvest_productById(Integer delId) throws Exception {
		
		boolean flag = false;
		if(investProductMapper.deleteInvest_productById(delId) > 0){
			flag = true;
		}
		return flag;
	}

}
