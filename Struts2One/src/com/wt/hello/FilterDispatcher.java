package com.wt.hello;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class FilterDispatcher
 */
@WebFilter({ "/FilterDispatcher", "*.action" })
public class FilterDispatcher implements Filter {
	
	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		
		// 1. ��ȡ servletPath
		String servletPath = req.getServletPath();
		System.out.println("servletPath---------" + servletPath);
		
		String path = null;
		
		// 2. �ж� servletPath���������"product-input.action"����ת����//WEB-IBF//pages/input.jsp
		if("/product-input.action".equals(servletPath)){
			path = "/WEB-INF/pages/input.jsp";
		}
		
		// 3. �������"/product-save.action",��
		if("/product-save.action".equals(servletPath)){

			// 1>. ��ȡ�������
			String productName = request.getParameter("productName");
			String productDesc = request.getParameter("productDesc");
			String productPrice = request.getParameter("productPrice");
			
			// 2>. ��������Ϣ��װΪһ�� Product����
			Product product = new Product(null, productName, productDesc, Double.parseDouble(productPrice));
			
			// 3>. ִ�б������
			System.out.println("Save Product " + product);
			product.setProductId(1001);
			
			// 4>. �� Product ���󱣴浽request �У� ${param.productName} -> ${requestScope.product.productNamn}
			request.setAttribute("product", product);
			
			path = "/WEB-INF/pages/details.jsp";
			
		}
		
		
		if(path != null){
			request.getRequestDispatcher(path).forward(request, response);
			return ;
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {}

}