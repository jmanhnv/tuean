package com.tuean.dto;

public class UserDto {
	private Integer id;
	private String name;
	private String email;
	private String password;
	private String roleName;
	private Integer roleId;

	public UserDto(Integer id, String name, String email, String password, String roleName, Integer roleId) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.roleName = roleName;
		this.roleId = roleId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}