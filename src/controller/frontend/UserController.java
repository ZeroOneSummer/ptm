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
	
	
	
	/**
	 * 修改登录密码
	 * @param id
	 * @param password
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/updateLoginPassword.html",method=RequestMethod.POST)
	@ResponseBody
    public void updateLoginPassword(@RequestParam int id,
    		@RequestParam String password,
    		HttpServletRequest request,
    		HttpServletResponse response){
		
		String loginPassword= H5Utils.Hex5(password);
    	User user=new User();
    	user.setId(id);
    	user.setPassword(loginPassword);
    	int i=0;
    	try {
			i=userService.updatePassword(user);
			
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

	/**
	 * 设置/修改交易密码
	 * @param id
	 * @param password
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/updateExchangePassword.html",method=RequestMethod.POST)
	@ResponseBody
    public void updateExchangePassword(@RequestParam int id,
    		@RequestParam String password,
    		HttpServletRequest request,
    		HttpServletResponse response){
		
		String exchangePassword= H5Utils.Hex5(password);
    	User user=new User();
    	user.setId(id);
    	user.setExchangePassword(exchangePassword);
    	int i=0;
    	try {
			i=userService.updateExchangePassword(user);
			
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
