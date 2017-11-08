package service.backend;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.mysql.jdbc.StringUtils;

import mapper.user.backend.UserBackendMapper;
import pojo.User;
import redis.RedisUtils;

@Service("userServiceBackend")
public class UserServiceImpl implements UserService{
	
	
	@Resource
	private UserBackendMapper userMapperBackend;
	
	private RedisUtils redisUtils;
	
	@Override
	public List<User> getUserList(Integer currentPageNo, Integer pageSize) throws Exception {
		String json = redisUtils.getValueByKey("users");
		List<User> users = null;
		if(!StringUtils.isNullOrEmpty(json)){
			 users = (List<User>) JSON.parse(json);
			
		} else if(users == null){
			users = userMapperBackend.getUserList((currentPageNo-1)*pageSize, pageSize);
			redisUtils.addObject("users", users);
		}
		return users;
	}

	@Override
	public int count() throws Exception {

		return userMapperBackend.count();
	}

}
