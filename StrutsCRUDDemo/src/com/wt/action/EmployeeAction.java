package com.wt.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.wt.dao.Dao;

public class EmployeeAction implements RequestAware{
	
	private Dao dao = new Dao();
	
	private Map<String, Object> requesetMap;
	
	// 1. ��Ҫ�ڵ�ǰ�� EmployeeAction ���� employeeId ����
	// ���Խ����������
	private Integer employeeId;

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	
	public String delete() {
		
		dao.delete(employeeId);
		
		// ���ؽ��������Ӧ��Ϊ�� redirectAction
		// Ҳ������ chain�� ʵ���� chain ��û�б�Ҫ�ģ���Ϊ����Ҫ����һ�� Action �б��� ��ǰ�� Action ��״̬
		// ���У���ʹ�� chain���򵽴�Ŀ��ҳ��󣬵�ַ����ʾ����Ȼ�� ɾ�� ���Ǹ����ӣ�ˢ��ʱ�����ظ����ύ
		// ����ʹ�� redirectAction
		return "delete";
	}

	public String list(){
		
		requesetMap.put("emps", dao.geteEmployees());
		
		return "list";
	}
	

	@Override
	public void setRequest(Map<String, Object> request) {
		
		this.requesetMap = request;
		
	}
	
}