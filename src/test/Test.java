package test;

import org.apache.ibatis.session.SqlSession;

import mapper.user.UserMapper;
import pojo.User;
import utils.MyBatisUtil;

public class Test {
	public static void main(String[] args) {

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		SqlSession session=  MyBatisUtil.createSqlSession();		
	
		User user= session.getMapper(UserMapper.class).getUsers();
		System.out.println(user.getLoginName()+"---"+user.getPassword());


		System.out.println("测试提交>>10.23");
		System.out.println("测试第二次提交>>10.23");
		System.out.println("测试提交yan");
		
		
	}
}
