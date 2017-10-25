package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pojo.Trade_record;
import service.TradeService;

@Service
public class TradeServiceImpl implements TradeService {
	
	@Resource
	private TradeService tradeService;

	@Override
	public List<Trade_record> getTradeRecords(Trade_record tradeRecord) throws Exception {
		return tradeService.getTradeRecords(tradeRecord);
	}

	@Override
	public int addTradeRecord(Trade_record tradeRecord) throws Exception {
		return tradeService.addTradeRecord(tradeRecord);
	}

}
