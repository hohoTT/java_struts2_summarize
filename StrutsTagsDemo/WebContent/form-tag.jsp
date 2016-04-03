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
		
		<s:submit></s:submit>
		
	</s:form>
	
	以下为一般的表单<hr/>
	
	<form action="save" method="post">
		
		Married ： <input type="checkbox" name="married"/><br/>
		
		<input type="submit" value="Submit"/>
		
	</form>
	

</body>
</html>