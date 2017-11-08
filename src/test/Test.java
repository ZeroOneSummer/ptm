package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class Test {
	
	public static void main(String[] args) {

		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		JedisPool jedisPool = (JedisPool) context.getBean("jedisPool");
		Jedis jedis = jedisPool.getResource();
		jedis.setex("str", 1000, "spring");
		String str = jedis.get("str");
		System.out.println("str>>"+str);
	}

}
