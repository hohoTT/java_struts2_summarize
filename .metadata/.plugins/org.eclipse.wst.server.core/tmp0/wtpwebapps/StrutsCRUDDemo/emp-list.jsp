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

	<h4>The Emp-List Page</h4><hr/>
	
	<h3>以下为添加employee的表单</h3><br/>
	<s:form action="emp-save">
		
		<s:textfield name="firstName" label="FirstName"></s:textfield>
		<s:textfield name="LastName" label="LastName"></s:textfield>
		<s:textfield name="email" label="Email"></s:textfield>
		
		<s:submit></s:submit>
		
	</s:form>
	
	<br/><hr/><br/>
		
	<h3>以下为显示employee数据</h3><br/>
	<table cellpadding="10" cellspacing="0" border="1">
		<thead>
			<tr>
				<td>Id</td>
				<td>FirstName</td>
				<td>LastName</td>
				<td>Email</td>
				<td>Edit</td>
				<td>Delete</td>
			</tr>
		</thead>
		
		<tbody>
			<s:iterator value="#request.emps">
				<tr>
					<td>${ employeeId }</td>
					<td>${ firstName }</td>
					<td>${ lastName }</td>
					<td>${ email }</td>
					<td> <a href="">Edit</a> </td>
					<td> <a href="emp-delete?employeeId=${ employeeId }">Delete</a> </td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	
</body>
</html>