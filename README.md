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
	
### 7. 动态方法调用

	1>. 以下为动态方法调用的配置
		<!-- 打开允许动态方法调用的开关,默认是false -->
		<constant name="struts.enable.DynamicMethodInvocation" value="true"></constant>
	
	2>. 如何使用
		
		以下例子为：加入 !update ，调用 testDynamicMethodInvocationAction 类中的 update 方法
		http://localhost:8080/StrustWildcardDemo/testDynamicMethodInvocationAction!update.do
	
	3>. 注：默认情况下 Struts 的动态方法处于禁用的状态，一般不推荐使用

### 8. 关于值栈：

	1>. 在第一个项目 StrustsCollocationDemo 中，${ productName } 读取 productName 值时，实际上
		该属性并不在 request 等域对象中，而是从值栈中获取的
	
	2>. 值栈 （valueStack）
		① 可以从 ActionContext 中获取值栈对象
		② 值栈分为两个逻辑部分
			I. Map 栈：实际上是 OgnlContext 类型，是一个 Map，也是对 ActionContext 的一个引用，里面保存这各种 Map：
				requestMap、sessionMap、applicationMap、parameterMap、attributeMap
			II. 对象栈：实际上是CompoundRoot 类型，是一个使用  ArrayList 定义的栈，里面保存各种和当前实例相关的对象，
				是一个数据结构意义的栈
			
### 9. Struts2 利用 s:property 标签和 OGNL 表达式来读取值栈中的属性值

	1>. 值栈中的属性值：

		① 对于对象栈：读取的是对象栈中的某一个对象的属性值
		
		② Map 栈： request、session、application 的一个属性值或一个请求参数的值
	
	2>. 读取对象栈中对象的属性：
	
		① 若想访问 Object Stack 里的某个对象的属性，可以使用以下几种形式之一：
			object.productName ; object.['productName'] ; object.["productName"]
			通常情况下使用 object.productName
			
		② ObjectStack 里的对象可以通过一个从零开始的下标来引用， ObjectStack 里的栈顶对象可以用 [0] 来引用，
			它下面的那个对象可以用[1] 引用
			例：[0].message
			
		③ [n] 的含义是从第 n 个开始搜索，而不是只搜索第 n 个对象
		
		④ 若从栈顶对象开始搜索，则可以省略下标的部分：
			例：message
		
		⑤ 结合 s:property 标签 
			例 ：<s:property value="[0].message" /> 等同于 <s:property value="message" />
		
	3>. 默认情况下，Action 对象会被 Strust2 自动的放到值栈的栈顶。
	
### 10. 使用  EL 表达式进行属性的访问一定可以用  OGNL 表达式进行访问，但是使用 OGNL 表达式进行属性的访问则不一定可以使用  EL 表达式来进行访问
		
### 11. 异常处理 exception-mapping 元素：

	1>. 以下为 struts.xml 中exception-mapping 元素配置的举例：
	
		<action name="product-save" class="com.wt.valueStack.Product"
				method="save">
			
			<exception-mapping result="input" exception="java.lang.ArithmeticException"></exception-mapping>
				
			<result name="input">/input.jsp</result>
			
			<result>/details.jsp</result>
		</action>
	
	2>. exception-mapping 元素： 配置当前 action 的声明式异常处理
		
		① exception： 指定需要捕获的异常类型
		② result： 指定一个响应结果，该结果将在捕获到指定异常时被执行
		
	
	3> 配置全局的异常处理
	
		<global-results>
    		<result name="input">/input.jsp</result>
		</global-results>
		
		<global-exception-mapping>
			<exception-mapping result="input" exception="java.lang.ArithmeticException"></exception-mapping>
		</global-exception-mapping>		
	
### 12.  Struts2 自动把 Action 对象放到值栈中

	放入的时间点为： Struts2 终将调用 Action 类的 Action 方法，但在调用该方法之前：
	
	① 先创建一个 StrutsActionProxy对象
	② 在创建 StrutsActionProxy之后，对其进行初始化时，把 Action 对象放入值栈中
	
