package service.backend;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapper.info_statis.Info_statisMapper;
import mapper.news.NewsMapper;
import pojo.Info_statis;
import pojo.News;
@Service
public class NewsServiceImpl implements NewsService{

	@Resource
	private NewsMapper newsMapper;
	
	@Override
	public List<News> getNewsList(Integer currentPageNo, Integer pageSize) throws Exception {
		return newsMapper.getNewsList((currentPageNo-1)*pageSize, pageSize);
	}

	@Override
	public int count() throws Exception {
		return newsMapper.count();
	}

	@Override
	public boolean deleteNewsById(Integer delId) throws Exception {
		boolean flag = false;
		if(newsMapper.deleteNewsById(delId) > 0){
			flag = true;
		}
		return flag;
	}

	@Override
	public int modifyNews(News news) throws Exception {
		
		return newsMapper.modifyNews(news);
	}

	@Override
	public List<News> findNewsById(int id) throws Exception {
		
		return newsMapper.findNewsById(id);
	}

	@Override
	public News getNewsById(Integer id) throws Exception {
		
		return newsMapper.getNewsById(id);
	}

}
