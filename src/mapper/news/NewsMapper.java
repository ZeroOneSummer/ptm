package mapper.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import pojo.News;

public interface NewsMapper {

		//信息列表
		public List<News> getNewsList(
				@Param(value="from")Integer currentPageNo,
				@Param(value="pageSize")Integer pageSize)throws Exception;
		
		public int count()throws Exception;
		
		
		

}
