package entity;

public class Users {
	private String id;   /*私有的*/
	   private String username;
	   private String password;
	   private String avatar;
	   private String address;
	   private String phone;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getAddress() {
		return address;
	}
	public Users(String id, String username, String password, String avatar, String address, String phone) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.avatar = avatar;
		this.address = address;
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", username=" + username + ", password=" + password + ", avatar=" + avatar
				+ ", address=" + address + ", phone=" + phone + "]";
	}
	public Users() {
		super();
		// TODO 自动生成的构造函数存根
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	   
	  
}
