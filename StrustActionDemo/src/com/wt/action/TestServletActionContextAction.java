package com.wt.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


/**
 * 
 * @author hohoTT
 * ServletActionContext: 可以从中获取当前 Action 对象需要的一切 Servlet API 相关的对象，
 * 常用的方法：
 * 1. 获取 HttpServletRequest :  ServletActionContext.getRequest()
 * 2. 获取 HttpSession : ServletActionContext.getRequest().getSession()
 * 3. 获取 ServletContext : ServletActionContext.getServletContext()
 *
 */
public class TestServletActionContextAction {

	public String execute(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
//		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpSession session = request.getSession();
		
		ServletContext servletContext = ServletActionContext.getServletContext();
		
		System.out.println("------execute------");
		
		
		return "success";
	}
	
}
