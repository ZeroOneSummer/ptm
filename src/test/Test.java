package test;

import org.apache.ibatis.session.SqlSession;

import mapper.user.UserMapper;
import pojo.User;
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
		
		
	}

}
