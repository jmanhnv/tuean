package com.tuean.model;

public class UserInfo {
	private String name;
	private String email;
	private String roleName;
	private String password;

	public UserInfo() {
	}

	public UserInfo(String name, String email, String roleName, String password) {
		this.name = name;
		this.email = email;
		this.roleName = roleName;
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
