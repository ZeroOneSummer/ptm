package test;


import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.tomcat.util.net.SecureNioChannel.ApplicationBufferHandler;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import mapper.user.UserMapper;
import pojo.Msg_push;
import pojo.Trade_record;
import pojo.User;
import pojo.User_property;
import service.UserService;
import utils.H5Utils;
import utils.MyBatisUtil;

public class Test {
	public static void main(String[] args) {

		/*SqlSession session=  MyBatisUtil.createSqlSession();			
		User user= session.getMapper(UserMapper.class).getUsers();
		System.out.println(user.getLoginName()+"---"+user.getPassword());
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService service= (UserService) context.getBean("userService");
		User_property user_property=new User_property();
		user_property.setUserId(2);
		user_property.setBalance(19900.00);
		
		Msg_push msg_push=new  Msg_push();
		msg_push.setContent("1111");
		//msg_push.setMsgType(1);
		msg_push.setReleaseDate(new Date());
		msg_push.setTitle("111111");
		msg_push.setUserId(2);
		
		Trade_record trade_record=new  Trade_record();
		trade_record.setUserId(2);
		trade_record.setTradeDate(new Date());
		trade_record.setTradeMoney(200);
		trade_record.setTradeStatus(2);
		trade_record.setTradeTypeId(1);
		
		try {
			service.addRechangeAndWithdrawDeposit(user_property, msg_push, trade_record);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		
		int num=(int) ((Math.random()*9+1)*100000);
		System.out.println(num);
	}
}
