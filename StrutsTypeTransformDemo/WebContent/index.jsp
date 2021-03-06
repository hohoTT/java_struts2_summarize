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

	<h4>The Index Page</h4><hr/>
	
	<!-- 
		问题：
			1. 如何覆盖默认的错误消息
			
				解决方法如下：
					<1>. 在对应的 Action 类所在包中创建
						ActionClassName.properties 文件， ActionClassName 即为包含着输入字段的 Action 类的类名
					
					<2>. 在属性文件中添加如下键值对： 
						invalid.fieldvalue.fieldName = XXX
						例子中的 fieldName 为 age，则就应该写为invalid.fieldvalue.age
			
			2. 如果是 simple 主题，还会显示错误消息吗，如果不会显示，那真么办
			
				<1>. 如果是 simple 主题，错误信息不会显示，通过 debug 标签，
					可以知道若转换出错，则在值栈的 Action(实现了 ValidationAware 接口) 对象中有一个 fieldErrors 属性，
					该属性的类型为 Map<String, List<String>> 键值对：
					键： 字段(属性名)， 值： 错误消息组成的 List， 
					
				<2>. 解决方法： 可以使用 OGNL 或者 EL 的方式显示错误信息
					   举例如下：
						 ${ fieldErrors.age[0] }
				
				<3>. 还可以使用s:fielderror 标签来显示，可以通过 fieldName 属性来定位显示字段的错误
	 
	 		3. 若是 simple 主题，且使用 <s:fielderror fieldName="age"></s:fielderror> 来显示错误消息，
	 		则该消息在一个  ul>li>span 中，此时不利于我们的排版
	 		
	 			源码在 template.simple 下的 fielderror.ftl 文件中定义了 simple 的主题下，
	 			s:fielderror 标签显示错误消息的样式，所以修改该配置文件即可
	 			
	 			如何去除该模板的样式：
	 				解决方法如下：
			 			在 src 下新建template.simple 包，新建 fielderror.ftl 文件，把原生的fielderror.ftl 文件中
			 			的内容复制到新建的 template.simple 下的 fielderror.ftl 的文件中，然后剔除 ul>li>span 部分即可
	 			
	 -->
	
	<s:debug></s:debug><br/><br/>
	
	<s:form action="testConversion" theme="simple">
	
		Age : <s:textfield name="age" label="Age"></s:textfield><br/><br/>
		
		${ fieldErrors.age[0] }<br/><br/>
		使用s:fielderror 标签来显示 字段错误信息：----- <s:fielderror fieldName="age"></s:fielderror>
		
		<s:submit></s:submit>
		
	</s:form>

</body>
</html>