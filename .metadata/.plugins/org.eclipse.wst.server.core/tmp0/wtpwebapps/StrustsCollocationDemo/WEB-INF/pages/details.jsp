<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	ProductId : ${productId}
	<br><br>
	
	以下为修改之后，从request中获取的数值：ProductName:  <%= request.getAttribute("productName") %>
	<br><br>
	
	ProductDesc : ${productDesc}
	<br><br>
	
	ProductPrice : ${productPrice}
	<br><br>
	
	requset: <%= request %>

</body>
</html>