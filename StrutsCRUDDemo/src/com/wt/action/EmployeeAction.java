package com.wt.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.wt.dao.Dao;

public class EmployeeAction implements RequestAware{
	
	private Dao dao = new Dao();
	
	private Map<String, Object> requesetMap;
	
	// 1. 需要在当前的 EmployeeAction 定义 employeeId 属性
	// 用以接受请求参数
	private Integer employeeId;

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	
	public String delete() {
		
		dao.delete(employeeId);
		
		// 返回结果的类型应该为： redirectAction
		// 也可以是 chain： 实际上 chain 是没有必要的，因为不需要在下一个 Action 中保留 当前的 Action 的状态
		// 还有，若使用 chain，则到达目标页面后，地址栏显示的依然是 删除 的那个连接，刷新时会有重复的提交
		// 所以使用 redirectAction
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
