package controller.backend;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pojo.Info_statis;
import pojo.Msg_push;
import pojo.News;
import pojo.User;
import service.backend.Info_statisService;
import service.backend.Msg_pushMapperService;
import service.backend.NewsService;
import service.backend.UserService;
import utils.Constants;
import utils.PageSupport;

@Controller
public class JumpController {
	
	@Resource
	private UserService userBackendService;
	@Resource
	private Info_statisService info_statisService;
	@Resource
	private NewsService newsService;
	@Resource
	private Msg_pushMapperService msgService;
	
	
/**
 * 用户列表查询
 */
	@RequestMapping("/userList.html")
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
	
	/**
	 * 产品信息
	 * @return
	 */
	@RequestMapping("/productCenter.html")
	public String productList(){
		
		return "backend/productManager/product_list";
	}
	
	
	/**
	 * 跳转到产品分类
	 * @return
	 */
	@RequestMapping("/productCategory.html")
	public String categoryList(){
		
		return "backend/productManager/product_category";
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
	 * 信息列表
	 * @return
	 */
	@RequestMapping("/Information.html")
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
	
	/**
	 * 消息推送
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
				totalCount = msgService.count();
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
				msg =msgService.getMsgList(1,0,currentPageNo, pageSize);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("pages", pages);
			model.addAttribute("msg", msg);
		
		
		
		
		return "backend/infoCenter/Beingpushed";
	}
	
	/**
	 * 累计统计表
	 * @return
	 */
	@RequestMapping("/statistics.html")
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
	
	
}
