package service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import mapper.investproduct.InvestProductMapper;
import mapper.trade.TradeMapper;
import mapper.user.UserPropertyMapper;
import pojo.Invest_product;
import pojo.Invest_type;
import pojo.Trade_record;
import pojo.User_property;
import pojo.view.Invest_msg;
import service.InvestProductService;
@Service
public class InvestProductServiceImpl implements InvestProductService {
	
	@Resource
	private InvestProductMapper investProductMapper;
	
	@Resource
	private UserPropertyMapper userPropertyMapper;
	
	@Resource
	private TradeMapper tradeMapper;
	
	
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
	public int updateInvest_product(Invest_product invest_product) throws Exception{
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

	@Override
	public int modifyInvest_product(Invest_product invest_product) throws Exception {
		
		return investProductMapper.modifyInvest_product(invest_product);
	}

	@Override
	public int addInvest_product(Invest_product invest_product) throws Exception {
		
		return investProductMapper.addInvest_product(invest_product);
	}

	@Override
	public int updateInvStatus(Integer invStatus, Integer id) throws Exception {
		
		return investProductMapper.updateInvStatus(invStatus, id);
	}

	@Override
	public Invest_product getInvest_productById(Integer id) throws Exception {
		
		return investProductMapper.getInvest_productById(id);
	}

	
	/**
	 * //1.更新个人资产表user_property //2.更新投资产品表invest_product //3.更新交易记录表trade_record
	 * 事物控制
	 * @throws Exception 
	 */
	public boolean updateInvestData(Trade_record trade_record) throws Exception{
		
		boolean flag=false;//默认交易失败			
		//1.更新个人资产表user_property
		User_property user_property=userPropertyMapper.getUserProperty(trade_record.getUserId());//查询个人资产
		user_property.setBalance(user_property.getBalance() - trade_record.getTradeMoney());//余额-=交易金额
		user_property.setInvProperty(user_property.getInvProperty() + trade_record.getTradeMoney());//投资资产+=交易金额
		int num=userPropertyMapper.doInvest(user_property);//更新个人资产表
		if (num>0) {
			//2.更新投资产品表invest_product
			Invest_product invest_product=new Invest_product();
			invest_product.setId(trade_record.getProduceId());
			List<Invest_product> list=investProductMapper.getInvest_products(invest_product);//查询该产品信息
			double newResidueAmount=list.get(0).getResidueAmount() - trade_record.getTradeMoney();
			if (newResidueAmount<0) {
				throw new Exception("产品不够投了");//抛异常
			}else if (newResidueAmount == 0) {
				System.out.println("产品刚好投满");
				invest_product.setInvStatus(3);//投资状态3--投满
				invest_product.setResidueAmount(newResidueAmount);//可投金额-=交易金额 	
				int num2=investProductMapper.updateInvest_product(invest_product);//更新投资产品表
				if (num2>0) {
					//3.更新交易记录表trade_record
					int num3=tradeMapper.addTradeRecord(trade_record);//更新交易记录表
					if (num3>0) {
						flag=true;//所有信息添加成功后，返回交易成功
					}
				}
			}else{
				invest_product.setResidueAmount(newResidueAmount);//可投金额-=交易金额 	
				int num2=investProductMapper.updateInvest_product(invest_product);//更新投资产品表
				if (num2>0) {
					//3.更新交易记录表trade_record
					int num3=tradeMapper.addTradeRecord(trade_record);//更新交易记录表
					if (num3>0) {
						flag=true;//所有信息添加成功后，返回交易成功
					}
				}
			}							
		}
		return flag;
	}

	@Override
	public List<Invest_product> getInvest_productListByInvTypeId(int invTypeId) throws Exception {

		return investProductMapper.getInvest_productListByInvTypeId(invTypeId);
	}

}
