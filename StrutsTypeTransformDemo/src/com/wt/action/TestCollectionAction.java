package com.wt.action;

import java.util.Collection;

import com.opensymphony.xwork2.ActionSupport;
import com.wt.entity.Manager;

// �����о�������ת����ͬʱʹ�õĳ���
public class TestCollectionAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Collection<Manager> managers = null;
	
	@Override
	public String execute() throws Exception {

		System.out.println(managers);
		
		return SUCCESS;
	}

	public Collection<Manager> getManagers() {
		return managers;
	}

	public void setManagers(Collection<Manager> managers) {
		this.managers = managers;
	}
	
}