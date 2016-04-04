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