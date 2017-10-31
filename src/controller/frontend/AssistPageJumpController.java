package controller.frontend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 辅助页面跳转
 * @author Administrator
 *
 */
@Controller
public class AssistPageJumpController {
	
	
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
