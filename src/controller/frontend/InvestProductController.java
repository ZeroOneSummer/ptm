package controller.frontend;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pojo.Invest_product;
import pojo.Invest_type;
import service.InvestProductService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class InvestProductController {
	
	@Resource
	private InvestProductService investProductService;
	
	/**
	 * 首页展示产品类型列表
	 * @return
	 */
	@RequestMapping("/typeList")
	public String showInvestProductType(HttpServletRequest request,HttpServletResponse response,Model model){
		List<Invest_type> type_list=investProductService.geInvest_types();
		if (type_list == null) {
			System.out.println("获取投资产品类型表错误");
			try {
				request.getRequestDispatcher("500.jsp").forward(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
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
	 * 我要投资
	 * @return
	 */
	@RequestMapping("/myInvest")
	public String myInvest(){			
		return "redirect:product1";
	}
	
}
