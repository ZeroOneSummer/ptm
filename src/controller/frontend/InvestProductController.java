package controller.frontend;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.alibaba.fastjson.JSON;

import pojo.Info_statis;
import pojo.Invest_product;
import pojo.Invest_type;
import pojo.Msg_push;
import pojo.Trade_record;
import pojo.User_property;
import service.InvestProductService;
import service.TradeService;
import service.UserService;
import service.backend.Info_statisService;
import service.backend.Msg_pushMapperService;
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
	
	@Resource
	private Msg_pushMapperService msgService;
	
	/**
	 * 首页展示产品类型列表
	 * @return
	 */
	@RequestMapping("/typeList")
	public String showInvestProductType(HttpServletRequest request,HttpServletResponse response,Model model){
		List<Invest_type> type_list=investProductService.geInvest_types();
		List<Info_statis> info=null;
		List<Msg_push> msgList = null;
		try {
			info = info_statisService.getStatisList(1, 1);//获取最近一个月平台运营统计数据
			msgList = msgService.getMsgList(0, 4, 1, 9);
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*if (type_list == null || info == null || msgList == null) {
			System.out.println("获取投资产品类型表,公告消息列表以及平台运营数据错误");
			try {
				request.getRequestDispatcher("500.jsp").forward(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}*/
		
		Date date=new Date();
		int m= date.getMonth()+1;
		int d= date.getDate();
		String date1=m+"月"+d+"日";
		
		if (msgList.size() == 0) {
			model.addAttribute("msgList", null);//公告信息
		} else {
			model.addAttribute("msgList", msgList);//公告信息
		}

		model.addAttribute("date", date1);//当前时间
		model.addAttribute("info", info.get(0));//平台运营数据
		model.addAttribute(Constants.type_list, type_list);//产品类型列表
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
			flag = investProductService.updateInvestData(trade_record);//更新3张表的数据，加事务控制
			writer=response.getWriter();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println(flag);
			writer.println(flag);
			writer.flush();
			writer.close();				
		}
	}

	/**
	 * 获取用户余额到投资详情product.jsp页面
	 * @return
	 */
	@RequestMapping("/getBalance")
	public void getBalance(int userId,HttpServletResponse response){
		PrintWriter writer = null;
		try {
			writer = response.getWriter(); 
			User_property user_property = userService.getUserProperty(userId);
			Object json = JSON.toJSON(user_property);
			writer.println(json);
			writer.flush();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
		
}
