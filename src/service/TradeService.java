package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Trade_record;

/**
 * 交易记录 业务层
 * 
 * @author Administrator
 *
 */
public interface TradeService{
	
	/**
	 * 动态查询交易记录
	 * tradeRecord保存属性可为：（userId，produceId，tradeStatus，tradeTypeId）
	 * @param tradeRecord
	 * @param currentPageNo 起始位置
	 * @param pageSize 页面大小
	 * @return
	 * @throws Exception
	 */
	public List<Trade_record> getTradeRecords(Trade_record tradeRecord,@Param(value = "from") Integer currentPageNo, @Param(value = "pageSize") Integer pageSize) throws Exception;
	
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
