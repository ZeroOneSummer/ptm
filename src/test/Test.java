package test;

import org.apache.ibatis.session.SqlSession;

import mapper.user.UserMapper;
import pojo.User;
import utils.H5Utils;
import utils.MyBatisUtil;

public class Test {
	public static void main(String[] args) {

		/*SqlSession session=  MyBatisUtil.createSqlSession();			
		User user= session.getMapper(UserMapper.class).getUsers();
		System.out.println(user.getLoginName()+"---"+user.getPassword());*/
		
		String pwd = H5Utils.Hex5("123456789");
		System.out.println(pwd);
	}
}
