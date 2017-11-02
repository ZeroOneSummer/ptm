package pojo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 消息推送实体类
 * @author Administrator
 *
 */
public class Msg_push {

	private int id;//主键
	private int userId;//用户编号
	private int msgType;//类型(1:充值2:提现3:积分兑现4:公告)
	private String content;//内容
	private String title;//标题
	private Date releaseDate;//推送时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getMsgType() {
		return msgType;
	}
	public void setMsgType(int msgType) {
		this.msgType = msgType;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
