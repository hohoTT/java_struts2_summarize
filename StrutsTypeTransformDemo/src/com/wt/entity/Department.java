package com.wt.entity;

/**
 *  @author hohoTT
 * 	1. Department 是模型，实际录入的 Department，deptName 可以直接写到
 * 	s:textfield 的 name 属性中，manager 属性应该如何处理
 * 
 * 		Struts2 表单标签的 name 的值可以被映射到(赋为)一个属性的属性：
 * 			name = manager.name, name = manager.birth
 * 
 *  2. manager 中有一个 Date 类型的 birth 属性，Struts2 可以完成自动的类型吗
 *  
 * 	全局的类型转换器可以正常的工作
 *
 */

public class Department {
	
	private Integer id;
	private String deptName;

	private Manager manager;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", deptName=" + deptName + ", manager="
				+ manager + "]";
	}
	
}
