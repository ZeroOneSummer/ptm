package pojo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 公告、媒体报道实体类
 * @author Administrator
 *
 */
public class News {
	
	private int id;//主键
	private String title;//标题
	private String contentPath;//内容文件路径
	private Date releaseDate;//发布时间
	private int newsType;//类别（1:公告2：媒体报道）
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentPath() {
		return contentPath;
	}
	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public int getNewsType() {
		return newsType;
	}
	public void setNewsType(int newsType) {
		this.newsType = newsType;
	}
	
	
}
