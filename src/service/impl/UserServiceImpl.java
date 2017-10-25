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
	public User getUser(User user) throws Exception{
		return userMapper.getUser(user);
	}

	@Override
	public int addUser(User user) throws Exception{
		return userMapper.addUser(user);
	}

	@Override
	public int rechange(int userId, int money) throws Exception {
		return userMapper.rechange(userId, money);
	}

}
