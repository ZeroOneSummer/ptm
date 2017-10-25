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
	public User getUser(User user) throws Exception {
		return userMapper.getUser(user);
	}

	@Override
	public int updatePassword(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.updatePassword(user);
	}

	@Override
	public int updateExchangePassword(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.updateExchangePassword(user);
	}

}
