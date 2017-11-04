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
	
	@Resource
	private Msg_pushMapperService msgService;

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
				System.out.println("获取管理员消息");
				msg =msgService.getMsgList(1, 4, currentPageNo, pageSize);
				
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
		if(msg_push!=null){
			System.out.println("msg_push》id>>"+ msg_push.getId());
			msg_push=msgService.getMsg_pushById(msg_push);
			model.addAttribute("msg",msg_push);
		}
		
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
	
}
