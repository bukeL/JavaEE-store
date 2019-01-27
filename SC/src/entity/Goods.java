package entity;

public class Goods {
	private String id;   /*私有的*/
	   private String goodsname;
	   private String introduce;
	   private String originalprice;
	   private String currentprice;
	   private String categories_id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(String originalprice) {
		this.originalprice = originalprice;
	}
	public String getCurrentprice() {
		return currentprice;
	}
	public void setCurrentprice(String currentprice) {
		this.currentprice = currentprice;
	}
	public String getCategories_id() {
		return categories_id;
	}
	public void setCategories_id(String categories_id) {
		this.categories_id = categories_id;
	}
	public Goods(String id, String goodsname, String introduce, String originalprice, String currentprice,
			String categories_id) {
		super();
		this.id = id;
		this.goodsname = goodsname;
		this.introduce = introduce;
		this.originalprice = originalprice;
		this.currentprice = currentprice;
		this.categories_id = categories_id;
	}
	public Goods() {
		super();
		// TODO 自动生成的构造函数存根
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", goodsname=" + goodsname + ", introduce=" + introduce + ", originalprice="
				+ originalprice + ", currentprice=" + currentprice + ", categories_id=" + categories_id + "]";
	}
	
	
	   
}
