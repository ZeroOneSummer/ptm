package controller.backend;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mysql.jdbc.StringUtils;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import pojo.Info_statis;
import pojo.Invest_product;
import pojo.Invest_type;
import pojo.Msg_push;
import pojo.News;
import pojo.User;
import service.InvestProductService;
import service.backend.Info_statisService;

import service.backend.Invest_typeService;
import service.backend.Msg_pushMapperService;
import service.backend.NewsService;
import service.backend.UserService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class JumpController {
	
	/*@Resource
	private UserService userBackendService;
	@Resource
	private Info_statisService info_statisService;
	@Resource
	private NewsService newsService;*/
	@Resource
	private Msg_pushMapperService msgService;
	/*@Resource
	private Invest_typeService infoService;
	@Resource
	private InvestProductService investProductService;*/
	
	
	

	/**
	 * 消息推送
	 * @param model
	 * @param session
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("/beingpushed.html")
	public String infoCenter(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
		
		List<Msg_push> msg=null;
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
				totalCount = msgService.count1();
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
				msg =msgService.getMsg_pushList(currentPageNo, pageSize);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("pages", pages);
			model.addAttribute("msg", msg);
		
		
		
		
		return "backend/infoCenter/Beingpushed";
	}
	
	/**
	 * 根据id删除信息推送
	 * @throws Exception 
	 */
	@RequestMapping(value="/delaMsg.json")
	public void delMsp_push(@RequestParam String id,HttpServletResponse response) throws Exception{
		boolean flag = msgService.deleteMsg_pushById(Integer.parseInt(id));			
		PrintWriter writer=response.getWriter();
		writer.println(flag);
		writer.flush();
		writer.close();
	}
	
	
	/**
	 * 修改消息推送,跳转到修改页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/modifyMsg",method=RequestMethod.GET)
	public String updateMsg(Msg_push msg_push,Model model) throws Exception{
		List<Msg_push> list = msgService.getMsg_pushList(1, 5);
		for (Msg_push msg_push2 : list) {
			if (msg_push2.getId() == msg_push.getId()) {
				msg_push=msg_push2;
			}
		}		
		model.addAttribute("msg",msg_push);
		return "backend/infoCenter/updateMessage";
	}
	
	/**
	 * 保存修改后的信息推送
	 * @throws Exception 
	 */
	 @RequestMapping(value="/updateMsg",method=RequestMethod.POST)  
	    public String updateUser(Msg_push msg_push,HttpServletRequest request,HttpServletResponse response) throws Exception{  
		 msg_push.setReleaseDate(new Date());
		 int num = msgService.modify(msg_push); 
		  if (num > 0) {
	    		List<Msg_push> list = msgService.getMsg_pushList(1, 5);
	    		request.setAttribute("msg", list);
	    		System.out.println("yes");
			} else {
				System.out.println("no");
				request.getRequestDispatcher("500.jsp").forward(request, response);
				
			}
	      return "redirect:beingpushed.html";  	        
	    }  
	
	
	
	
	/**
	 * 增加信息推送（跳转到新增页面）
	 * 
	 * @return
	 */
	@RequestMapping(value="/appMsg",method=RequestMethod.GET)
	public String add(@ModelAttribute("msg_push") Msg_push msg_push){
		return "backend/infoCenter/addMessage";
	}
	
	/**  
     * 添加信息推送并重定向   
     */  
    @RequestMapping("/addMsgs")  
    public String addMsg(Msg_push msg_push,HttpServletRequest request,HttpServletResponse response) throws Exception{ 
    	msg_push.setReleaseDate(new Date());
    	msg_push.setUserId(1);
    	int num= msgService.addMsg_push(msg_push); 
    	if (num > 0) {
    		List<Msg_push> list = msgService.getMsg_pushList(1, 5);
    		request.setAttribute("msg", list);
		} else {
			request.getRequestDispatcher("500.jsp").forward(request, response);
		}
        return "redirect:beingpushed.html";  
    }
	
	
    /**
	 * 口袋券列表
	 * @return
	 */
	@RequestMapping("/pocketstamps.html")
	public String pocketstampsList(){
		
		return "backend/productManager/pocketstamps_list";
	}
	
	/**
	 * 商品列表
	 * @return
	 */
	@RequestMapping("/shop.html")
	public String shopList(){
		return "backend/shop/shoplist";
	}
	
	
	/**
	 * 商城交易详情表
	 * @return
	 */
	@RequestMapping("/shopParticulars.html")
	public String shopParticularsList(){
		
		return "backend/productManager/product_details";
	}
	
	
	
	
	
	
    
    
    
    
	
	
/**
 * 用户列表查询
 */
	/*@RequestMapping("/userList.html")
	public String getUserList(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
		System.out.println("请求查询用户列表");
		List<User> userList=null;
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
				totalCount = userBackendService.count();
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
				userList =userBackendService.getUserList(currentPageNo, pageSize);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("userList", userList);
			model.addAttribute("pages", pages);
			
		return "backend/investorManager/UserList";
	}
	
	*//**
	 * 产品信息
	 * @return
	 *//*
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
	

	*//**
	 * 根据id删除产品信息
	 * @throws Exception 
	 *//*
	@RequestMapping(value="/delInvestProduct.json")
	public void delInvestProduct(@RequestParam String id,HttpServletResponse response) throws Exception{
		boolean flag = investProductService.deleteInvest_productById(Integer.parseInt(id));			
		PrintWriter writer=response.getWriter();
		writer.println(flag);
		writer.flush();
		writer.close();
	}
	
	*//**
	 * 根据Id查询单个产品信息详情
	 * @throws Exception 
	 * @throws NumberFormatException 
	 *//*
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
	 
	 
	 
	
	 *//**
		 * 修改产品信息,跳转到修改页面
		 * @throws Exception 
		 *//*
		@RequestMapping(value="/modifProduct",method=RequestMethod.GET)
		public String updateInvest_product(String id,Model model) throws Exception{
			
			Invest_product invest_product=investProductService.getInvest_productById(Integer.parseInt(id));
			List<Invest_product> list =investProductService.getInvest_products(invest_product);
	
			for (Invest_product invest_product2 : list) {
				if (invest_product2.getId() == invest_product.getId()) {
					invest_product=invest_product2;
				}
			}		
			//根据id查找特定产品

			model.addAttribute("product", invest_product);
			return "backend/productManager/update_product";
		}
		
		*//**
		 * 保存修改后的产品信息
		 * @throws Exception 
		 *//*
		 @RequestMapping(value="/updateInvest_product",method=RequestMethod.POST)  
		    public String updateInvest_product(Invest_product invest_product,HttpServletRequest request,HttpServletResponse response) throws Exception{  
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
		
	
	
		 *//**
			 * 增加产品信息（跳转到新增页面）
			 * 
			 * @return
			 *//*
			@RequestMapping(value="/appInvest_product",method=RequestMethod.GET)
			public String addInvest_product(@ModelAttribute("invest_product") Invest_product invest_product){
				return "backend/productManager/add_product";
			}
			
			 *//**  
		     * 添加产品信息并重定向   
		     *//*  
		    @RequestMapping("/addProduct")  
		    public String addProduct(Invest_product invest_product,HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		    	
		    	investProductService.getInvest_products(invest_product);
		    	
		    	int num=investProductService.addInvest_product(invest_product); 
		    	if (num > 0) {
		    		List<Invest_product> list = investProductService.getInvest_products(invest_product);
		    		request.setAttribute("invest_product", invest_product);
		    		
				} else {
					request.getRequestDispatcher("500.jsp").forward(request, response);
				}
		        return "redirect:productCenter.html";  
		    } 
		 
		 
		 
	 
	
	*//**
	 * 产品分类
	 * @return
	 *//*
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
	
	*//**
	 * 根据id删除产品分类
	 * @throws Exception 
	 *//*
	@RequestMapping(value="/delproduct_category.json")
	public void delproduct_category(@RequestParam String id,HttpServletResponse response) throws Exception{
		boolean flag = infoService.deleteInvest_typeById(Integer.parseInt(id));			
		PrintWriter writer=response.getWriter();
		writer.println(flag);
		writer.flush();
		writer.close();
	}
	
	
	*//**
	 * 修改产品类别,跳转到修改页面
	 * @throws Exception 
	 *//*
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
	
	*//**
	 * 保存修改后的产品类别
	 * @throws Exception 
	 *//*
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
	
	
	
	
	*//**
	 * 增加产品类别，跳转到新增页面）
	 * 
	 * @return
	 *//*
	@RequestMapping(value="/appInvest_type",method=RequestMethod.GET)
	public String addType(@ModelAttribute("invest_type") Invest_type invest_type){
		return "backend/productManager/add_product_category";
	}
	
	 *//**  
     * 添加产品类别保存并重定向   
     *//*  
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
	*/
	
	
	
	
	/**
	 * 信息列表
	 * @return
	 */
	/*@RequestMapping("/Information.html")
	public String informationlist(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
		
		List<News> news=null;
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
				totalCount = newsService.count();
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
				news =newsService.getNewsList(currentPageNo, pageSize);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("pages", pages);
			model.addAttribute("news", news);
		
		return "backend/infoCenter/Informationlist";
	}
	
	*//**
	 * 根据Id查询单个信息详情
	 * @throws Exception 
	 * @throws NumberFormatException 
	 *//*
	 @RequestMapping(value="/getNews",method=RequestMethod.GET)  
  		public String getnew( String id,Model model) throws NumberFormatException, Exception{  
		 List<News> list= newsService.findNewsById(Integer.parseInt(id));
		  News news=null;
		  for (News news2 : list) {
			  if (news2.getId() == news.getId()) {
					news=news2;
				}
		}
		 
		 model.addAttribute("news", list.get(0));
        return "/backend/infoCenter/showInfo";  
    } 
	
	*//**
	 * 根据id删除
	 *//*
	 @RequestMapping(value="/delNews.json")
		public void delNews(@RequestParam String id,HttpServletResponse response) throws Exception{
			boolean flag = newsService.deleteNewsById(Integer.parseInt(id));			
			PrintWriter writer=response.getWriter();
			writer.println(flag);
			writer.flush();
			writer.close();
		}

	 
	 
	 *//**
	  * 修改跳转到修改页面
	  *//*
	 @RequestMapping(value="/modifyNews",method=RequestMethod.GET)
		public String updateMews(News news,Model model) throws Exception{
			List<News> list = newsService.getNewsList(1, 5);
			for (News news2 : list) {
				if (news2.getId() == news.getId()) {
					news=news2;
				}
			}
			model.addAttribute("news",news);
			return "backend/infoCenter/updateInfomation";
		}
	 
	/**
	  * 修改并保存跳转到信息列表
	  */
	/* @RequestMapping(value="/updateNews",method=RequestMethod.POST)  
	    public String updateNews(News news,HttpServletRequest request,HttpServletResponse response) throws Exception{  
		 news.setReleaseDate(new Date());
		 int num = newsService.modifyNews(news); 
		  if (num > 0) {
	    		List<News> list = newsService.getNewsList(1, 5);
	    		request.setAttribute("news", list);  	
	    		System.out.println("yes");
			} else {
				System.out.println("no");
				request.getRequestDispatcher("500.jsp").forward(request, response);
				
			}
	      return "redirect:Information.html";  	        
	    }*/
	 
	

	
	
	/**
	 * 累计统计表
	 * @return
	 */
	/*@RequestMapping("/statistics.html")
	public String statisticsList(Model model,HttpSession session,@RequestParam(value="pageIndex",required=false) String pageIndex){
		
		List<Info_statis> info=null;
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
				totalCount =info_statisService.count();
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
				info =info_statisService.getStatisList(currentPageNo, pageSize);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("pages", pages);
			model.addAttribute("info", info);
		
		return "backend/helpCenter/Statistics";
	}
	*/
	
}
