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
	
	<h4>Test Common-tag Page</h4>
	
	<s:debug></s:debug> <br/><br/>
	
	<!-- 以下为 s: property 标签的使用介绍 -->
	以下为 s: property 标签的使用介绍 <hr/>
	
	s: property: 打印值栈中的属性值的：对于对象栈，打印值栈中对于的属性值 <br/><br/>
	<s:property value="productName"/> <br/><br/>
	
	对于 Map 栈，打印 request、session、application 某个属性值 或 某个请求参数的值 <br/><br/>
	<s:property value="#session.date"/> <br/><br/>
	
	<s:property value="#parameters.name"/> <br/><br/>
	
	
	
	<!-- 以下为 s:url 标签的使用介绍 -->
	以下为 s:url 标签的使用介绍 <hr/>
	
	s:url: 创建一个 URL 字符串的 <br/><br/>
	<s:url value="/getProduct" var="url1">
		<!-- 指定包含参数的url值，数字不会被当做是参数处理, Struts2 直接把数字作为属性值 -->
		<s:param name="productId" value="6666"></s:param>
	</s:url> 
	${ url1 } <br/><br/>
	
	<s:url value="/getProduct" var="url2">
		<!-- 对于 value 值会自动的进行 OGNL 解析 -->
		<s:param name="productId" value="productId"></s:param>
		
		<!-- OGNL 解析 date -->
		<s:param name="date" value="#session.date"></s:param>
	</s:url> 
	${ url2 } <br/><br/>
	
	<s:url value="/getProduct" var="url3">
		<!-- 对于 value 值会自动的进行 OGNL 解析, 若不希望进行 OGNL 解析，则使用单引号引起来 -->
		<s:param name="productId" value="'abcd'"></s:param>
	</s:url> 
	${ url3 } <br/><br/>
	
	<!-- 构建一个请求 action 的地址 -->
	<s:url action="testAction" namespace="/hohoTT" method="testTag" var="url4"></s:url>
	${ url4 } <br/><br/>
	
	<!-- 可以获取请求 url 中的参数值，includeParams="get"，此时获取的为 get 请求的参数-->
	<s:url value="/testUrl" var="url5" includeParams="get"></s:url>
	${ url5 } <br/><br/>
	
	<!-- 可以获取请求 url 中的参数值，includeParams="all"，此时获取的为 post 请求的参数-->
	<s:url value="/testUrl" var="url6" includeParams="all"></s:url>
	${ url6 } <br/><br/>
	
	<br/><br/>
	
	<br/><br/>

</body>
</html>