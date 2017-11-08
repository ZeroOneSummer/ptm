package redis;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class RedisUtils {
	 private static Logger logger = Logger.getLogger(RedisUtils.class);
	
	@Resource
	private static JedisPool jedisPool;
	
	 /**
     * @Description:设置失效时间
     * @param @param key
     * @param @param seconds
     * @param @return 
     * @return boolean 返回类型
     */
    public static void disableTime(String key,int seconds)
    {
        Jedis jedis = null;
        try
        {
            jedis = getJedis();
            jedis.expire(key, seconds);
             
        }
        catch (Exception e) {
        	logger.debug("设置失效失败.");
        }finally {
            getColse(jedis);
        }
    }
    
   /* public Object get(String key){
		try {
			jedis = getJedis();
			jedis.get
		} catch (Exception e) {
			return null;
		}
	}*/
    
    /**
     * 根据key获取存取对象
     * @param key
     * @return
     */
    public String getValueByKey(String key){
    	Jedis jedis = null;
		try {
			     jedis = getJedis();
			try {
				String s = jedis.get(key);
				return s;
			} finally {
				getColse(jedis);
			}
		} catch (Exception e) {
			logger.debug("获取数据有异常.");
			return null;
		}
	}
    
    /**
     * @Description:插入对象
     * @param @param key
     * @param @param obj
     * @param @return 
     * @return boolean 返回类型
     */
    public static boolean addObject(String key,Object obj)
    {
         
        Jedis jedis = null;
        String value = JSONObject.toJSONString(obj);
        try
        {
            jedis = getJedis();
            String code = jedis.set(key, value);
            if(code.equals("ok"))
            {
                return true;
            }
        }
        catch (Exception e) {
            logger.debug("插入数据有异常.");
            return false;
        }finally {
            getColse(jedis);
        }
        return false;
    }
     
     
     
    /**
     * @Description:存储key~value
     * @param @param key
     * @param @param value 
     * @return void 返回类型
     */
     
    public static boolean addValue(String key,String value)
    {
        Jedis jedis = null;
        try
        {
            jedis = getJedis();
            String code = jedis.set(key, value);
            if(code.equals("ok"))
            {
                return true;
            }
        }
        catch (Exception e) {
            logger.debug("插入数据有异常.");
            return false;
        }finally {
            getColse(jedis);
        }
        return false;
    }
    /**
     * @Description:删除key
     * @param @param key
     * @param @return 
     * @return boolean 返回类型
     */
    public static boolean delKey(String key)
    {
        Jedis jedis = null;
        try
        {
            jedis = getJedis();
            Long code = jedis.del(key);
            if(code > 1)
            {
                return true;
            }
        }
        catch (Exception e) {
            logger.debug("删除key异常.");
            return false;
        }finally {
            getColse(jedis);
        }
        return false;
    }
     
    /**
     * @Description: 关闭连接
     * @param @param jedis 
     * @return void 返回类型
     */
     
    public static void getColse(Jedis jedis)
    {
        if(jedis != null)
        {
            jedis.close();
        }
    }
    
    /**
     * 获取Jedis对象
     * @return Jedis
     */
    public static Jedis getJedis(){
    	Jedis jedis = jedisPool.getResource();
    	if(jedis == null) {
    	logger.debug("获取Jedis对象有异常.");
    	}
    	return jedis;
    }
}