### 13. Struts2 中部分通用代码的使用详情

	<1>. property 标签
	
		① s: property: 打印值栈中的属性值的：对于对象栈，打印值栈中对于的属性值
		② 对于 Map 栈，打印 request、session、application 某个属性值 或 某个请求参数的值 
		
	<2>. url 标签
		
		① 创建一个 URL 字符串的
		② 指定包含参数的url值，数字不会被当做是参数处理, Struts2 直接把数字作为属性值 
		③ 对于 value 值会自动的进行 OGNL 解析 
		④ 对于 value 值会自动的进行 OGNL 解析, 若不希望进行 OGNL 解析，则使用单引号引起来 
		⑤ 可构建一个请求 action 的地址
		⑥ 可以获取请求 url 中的参数值，includeParams="get"，此时获取的为 get 请求的参数
		⑦ 可以获取请求 url 中的参数值，includeParams="all"，此时获取的为 post 请求的参数
		
	<3>. set 标签
		
		① s:set: 向 page、request、session、application 域对象中加入一个属性值
		② 对 value 属性值自动的进行 OGNL 解析
		
	<4>. push 标签
		
		① 把一个对象在标签开始后压入到值栈中，标签结束后，弹出值栈
		② 将之前临时创建的对象压入到值栈中，只有在 push 标签内有效，出了标签之后，该对象会自动弹出值栈
	
	<5>. if, else, elseif 标签
	
		可以直接使用值栈中的属性
		
	<6>. iterator 标签
		
		① 遍历集合的，把这个可遍历对象里的每一个对象依次压入和弹出
		② status中的属性值(例：index、count)
		
	<7>. sort 标签
	
		① 可以对集合总的元素进行排序
		② source 为之前加入request中的属性	
		
	<8>. date 标签
	
		① 可以对 Date 对象进行排版
		② 其中的属性format 为对 name 指定的 date 进行排版，formar 为排版的格式指定；属性 var 为排版完成的新的 date 对象
	
	<9>. 注意事项：
		
		a标签中不支持 OGNL解析，需要进行强制的 OGNL 解析，可以为使用  %{} 把属性包装起来，使其进行强制的 OGNL 解析
		
### 14. 表单标签：

		<1>. 使用和 html 的 form 标签的感觉差不多
		<2>. Struts2 的 form 标签会生成一个 table，以进行自动的排版
		<3>. 可以对表单提交的值进行回显： 从栈顶对象开始匹配属性，并把匹配的属性赋到对应的标签的 value 中，
	    若栈顶对象没有对应的对象属性，则依次向下找相对应的属性		
		
### 15. Struts2 主题：

	1. 主题： 为了让所有的 UI 标签产生同样的视觉效果而归集到一起的一组模板
		即： 风格相近的模板被打包为一个主题
	
	2. Struts2提供了三种主题，ajax, simple, css_xhtml，xhtml，
		它默认的是xhtml主题，开发时我们一般都选simple。
		
		<1>. simple主题是最简单的主题，它是最底层的结构，主要用于构建附加的功能或者行为(例如在此主题基础上进行扩展)，
		使用simple主题时，每个UI标签只生成一个简单的HTML元素，不会生成其他额外的内容
		
		<2>. xhtml主题是Struts2的默认主题，它对simple主题进行扩展，在该主题的基础上增加了如下附加的特性：
			
			① 针对HTML标签(如textfield和select标签)使用标准的两列表格布局
			② 每个HTML标签的Label，即可以出现在HTML元素的左边，也可以出现在上边，这取决于labelposition属性的设置。
			③ 自动输出校验错误信息。
			④ 输出JavaScript的客户端校验。
		
		<3>. css_xhtml主题则对原有的xhtml主题进行了扩展，在xhtml主题基础上加入了CSS样式控制
		
		<4>. ajax主题目对xhtml主题目进行了扩展，在xhtml主题上为每个标签提供了额外的Ajax支持。
			ajax主题的Ajax支持是以Dojo和DWR为基础的。ajax主题在xhtml主题基础上增加了如下特性：
			
			① 支持Ajax方式的客户端校验。
			② 支持远程表单的异步提交(最好和submit标签一起使用)。
			③ 提供高级的div标签，允许实现局部更新部分HTML的功能。
			④ 提供高级的a标签，允许动态加载并执行远端的javaScript代码。
			⑤ 提供支持ajax的tabbedPanel
			⑥ 提供"富客户端"模型的pub-sub事件模型
		
	3. 因为Struts2所有的UI标签都是基于主题和模板的，主题和模板是Struts2所有UI标签的核心。
		模板是一个UI标签的外在表示形式，例如：当我们使用<s:select ... ... />标签时，
		Struts2就会根据对应select模板来生成一个有模板特色的下拉列表框。
		如果为所有的UI标签都提供了对应的模板，那么这系列的模板就形成了一个主题。
		
	4. struts2中form的theme修改:
		html页面中使用struts2的ui tag的时候一般都要把theme设置为simple,把每个tag都设置比较麻烦.
		
		我们可以使用如下两种方法修改默认值xhtml:
		
		<1>. 在struts.xml文件中修改默认值:<constant name="struts.ui.theme" value="simple"/>
		
		<2>. 在struts.properties文件中,设置以下语句:struts.ui.theme=simple
		
	5. 需要注意的是：
		
		<1>. Struts2 中全局的默认主题可以在 struts.xml 配置文件中进行修改
			举例如下：
			 <!-- 设置当前 Struts2 全局应用的主题 -->
			<constant name="struts.ui.theme" value="simple"></constant> 
		
		<2>. 局部的主题优于全局的主题，如果想一个局部的主题，在局部进行修改即可，此时主题体现的为局部的主题
		
		<3>. 局部主题修改的方式注意一下两点：
		
			① 可以在 form 标签中设置主题，同时也可在子标签中进行单独的主题设置
			② Struts2 中主题也可利用在request中添加以下的属性进行设置
				举例如下： 
				request.setAttribute("theme", "xhtml");	
	


