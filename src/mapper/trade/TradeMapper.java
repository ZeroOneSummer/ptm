package mapper.trade;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import pojo.Trade_record;

public interface TradeMapper {

	/**
	 * 动态查询交易记录
	 * tradeMap 保存数据有：
	 * tradeRecord对象>>保存属性可为：（userId，produceId，tradeStatus，tradeTypeId）
	 * currentPageNo 起始位置
	 * pageSize 页面大小
	 * @param tradeMap
	 * @return
	 * @throws Exception
	 */
	public List<Trade_record> getTradeRecords(Map<String , Object> tradeMap) throws Exception;
	
	/**
	 * 动态查询交易记录数目
	 * tradeRecord保存属性可为：（userId，produceId，tradeStatus，tradeTypeId）
	 * @param tradeRecord
	 * @return
	 */
	public int getTradeRecordNums(Trade_record tradeRecord) throws Exception;
	
	/**
	 * 动态添加交易记录
	 * tradeRecord 
	 * @param tradeRecord
	 * @return
	 */
	public int  addTradeRecord(Trade_record tradeRecord) throws Exception;
	
	
}
