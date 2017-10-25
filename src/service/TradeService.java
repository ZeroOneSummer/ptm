package service;

import java.util.List;
import pojo.Trade_record;

public interface TradeService{
	

	/**
	 * 动态查询交易记录
	 * tradeRecord保存属性可为：（userId，produceId，tradeStatus，tradeTypeId）
	 * @param tradeRecord
	 * @return
	 */
	public List<Trade_record> getTradeRecords(Trade_record tradeRecord) throws Exception;
	
	/**
	 * 动态添加交易记录
	 * tradeRecord 
	 * @param tradeRecord
	 * @return
	 */
	public int  addTradeRecord(Trade_record tradeRecord) throws Exception;
	
}
