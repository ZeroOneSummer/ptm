package controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pojo.Invest_type;
import service.InvestProductService;
import utils.Constants;

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
	public String investProduct(){
		
		return "frontend/invest/product";
	}
	
}
