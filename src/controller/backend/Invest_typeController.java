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

import pojo.Invest_type;
import service.backend.Invest_typeService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class Invest_typeController {
	@Resource
	private Invest_typeService infoService;
	/**
	 * 产品分类
	 * @return
	 */
	@RequestMapping("/productCategory.html")
	public String categoryList(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
		
		List<Invest_type> invest_type=null;
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
				totalCount =infoService.count();
				System.out.println("数量："+totalCount);
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
				invest_type =infoService.getInvest_typeList(currentPageNo, pageSize);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("pages", pages);
			model.addAttribute("invest_type", invest_type);
		
		
		
		
		
		return "backend/productManager/product_category";
	}
	
	/**
	 * 根据id删除产品分类
	 * @throws Exception 
	 */
	@RequestMapping(value="/delproduct_category.json")
	public void delproduct_category(@RequestParam String id,HttpServletResponse response) throws Exception{
		boolean flag = infoService.deleteInvest_typeById(Integer.parseInt(id));			
		PrintWriter writer=response.getWriter();
		writer.println(flag);
		writer.flush();
		writer.close();
	}
	
	
	/**
	 * 修改产品类别,跳转到修改页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/modifInvest_type",method=RequestMethod.GET)
	public String updateInvest_type(Invest_type invest_type,Model model) throws Exception{
		List<Invest_type> list = infoService.getInvest_typeList(1, 5);
		for (Invest_type invest_type2 : list) {
			if (invest_type2.getId() == invest_type.getId()) {
				invest_type=invest_type2;
			}
		}		
		model.addAttribute("invest_type",invest_type);
		return "backend/productManager/update_product_category";
	}
	
	/**
	 * 保存修改后的产品类别
	 * @throws Exception 
	 */
	 @RequestMapping(value="/updateInvest_type",method=RequestMethod.POST)  
	    public String updateInvest_type(Invest_type invest_type,HttpServletRequest request,HttpServletResponse response) throws Exception{  
		 int num =infoService.modifyInvest_type(invest_type) ;
		  if (num > 0) {
	    		List<Invest_type> list = infoService.getInvest_typeList(1, 5);
	    		request.setAttribute("invest_type", list);
	    		System.out.println("yes");
			} else {
				System.out.println("no");
				request.getRequestDispatcher("500.jsp").forward(request, response);
				
			}
	      return "redirect:productCategory.html";  	        
	    }  
	
	
	
	
	/**
	 * 增加产品类别，跳转到新增页面）
	 * 
	 * @return
	 */
	@RequestMapping(value="/appInvest_type",method=RequestMethod.GET)
	public String addType(@ModelAttribute("invest_type") Invest_type invest_type){
		return "backend/productManager/add_product_category";
	}
	
	 /**  
     * 添加产品类别保存并重定向   
     */  
    @RequestMapping("/addInvest_type")  
    public String addInvest_type(Invest_type invest_type,HttpServletRequest request,HttpServletResponse response) throws Exception{ 
 
    	invest_type.setId(1);
    	int num= infoService.addInvest_type(invest_type); 
    	if (num > 0) {
    		List<Invest_type> list = infoService.getInvest_typeList(1, 5);
    		request.setAttribute("invest_type", list);
		} else {
			request.getRequestDispatcher("500.jsp").forward(request, response);
		}
        return "redirect:productCategory.html";  
    }

}
