package com.wt.action;

import java.util.Arrays;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

public class UserAction {

	private String userId;
	private String userName;
	private String password;
	private String desc;

	private boolean married;

	private String gender;
	private List<String> city;
	private String age;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public boolean isMarried() {
		return married;
	}

	public void setMarried(boolean married) {
		this.married = married;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public List<String> getCity() {
		return city;
	}

	public void setCity(List<String> city) {
		this.city = city;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String save() {
		System.out.println(this);

		UserAction userAction = new UserAction();

		userAction.setUserId("testId");
		userAction.setUserName("testName");
		userAction.setPassword("testPassword");
		userAction.setDesc("testDesc");

		// 将创建的UserAction放到值栈的栈顶，用于测试表单的回显操作
		// ActionContext.getContext().getValueStack().push(userAction);

		return "input";
	}

	@Override
	public String toString() {
		return "UserAction [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", desc=" + desc + ", married="
				+ married + ", gender=" + gender + ", city=" + city + ", age="
				+ age + "]";
	}

}
