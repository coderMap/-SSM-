package cn.itcast.shop.adminuser.vo;
/*
 * 后台用户的管理实体类
 */
public class AdminUser {
	private Integer uid;
	private String username;
	private String password;
	private String name;
	private String phone;
	private String sex;
	private Integer is_sign;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getIs_sign() {
		return is_sign;
	}
	public void setIs_sign(Integer is_sign) {
		this.is_sign = is_sign;
	}
	
	
	
}
