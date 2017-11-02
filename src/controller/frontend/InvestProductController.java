package controller.frontend;


import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.Info_statis;
import pojo.Invest_product;
import pojo.Invest_type;
import pojo.Trade_record;
import pojo.User_property;
import service.InvestProductService;
import service.TradeService;
import service.UserService;
import service.backend.Info_statisService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class InvestProductController {
	
	@Resource
	private InvestProductService investProductService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private TradeService tradeService;
	
	@Resource
	private Info_statisService info_statisService;
	
	/**
	 * 首页展示产品类型列表
	 * @return
	 */
	@RequestMapping("/typeList")
	public String showInvestProductType(HttpServletRequest request,HttpServletResponse response,Model model){
		List<Invest_type> type_list=investProductService.geInvest_types();
		List<Info_statis> info=null;
		try {
			info = info_statisService.getStatisList(1, 1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (type_list == null || info == null) {
			System.out.println("获取投资产品类型表以及平台运营数据错误");
			try {
				request.getRequestDispatcher("500.jsp").forward(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		for (Info_statis info_statis : info) {
			System.out.println("当月交易金额>>"+info_statis.getTradeAmount()
					+"-总用户数>>"+info_statis.getUserAmount()
					+"-平台累计收益>>"+info_statis.getTotalIncome()
					+"-平台累计交易金额>>"+info_statis.getTotalAmount());
		}
		model.addAttribute("info_list", info);
		model.addAttribute(Constants.type_list, type_list);
		return "firstPage";
	}
	
	/**
	 * 投资产品详情列表页面
	 * @return
	 */
	@RequestMapping("/Invest_detail")
	public String investDetail(){
		
		return "frontend/invest/investList";
	}
	
	
	/**
	 * 投资产品详情页面
	 * @return
	 */
	@RequestMapping("/product")
	public String investProduct(Invest_product invest_product,HttpServletRequest request,HttpServletResponse response,Model model){
		System.out.println("into product控制器");
		System.out.println("product类型id---->"+invest_product.getInvTypeId());
		
		List<Invest_product> product_list=investProductService.getInvest_products(invest_product);
		if (product_list == null) {
			System.out.println("获取投资产品列表为null");
			try {
				request.getRequestDispatcher("500.jsp").forward(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} 
		//首页投资查该类型或按产品id只需要产品中的一个，而我要投资需查询所有产品
		if (invest_product.getInvTypeId() != 0 || invest_product.getId() != 0) {
			model.addAttribute(Constants.product_list, product_list.get(0));
		} else {
			model.addAttribute(Constants.product_list, product_list);
		}
		return "frontend/invest/product";
	}
	
	/**
	 * 分页展示投资产品详情页面
	 * @return
	 */
	@RequestMapping("/product1")
	public String investProduct1(@RequestParam(required=false) String currentPageNo,HttpServletRequest request,HttpServletResponse response,Model model){
		System.out.println("当前页--"+currentPageNo);
		
		PageSupport page=new PageSupport();
		if (currentPageNo != null) {//当前页
			page.setCurrentPageNo(Integer.parseInt(currentPageNo));
		}
		page.setPageSize(6);//每页容量
		int totalCount=investProductService.countInvest_product();//总记录数
		page.setTotalCount(totalCount); 
		page.setTotalPageCountByRs(); //计算总页数
		
		List<Invest_product> product_list=investProductService.getInvest_productsByPage((page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
		if (product_list == null) {
			System.out.println("获取投资产品列表为null");
			try {
				request.getRequestDispatcher("500.jsp").forward(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} 
		//首页投资查该类型或按产品id只需要产品中的一个，而我要投资需查询所有产品		
		model.addAttribute(Constants.PRODUCT_LIST_BYPAGE,product_list);	
		//分页信息
		model.addAttribute(Constants.PAGE,page);	
		return "frontend/invest/investList";
	}
	
	
	
	/**
	 * 点击头部“我要投资”模块
	 * @return
	 */
	@RequestMapping("/myInvest")
	public String myInvest(){			
		return "redirect:product1";
	}
	
	/**
	 * 用户发起投资后，相应的user_property、invest_product、trade_record表数据的更新
	 * @param trade_record
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/doInvest")
	public void doInvest(Trade_record trade_record,HttpServletRequest request,HttpServletResponse response,Model model){
		//传入的参数：userId、produceId、tradeMoney、tradeTypeId
		trade_record.setTradeDate(new Date());//传入当前时间
		trade_record.setTradeStatus(2);//传入交易状态（2-成功）
		
		PrintWriter writer=null;
		boolean flag=false;//默认交易失败
		try {
			writer=response.getWriter();
			//1.更新个人资产表user_property
			User_property user_property=	
					userService.getUserProperty(trade_record.getUserId());//查询个人资产
			user_property.setBalance(user_property.getBalance() - trade_record.getTradeMoney());//余额-=交易金额
			user_property.setInvProperty(user_property.getInvProperty() + trade_record.getTradeMoney());//投资资产+=交易金额
			int num=userService.doInvest(user_property);//更新个人资产表
			if (num>0) {
				//2.更新投资产品表invest_product
				Invest_product invest_product=new Invest_product();
				invest_product.setId(trade_record.getProduceId());
				List<Invest_product> list=investProductService.getInvest_products(invest_product);//查询该产品信息
				double newResidueAmount=list.get(0).getResidueAmount() - trade_record.getTradeMoney();
				if (newResidueAmount<0) {
					System.out.println("产品不够投了，请回滚事物");
				}else if (newResidueAmount == 0) {
					System.out.println("产品刚好投满");
					invest_product.setInvStatus(3);//投资状态3--投满
					invest_product.setResidueAmount(newResidueAmount);//可投金额-=交易金额 	
					int num2=investProductService.updateInvest_product(invest_product);//更新投资产品表
					if (num2>0) {
						//3.更新交易记录表trade_record
						int num3=tradeService.addTradeRecord(trade_record);//更新交易记录表
						if (num3>0) {
							flag=true;//所有信息添加成功后，返回交易成功
						}
					}
				}else{
					invest_product.setResidueAmount(newResidueAmount);//可投金额-=交易金额 	
					int num2=investProductService.updateInvest_product(invest_product);//更新投资产品表
					if (num2>0) {
						//3.更新交易记录表trade_record
						int num3=tradeService.addTradeRecord(trade_record);//更新交易记录表
						if (num3>0) {
							flag=true;//所有信息添加成功后，返回交易成功
						}
					}
				}				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		writer.println(flag);
		writer.flush();
		writer.close();		
	}

}
