package mapper.news;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pojo.Invest_product;
import pojo.News;

public interface NewsMapper {

		//信息列表
		public List<News> getNewsList(
				@Param(value="from")Integer currentPageNo,
				@Param(value="pageSize")Integer pageSize)throws Exception;
		
		public int count()throws Exception;
		//根据id查找详情
		public List<News> findNewsById(int id) throws Exception; 
		
		//删除
		public int deleteNewsById(@Param(value="id")Integer delId)throws Exception;
		//修改
		public int modifyNews(News news)throws Exception;
	
}
