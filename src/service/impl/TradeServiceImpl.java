package service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Trade_record> getTradeRecords(Trade_record tradeRecord,Integer currentPageNo,Integer pageSize) throws Exception {
		Map<String, Object> tradeMap = new HashMap<String, Object>();
		tradeMap.put("tradeRecord", tradeRecord);
		tradeMap.put("from", (currentPageNo-1)*pageSize);
		tradeMap.put("pageSize", pageSize);
		return tradeMapper.getTradeRecords(tradeMap);
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
