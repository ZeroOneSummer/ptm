package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.trade.TradeMapper;
import pojo.Trade_record;
import service.TradeService;

@Service
public class TradeServiceImpl implements TradeService {
	
	@Resource
	private TradeMapper tradeMapper;

	@Override
	public List<Trade_record> getTradeRecords(Trade_record tradeRecord) throws Exception {
		return tradeMapper.getTradeRecords(tradeRecord);
	}
	
	@Override
	public int getTradeRecordNums(Trade_record tradeRecord) throws Exception {
		return tradeMapper.getTradeRecordNums(tradeRecord);
	}

	@Override
	public int addTradeRecord(Trade_record tradeRecord) throws Exception {
		return tradeMapper.addTradeRecord(tradeRecord);
	}


}
