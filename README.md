# java_struts2_summarize

用于总结学习java中Struts2的用法以及使用规则

--------------------------------------------------------------------------------------------------------------------------------------

以下各个例子中为 Struts2 的用法介绍：

### 一、项目StrustsCollocationDemo与Struts2One的比较(即使用了Struts2框架与没有使用Struts2框架的比较)
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

### 1. 搭建 Struts2 的开发环境： 三个步骤

	1>. 在lib文件夹中添加与Struts2有关的jar包
	
	2>. 在src文件夹中添加struts.xml的配置文件
	
	3>. 在web.xml文件中 配置 Struts2 的 Filter，以下为相关的配置：
		  <filter>
		      <filter-name>struts2</filter-name>
		      <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter</filter-class>
		  </filter>
		
		  <filter-mapping>
		      <filter-name>struts2</filter-name>
		      <url-pattern>/*</url-pattern>
		  </filter-mapping>
	  
### 2. action 与 Action 类：

	1>. action 代表一个 Struts2 的请求
	
	2>. Action 类：能够处理 Struts2 请求的类
	
		以下为 Action 类的特点：
			① 属性的名字必须遵循与 JavaBeans 属性相同的命名规则
			属性的类型可以是任意类型，从字符串到非字符串（基本数据库类型）之间的数据转换可以自动发生
			
			② 必须有一个不带参的构造器：通过反射创建实例
			
			③ 至少有一个供 Struts2 在执行这个 action 时调用的方法
			
			④ 同一个 A	ction 类可以包含多个 action 方法
			
			⑤ Struts2 会为每一个 HTTP 请求创建一个新的 Action 实例， 即 Action 不是单例，是线程安全的
			
### 3. 在 Action 中访问 WEB 资源：

	1>. 什么是 WEB 资源 
	
		HttpServerRequest, HttpSession, ServletContext 等原生的 Servlet API
		
	2>. 为什么访问 WEB 资源
	
		B\S 应用的 Controller 中必然需要访问 WEB 资源：像域对象中读写属性，读写 Cookie，获取realPath 等 
	
	3>. 如何访问
		
		① 和 Servlet API 解耦的方式：只能访问到有限的  Servlet API 对象，且只能访问其有限的方法
			（读取请求参数，读写域对象的属性，使 session 失效等）
			
			1>. 使用 ActionContext
			
			2>. 实现 XXXAware 接口
			
			3>. 选用的建议，若一个 Action 类中有多个方法，且多个方法都需要使用域对象的 Map 或 Parameters，
			则建议使用 Aware 接口的方式
			
			4>. session 对应的 Map 实际上是 SessionMap 类型的，强转后若调用 invalidate() 方法，可以是其session失效
			
		② 和 Servlet API 耦合的方式：可以访问更多的  Servlet API 对象，且可以调用原生的方法
			
			1>. 使用 ServletActionContext
			
			2>. 实现 ServletXXXAware 接口
			
### 4. 关于 Struts2 请求的扩展名问题

	1>. org.apache.struts2 包下的 default.properties 中配置了 Struts2 应用的一些常量
	
	2>. struts.action.extension 定义了当前 Struts2 应用可以接受的请求的扩展名
	
	3>. 可以 在struts.xml 文件中以常量配置的方式修改 default.properties 所配置的常量
		 例 ： <constant name="struts.action.extension" value="action,do,"></constant>
		 
### 5. ActionSupport

	1>. ActionSupport 是默认的 Action 类，若某个 action 节点没有配置 class 属性，则 ActionSupport 即为
	待执行的 Action 类，而 execute 方法即为要默认执行的 action 方法
	
	<action name="testActionSupport">
		<result>/testActionSupport.jsp</result>		
	</action>
	
	以上的配置信息等同于下方的
	
	<action name="testActionSupport" class="com.opensymphony.xwork2.ActionSupport"
			method="execute">
		<result>/testActionSupport.jsp</result>		
	</action>
	
	2>. 在手工完成字段验证，显示错误消息，国际化等情况下，推荐继承 ActionSupport。

### 6. 通配符的映射规则
	
	1>. 若找到多个匹配，没有通配符的那个将胜出
	
	2>. 若指定的动作不存在，Struts 将会尝试把这个 URI 与任何一个包含着通配符  * 的动作名进行匹配
	
 	3>. 被通配符匹配到的 URI 字符串的子串可以用  {1} {2} 来引用
 	
 		{1} 匹配第一个子串
 		{2} 匹配第二个子串
 		
	4>. {0} 匹配整个 URI
	
	5>. 若 Struts 找到的带有通配符的匹配不止一个，则按照先后顺序进行匹配
	
	6>. * 可以匹配零个或多个字符，但不包括 / 字符，如果想把 / 字符包括在内，需要使用 **，如果需要
	对某个字符进行转义，需要使用 \
	
	


