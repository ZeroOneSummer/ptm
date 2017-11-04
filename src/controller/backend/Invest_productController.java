package controller.backend;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import pojo.Invest_product;
import pojo.Invest_type;
import service.InvestProductService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class Invest_productController {
	
	@Resource
	private InvestProductService investProductService;
	/**
	 * 产品信息
	 * @return
	 */
	@RequestMapping("/productCenter.html")
	public String productList(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
		
		List<Invest_product> invest_product=null;
		//页面容量
		int pageSize = Constants.pageSize;
		//当前页码
		Integer currentPageNo = 1;		
		if(pageIndex != null){
			try{
				currentPageNo = Integer.valueOf(pageIndex);
			}catch (NumberFormatException e) {
			e.printStackTrace();
			}
		}//if
			//总数量（表）
			int totalCount = 0;
			try {
				totalCount = investProductService.countInvest_product();
			} catch (Exception e) {

				e.printStackTrace();
			}
			//总页数
			PageSupport pages = new PageSupport();
			pages.setCurrentPageNo(currentPageNo);
			pages.setPageSize(pageSize);
			pages.setTotalCount(totalCount);
			int totalPageCount = pages.getTotalPageCount();
			//控制首页和尾页
			if(currentPageNo < 1){
				currentPageNo = 1;
			}else if(currentPageNo > totalPageCount){
				currentPageNo = totalPageCount;	
			}//if
			try {
				invest_product =investProductService.getInvest_productsByPage((pages.getCurrentPageNo()-1)*pages.getPageSize(), pages.getPageSize());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("invest_product", invest_product);
			model.addAttribute("pages", pages);
		
		
		return "backend/productManager/product_list";
	}
	

	/**
	 * 根据id删除产品信息
	 * @throws Exception 
	 */
	@RequestMapping(value="/delInvestProduct.json")
	public void delInvestProduct(@RequestParam String id,HttpServletResponse response) throws Exception{
		boolean flag = investProductService.deleteInvest_productById(Integer.parseInt(id));			
		PrintWriter writer=response.getWriter();
		writer.println(flag);
		writer.flush();
		writer.close();
	}
	
	/**
	 * 根据Id查询单个产品信息详情
	 * @throws Exception 
	 * @throws NumberFormatException 
	 */
	 @RequestMapping(value="/getProduct",method=RequestMethod.GET)  
  		public String getProducts(String id ,Model model) throws NumberFormatException, Exception{  
		 Invest_product invest_product=new Invest_product();
		 invest_product.setId(Integer.parseInt(id));
		 List<Invest_product> list= investProductService.getInvest_products(invest_product);
		 
		 model.addAttribute("invest_product", list.get(0));
        return "backend/productManager/product_details";  
    } 
	 @RequestMapping("/changeStatus")
	 public String changeStatus(Integer id){
		 System.out.println("进入修改产品状态changeStatus>>传入参数id=" + id);
		 int result = -1;
		 if(id != null){
			 try {
				  result = investProductService.updateInvStatus(2, id);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("修改产品状态发生异常");
			}
		 }
		 System.out.println("修改情况>>result(1为成功)"+ result );
		 return "redirect:productCenter.html";
	 }
	 
	 
	 
	
	 /**
		 * 修改产品信息,跳转到修改页面
		 * @throws Exception 
		 */
		@RequestMapping(value="/modifProduct",method=RequestMethod.GET)
		public String updateInvest_product(String id,Model model) throws Exception{
			List<Invest_type> list = investProductService.geInvest_types();
			model.addAttribute(Constants.type_list, list);
			Invest_product invest_product=investProductService.getInvest_productById(Integer.parseInt(id));
			
			//根据id查找特定产品

			model.addAttribute("product", invest_product);
			return "backend/productManager/update_product";
		}
		
		/**
		 * 保存修改后的产品信息
		 * @throws Exception 
		 */
		 @RequestMapping(value="/updateInvest_product",method=RequestMethod.POST)  
		    public String updateInvest_product(Invest_product invest_product,HttpServletRequest request,HttpServletResponse response) throws Exception{  
			 System.out.println("进入更新产品的方法");
			 int num =investProductService.modifyInvest_product(invest_product);
			  if (num > 0) {
		    		List<Invest_product> list = investProductService.getInvest_products(invest_product);
		    		//request.setAttribute("product", list);
		    		request.setAttribute("product", invest_product);
				} else {
					System.out.println("no");
					request.getRequestDispatcher("500.jsp").forward(request, response);
					
				}
		      return "redirect:productCenter.html";  	        
		    }  
		
	
	
		 /**
			 * 增加产品信息（跳转到新增页面）
			 * 
			 * @return
			 */
			@RequestMapping(value="/appInvest_product",method=RequestMethod.GET)
			public String addInvest_product(Model model){
				List<Invest_type> list = investProductService.geInvest_types();
				model.addAttribute(Constants.type_list, list);
				return "backend/productManager/add_product";
			}
			
			 /**  
		     * 添加产品信息并重定向   
		     */  
		    @RequestMapping("/addProduct")  
		    public String addProduct(Invest_product invest_product,HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		    	System.out.println("添加产品信息");
		    	    	
		    	int num=investProductService.addInvest_product(invest_product); 
		    	if (num < 1) {		    		
		    		request.getRequestDispatcher("500.jsp").forward(request, response);		    		
				} 
		    	return "redirect:productCenter.html";  
		    } 
		 
	

}
