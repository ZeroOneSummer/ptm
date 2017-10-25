package controller.frontend;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.TradeService;
import service.UserService;

/**
 * 用户操作
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	@Resource
	private TradeService tradeService;
	
	
	/**
	 * 用户充值（模拟充值，未调用外部接口）
	 * 关键点：余额添加，添加充值记录
	 * @return
	 */
	@RequestMapping("/doRecharge")
	public String doRecharge(Model model,HttpSession session){
		
		
		return "frontend/personalCenter/recharge";
	}
	
    
}
