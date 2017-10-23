package service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.user.UserMapper;
import pojo.User;
import service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper userMapper;	
	
	@Override
	public User getUser(User user) {
		return userMapper.getUser(user);
	}

}
