# xiangmu
ssh+easyui+bootstrap管理系统项目
## 第一步 ##

	把changshixi.sql导入Navicat Premium中
	右键->Execute SQL File把sql文件导入，进行初始化
	
## 第二步 ##
 
	把项目导入eclipse
## 第三步 ##
	
	把src下bean.xml文件中的
	<!-- 配置c3p0连接池 -->
	<bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
		<!-- 注入属性值 -->
		<property name="driverClass" value="com.mysql.jdbc.Driver"></property>
		<property name="jdbcUrl" value="jdbc:mysql:///changshixi"></property>
		<property name="user" value="root"></property>
		<property name="password" value="123456"></property>
		
	</bean>
	中的value="root"换成value="本机MySQL的用户名"
	value="123456"换成value="本机MySQL的密码"
## 第四步 ##
>配置一下JRE
	
	window->preferences->java->Installed JREs->Add...
	选择本机的jdk（或jre)位置就行了


	
