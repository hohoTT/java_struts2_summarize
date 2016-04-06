package com.wt.action;

import com.opensymphony.xwork2.ActionSupport;

// 继承 ActionSupport 间接实现 ValidationAware 接口
public class ConversionAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int age;

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	public String execute() {
		
		System.out.println("age ---- " + age);
		
		return "success";
	}
	
}
