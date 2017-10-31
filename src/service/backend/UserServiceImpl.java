package service.backend;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.user.backend.UserBackendMapper;
import pojo.User;

@Service("userServiceBackend")
public class UserServiceImpl implements UserService{
	
	
	@Resource
	@Autowired
	private UserBackendMapper userMapperBackend;
	

	@Override
	public List<User> getUserList(Integer currentPageNo, Integer pageSize) throws Exception {
		// TODO Auto-generated method stub
		return userMapperBackend.getUserList((currentPageNo-1)*pageSize, pageSize);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return userMapperBackend.count();
	}

}
