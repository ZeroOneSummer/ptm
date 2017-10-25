package controller.frontend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 跳转页面专用
 * @author Administrator
 *
 */
@Controller
public class PageJumpController {
	
	
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping("/index.html")
	public String toIndex(){
		System.out.println("跳转到firstPage.jsp++");
		return "firstPage";
	}
	
	
	/**
	 * 跳转到-我要投资-页面
	 * @return
	 */
	@RequestMapping("/toInvest.html")
	public String toInvest(){
		
		return "frontend/invest/investList";
	}
	
	
	/**
	 * 跳转到-积分商城-页面
	 * @return
	 */
	@RequestMapping("/exchangeShop.html")
	public String toExchangeShop(){
		
		return "frontend/personalCenter/exchangeShop";
	}
	
	
	/**
	 * 跳转到-信息披露-页面
	 * @return
	 */
	@RequestMapping("/infoList.html")
	public String toInfoList(){
		return "frontend/infoCenter/infoList";
	}
	
	
	/**
	 * 跳转到-帮助中心-页面
	 * @return
	 */
	@RequestMapping("/packageProject.html")
	public String toPackageProject(){
		
		return "frontend/helpCenter/packageProject";
	}
	
	
	/**
	 * 跳转到-公告中心-页面
	 * @return
	 */
	@RequestMapping("/publicNews.html")
	public String toPublicNews(){
		return "frontend/helpCenter/publicNews";
	}
	
	/**
	 * 跳转到-功能介绍-页面
	 * @return
	 */
	@RequestMapping("/moneyInfo.html")
	public String toMoneyInfo(){
		
		return "frontend/helpCenter/moneyInfo";
	}
	
	
	/**
	 * 跳转到-产品介绍-页面
	 * @return
	 */
	@RequestMapping("/productDesc.html")
	public String toProductDesc(){
		
		return "frontend/helpCenter/productDesc";
	}
	
	
	/**
	 * 跳转到-安全特性-页面
	 * @return
	 */
	@RequestMapping("/security.html")
	public String toSecurity(){
		
		return "frontend/helpCenter/security";
	}
}
