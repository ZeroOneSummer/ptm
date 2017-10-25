package controller.frontend;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.UserService;


import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import pojo.User;
import service.UserService;
import utils.Constants;
import utils.H5Utils;

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
	
	
	/**
	 * 用户充值（模拟充值，未调用外部接口）
	 * 关键点：余额添加，添加充值记录
	 * @return
	 */
	@RequestMapping("/doRecharge")
	public String doRecharge(Model model,HttpSession session){
		
		
		return "frontend/personalCenter/recharge";
	}
	
	@RequestMapping(value="/setExchangePassword.html",method=RequestMethod.POST)
	@ResponseBody
    public void setExchangePassword(@RequestParam int id,
    		@RequestParam String password,
    		HttpServletRequest request,
    		HttpServletResponse response){
		
		String exchangePassword= H5Utils.Hex5(password);
		System.out.println("进入验证方法"+exchangePassword);
    	User user=new User();
    	user.setId(id);
    	user.setExchangePassword(exchangePassword);
    	int i=0;
    	try {
			i=userService.updateExchangePassword(user);
			/*request.getSession().setAttribute(Constants.USER_SESSION, userService.getUser(user));*/
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	 try {
			PrintWriter out= response.getWriter();
			String str=JSON.toJSONString(i);
			out.println(str);
			System.out.println("str>>"+str);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
    	 
    	
    }


}
