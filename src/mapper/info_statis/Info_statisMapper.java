package mapper.info_statis;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.Info_statis;


public interface Info_statisMapper {
	
	//累计统计表
	public List<Info_statis> getStatisList(
					@Param(value="from")Integer currentPageNo,
					@Param(value="pageSize")Integer pageSize)throws Exception;
			
	public int count()throws Exception;
	
	//任务调度添加统计数据
	public int addInfo_statis(Info_statis info_statis);
	
	/**
	 * 查询信息统计表
	 * @return
	 * @throws Exception
	 */
	public List<Info_statis> getInfo_statis()throws Exception;
}