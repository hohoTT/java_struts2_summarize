package com.wt.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

public class UserAction implements SessionAware{
	
	public String execute(){
		
		// ���û���Ϣ���� Session ����
		// 1. ��ȡ session��ͨ��ʵ�� SessionAware �ӿ�
		
		// 2. ��ȡ��¼��Ϣ
		
		// 3. ���û���Ϣ���� Session ����
		
		// �������� +1
		
		return "success";
	}
	
	/**
	 * 
	 */
	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

}