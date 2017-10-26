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

}
