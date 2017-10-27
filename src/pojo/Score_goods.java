package pojo;
/**
 * 积分商城商品实体类
 * @author Administrator
 *
 */
public class Score_goods {
	
	private int id;//主键
	private String goodsName;//商品名称
	private int changeValue;//兑换值
	private String picturePath;//图片存储路径
	private int stock;//库存量
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getChangeValue() {
		return changeValue;
	}
	public void setChangeValue(int changeValue) {
		this.changeValue = changeValue;
	}
	public String getPicturePath() {
		return picturePath;
	}
	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
	
}
