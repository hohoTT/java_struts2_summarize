<%@page import="java.util.ArrayList"%>
<%@page import="com.wt.valueStack.City"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 创建 cities list 的集合 -->
	<%
		List<City> cities = new ArrayList<City>();
		
		cities.add(new City(1001, "AA"));
		cities.add(new City(1002, "BB"));
		cities.add(new City(1003, "CC"));
		cities.add(new City(1004, "DD"));
		
		request.setAttribute("cities", cities);
	%>

	<h4>Test Form-tag Page</h4><hr/>
	
	<s:debug></s:debug> <br/>
	
	<!-- 
		表单标签：
			1. 使用和 html 的 form 标签的感觉差不多
			2. Struts2 的 form 标签会生成一个 table，以进行自动的排版
			3. 可以对表单提交的值进行回显： 从栈顶对象开始匹配属性，并把匹配的属性赋到对应的标签的 value 中，
		若栈顶对象没有对应的对象属性，则依次向下找相对应的属性
			
			
	 -->
	<s:form action="save" >
		
		<s:hidden name="userId"></s:hidden>
		
		<s:textfield name="userName" label="UserName"></s:textfield>
		<s:password name="password" label="Password"></s:password>
		<s:textarea name="desc" label="Desc"></s:textarea>
		
		<s:checkbox name="married" label="Married"></s:checkbox>
		
		<s:radio name="gender" list="#{ '1' : 'Male', '0' : 'Female' }" 
				label="Gender">
		</s:radio>
		
		<!-- 
			需要注意的事项 
			服务端需要使用集合类型，以保证能够被正常的回显！
		-->
		<s:checkboxlist name="city" list="#request.cities" listKey="cityId"
						listValue="cityName" label="City"></s:checkboxlist>
			
		<!-- select 标签 -->
		<!-- 
			s:optgroup 可以用作 s:select 的子标签，用于显示更多的下拉框
			注意：必须有键值对，而不能使用一个集合，让其即作为键，又作为值		
		 -->
		<!-- 注意事项 ： select 中可以不指定key与value，但是到了 s:optgroup 中则需要指定key与value的值 -->		
		<s:select list="{11, 12, 13, 14, 15, 16, 17, 18, 19, 20}"
		 		  headerKey="" headerValue="chose"
		 		  name="age" label="Age">
		 	
		 	<s:optgroup label="21-30" list="#{21 : 21, 22 : 22}"></s:optgroup>	 
		 	<s:optgroup label="31-40" list="#{31: 31, 32: 32}"></s:optgroup>	  
		 	
		</s:select>
		
		<s:submit></s:submit>
		
	</s:form>
	
	以下为一般的表单<hr/>
	
	<form action="save" method="post">
		
		Married ： <input type="checkbox" name="married"/><br/>
		
		<input type="submit" value="Submit"/>
		
	</form>
	
	
	

</body>
</html>