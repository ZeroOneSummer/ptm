package utils;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	private static SqlSessionFactory factory;
	static{//在静态代码块中保证只创建一次
		try {
			InputStream is=Resources.getResourceAsStream("mybatis-config.xml");
			factory=new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	//创建sqlSession对象方法
	public static SqlSession createSqlSession(){
		return factory.openSession(false);//事务手动提交
	}
	//关闭sqlSession对象方法
	public static void closeSqlSession(SqlSession sqlSession){
		if (sqlSession!=null) {
			sqlSession.close();
		}		
	}
}
