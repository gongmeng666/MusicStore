package musicStore.entity;

public class User {
	private int id;
	private String username;
	private String password; 
	private String name;
	private String address;
	private String phone;
	private String  email;
	private int UserRoleId ;
	private boolean IsInUse ;
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getUserRoleId() {
		return UserRoleId;
	}
	public void setUserRoleId(int userRoleId) {
		UserRoleId = userRoleId;
	}
	public boolean isIsInUse() {
		return IsInUse;
	}
	public void setIsInUse(boolean isInUse) {
		IsInUse = isInUse;
	}
	public User(int id, String username, String password, String name, String address, String phone, String email,
			int userRoleId, boolean isInUse) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		UserRoleId = userRoleId;
		IsInUse = isInUse;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
