package service.impl;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import mapper.user.BankTypeMapper;
import mapper.user.UserMapper;
import mapper.user.UserPropertyMapper;
import pojo.Bank_Type;
import pojo.User;
import pojo.User_property;
import service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	
	@Resource
	private UserPropertyMapper userPropertyMapper;

	@Override
	public User getUser(User user) throws Exception {
		return userMapper.getUser(user);
	}

	public int updatePassword(User user) throws Exception {
		return userMapper.updatePassword(user);
	}

	@Override
	public int addUser(User user) throws Exception {
		return userMapper.addUser(user);
	}

	@Override
	public int updateExchangePassword(User user) throws Exception {
		return userMapper.updateExchangePassword(user);
	}

	@Override
	public int rechange(int userId, double money) throws Exception {
		return userPropertyMapper.rechange(userId, money);
	}

	@Override
	public int withdrawDeposit(int userId, double balance, double withdrawMoney) throws Exception {
		return userPropertyMapper.withdrawDeposit(userId, balance, withdrawMoney);
	}

	@Override
	public User_property getUserProperty(@Param("userId") int userId) throws Exception {
		return userPropertyMapper.getUserProperty(userId);
	}

	@Override
	public int doInvest(User_property user_property) {
		return userPropertyMapper.doInvest(user_property);
	}

	@Override
	public int addIdNumber(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.addIdNumber(user);
	}

	@Override
	public int addBackNumber(User user) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.addBackNumber(user);
	}

}
