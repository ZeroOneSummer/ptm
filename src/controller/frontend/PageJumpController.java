package controller.frontend;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.jdbc.StringUtils;

import pojo.User;
import service.UserService;
import utils.Constants;

/**
 * 跳转页面专用
 * @author Administrator
 *
 */
@Controller
public class PageJumpController {
	@Resource
	private UserService userService;
	
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping("/index.html")
	public String toIndex(){
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
	
	/**
	 * 跳转到-我的投资-页面
	 * @return
	 */
	@RequestMapping("/myInvest.html")
	public String toMyInvest(){
		
		return "frontend/personalCenter/myInvest";
	}
	
	
	/**
	 * 跳转到-账户中心-页面
	 * @return
	 */
	@RequestMapping("/account.html")
	public String toAccount(@RequestParam(value="id",required=false) String id ,HttpServletRequest request,HttpServletResponse response){
		if(!StringUtils.isNullOrEmpty(id)){
			User user=new User();
			int id1=Integer.parseInt(id);
			user.setId(id1);
			User user2=null;
			try {
				user2=userService.getUser(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
				 request.getSession().setAttribute(Constants.USER_SESSION, user2);
				 User userSession=(User)request.getSession().getAttribute(Constants.USER_SESSION);
				 System.out.println("userSession>>>>>>>>>>>"+userSession.getExchangePassword());
		}
		
		return "frontend/personalCenter/account";
	}
	
	
	
	/**
	 * 跳转到-消息中心-页面
	 * @return
	 */
	@RequestMapping("/messageCenter.html")
	public String toMessageCenter(){
		
		return "frontend/personalCenter/messageCenter";
	}
	
	
	/**
	 * 跳转到-我的口袋券-页面
	 * @return
	 */
	@RequestMapping("/myPocket.html")
	public String toMyPocket(){
		
		return "frontend/personalCenter/myPocket";
	}
	


	/**
	 * 跳转到-账户中心-充值页面
	 * @return
	 */
	@RequestMapping("/recharge.html")
	public String toRecharge(){
		
		return "frontend/personalCenter/recharge";
	}
	
	/**
	 * 跳转到-账户中心-提现页面
	 * @return
	 */
//	@RequestMapping("/withdrawDeposit.html")
	public String toWithdrawDeposit(){
		
		return "frontend/personalCenter/withdrawDeposit";

	}
	/**
	 * 跳转到-设置交易密码-页面
	 * @return
	 */
	@RequestMapping("/setPassword.html")
	public String toSetPassword(){
		
		return "frontend/personalCenter/setPassword";
	}
	
	
	
	/**
	 * 跳转到-修改交易密码-页面
	 * @return
	 */
	@RequestMapping("/updatePassword.html")
	public String toUpdatePassword(){
		
		return "frontend/personalCenter/updatePassword";


	}
	
	
	/**
	 * 跳转到-修改登录密码-页面
	 * @return
	 */
	@RequestMapping("/loginPassword.html")
	public String toLoginPassword(){
		
		return "frontend/personalCenter/loginPassword";


	}
	

	/**
	 * 跳转到-新手福利-页面
	 * @return
	 */
	@RequestMapping("/newfuli")
	public String toNewfuli(){
		return "frontend/invest/Newfuli";
	}
	
	
	/**
	 * 跳转到-公告中心-页面
	 * @return
	 */
	@RequestMapping("/phoneNews.html")
	public String toPhoneNews(){
		
		return "frontend/helpCenter/phoneNews";
	}
	
	
	/**
	 * 跳转到-媒体-页面
	 * @return
	 */
	@RequestMapping("/Meiti.html")
	public String toMeiti(){
		
		return "frontend/infoCenter/Meiti";
	}
	
	
	/**
	 * 跳转到-实名认证-页面
	 * @return
	 */
	@RequestMapping("/realName.html")
	public String toRealName(){
		
		return "frontend/personalCenter/realName";
	}
	
	
	/**
	 * 跳转到-绑定银行卡-页面
	 * @return
	 */
	@RequestMapping("/BindBack.html")
	public String toBindBack(){
		
		return "frontend/personalCenter/BindBack";
	}
	
	
	
}
