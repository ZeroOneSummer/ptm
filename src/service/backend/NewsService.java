package service.backend;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pojo.Msg_push;
import pojo.News;

public interface NewsService {
	
	//信息列表
	public List<News> getNewsList(
			@Param(value="from")Integer currentPageNo,
			@Param(value="pageSize")Integer pageSize)throws Exception;
	
	public int count()throws Exception;
	
	public List<News> findNewsById(int id) throws Exception; 
	
	//删除
	public boolean deleteNewsById(Integer delId)throws Exception;
	//修改
	public int modifyNews(News news)throws Exception;
	
	//根据Id查找具体产品
	public News getNewsById(@Param(value="id")Integer id) throws Exception;

}
