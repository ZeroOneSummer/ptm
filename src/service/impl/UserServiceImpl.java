package service.impl;

import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import mapper.news.Msg_pushMapper;
import mapper.trade.TradeMapper;
import mapper.user.BankTypeMapper;
import mapper.user.UserMapper;
import mapper.user.UserPropertyMapper;
import pojo.Bank_Type;
import pojo.Msg_push;
import pojo.Trade_record;
import pojo.User;
import pojo.User_property;
import service.BankTypeService;
import service.TradeService;
import service.UserService;
import service.backend.Msg_pushMapperService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	
	@Resource
	private UserPropertyMapper userPropertyMapper;
	
	@Resource
	private TradeMapper tradeMapper;

	@Resource
	private Msg_pushMapper msgMapper;

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
	public int addRechangeAndWithdrawDeposit(User_property user_property,Msg_push msg_push,Trade_record trade_record) throws Exception{
		int addUserProperty = -1;
		int addMsg_push = -1;
		int addTrade_record = -1;
		addUserProperty = userPropertyMapper.doRechangeAndWithdrawDeposit(user_property.getUserId(),user_property.getBalance());
		System.out.println("更改余额(1为成功)>>" + addUserProperty);
		addMsg_push = msgMapper.addMsg_push(msg_push);
		System.out.println("添加消息(1为成功)>>" + addMsg_push);
		addTrade_record = tradeMapper.addTradeRecord(trade_record);
		System.out.println("添加消息(1为成功)>>" + addTrade_record);
		return (addTrade_record == 1 && addUserProperty == 1 && addMsg_push == 1) ? 1 : -1;
	}

	@Override
	public User_property getUserProperty(@Param("userId") int userId) throws Exception {
		return userPropertyMapper.getUserProperty(userId);
	}

	@Override
	public int doInvest(User_property user_property) throws Exception{
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

	@Override
	public Double sumAccount(User user) throws Exception {
		return userPropertyMapper.sumAccount(user);
	}

	@Override
	public Double dayAccount(User user) throws Exception {
		return userPropertyMapper.dayAccount(user);
	}

}
