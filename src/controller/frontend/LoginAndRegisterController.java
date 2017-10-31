package controller.frontend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import pojo.User;
import service.UserService;
import utils.Constants;
import utils.H5Utils;
@Controller
public class LoginAndRegisterController{
	
	@Resource
	private UserService userService;
	
	/*
	 * 进入登录页面
	 */
	@RequestMapping("/login")
	public String login(){
		return "frontend/loginRegister/login";
	}
	
	/*
	 * 进入后台页面
	 */
	@RequestMapping("/admin")
	public String admin(){

		return "redirect:userList.html";
	}
	
	/*
	 * 登录验证页面
	 */
	@RequestMapping("/doLogin")
	public void doLogin(String username,String password,
					HttpServletRequest request,HttpServletResponse response){
		String pwd=null;
		try {
			pwd = H5Utils.Hex5(password);
		} catch (Exception e1) {
			System.out.println("error");
			e1.printStackTrace();
		}
		User user=new User();
		System.out.println(username+"---"+password+"---"+pwd);
		user.setLoginName(username);
		user.setPassword(pwd);
		
		try {
			PrintWriter writer=response.getWriter();
			User user2 = null;
			try {
				user2 = userService.getUser(user);
			} catch (Exception e) {


				e.printStackTrace();
			}
			if (user2!=null) {
				request.getSession().setAttribute(Constants.USER_SESSION,user2);				
			}
			Object json=JSON.toJSON(user2);
			writer.println(json);			
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		} 					
	}
	
	/*
	 * 进入注册页面
	 */
	@RequestMapping("/register")
	public String register(String loginName,String password,
			HttpServletRequest request,HttpServletResponse response){
		
		return "frontend/loginRegister/register";
	}
	
	/*
	 * 注册验证页面
	 */
	@RequestMapping("/doRegister")
	public void doRegister(String loginName,String password,
			HttpServletRequest request,HttpServletResponse response){
		String pwd=null;
		try {
			pwd = H5Utils.Hex5(password);
		} catch (Exception e1) {
			System.out.println("error");
			e1.printStackTrace();
		}
		User user=new User();
		System.out.println("注册信息:"+loginName+"---"+password+"---"+pwd);
		user.setLoginName(loginName);		
		
		try {
			PrintWriter writer=response.getWriter();


			User user2 = null;
			try {
				user2 = userService.getUser(user);
			} catch (Exception e) {

				e.printStackTrace();
			}
			if (user2 == null) {//不存在该用户
				User user3=new User();
				user3.setLoginName(loginName);
				user3.setPassword(pwd);
				user3.setUserType(2);//默认普通用户
				user3.setIdNumber("");
				int num = 0;
				try {
					num = userService.addUser(user3);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (num>0) {
					System.out.println("添加用户成功");
					request.getSession().setAttribute(Constants.USER_SESSION,user3);				
				} else{
					System.out.println("添加失败");
				}
			} 			
			Object json=JSON.toJSON(user2);
			writer.println(json);						
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		} 					
	}
		
	/*
	 * 找回登录密码
	 */
	@RequestMapping("/ForgotPassword")
	public String forgotPassword(){
		return "frontend/personalCenter/ForgotPassword";
	}
	
	/*
	 * 注销用户
	 */
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session){
		Object object=session.getAttribute(Constants.USER_SESSION);
		if (object!=null) {
			session.invalidate();
		}
		return "firstPage";
	}
}
