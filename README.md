# java_struts2_summarize

用于总结学习java中Struts2的用法以及使用规则

--------------------------------------------------------------------------------------------------------------------------------------

以下各个例子中为 Struts2 的用法介绍：

一、项目StrustsCollocationDemo与Struts2One的比较(即使用了Struts2框架与没有使用Struts2框架的比较)
1. 与之前 Filter 作为控制器实现 MVC的区别

1>. 搭建 Struts 的开发环境

2>. 不需要显示的定义 Filter, 而是用的是 Struts2 的配置文件

3>. details.jsp 比之前的简单

举例： 之前的 ${requestScope.product.productId} 变成了 现在的    ${productId}

4>. 步骤：

	1. 由 product-input.action 转到 /WEB-INF/pages/input.jsp
	
	在 Struts2 中配置一个 action
	
	<action name="product-input">
			<result>/WEB-INF/pages/input.jsp</result>
	</action>
		
	2. 由 input.jsp 页面的 action： product-save.action 到 Product类下的 save 方法， 再到 /WEB-INF/pages/details.jsp
	
	<action name="product-save" class="com.wt.hello.Product" method="save">
			<result name="details">/WEB-INF/pages/details.jsp</result>
	</action>
	
	在 Product 中定义一个 save 方法

--------------------------------------------------------------------------------------------------------------------------------------


