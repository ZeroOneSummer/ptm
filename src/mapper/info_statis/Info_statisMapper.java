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

}
