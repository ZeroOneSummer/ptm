package service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.user.BankTypeMapper;
import pojo.Bank_Type;
import service.BankTypeService;

@Service
public class BankTypeServiceImpl implements BankTypeService {

	@Resource
	private BankTypeMapper bankTypeMapper;

	@Override
	public Bank_Type getUserBankNameByUserId(Bank_Type bank_Type) throws Exception {
		return bankTypeMapper.getUserBankNameByUserId(bank_Type);
	};

}
