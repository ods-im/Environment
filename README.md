
# GRADLE 
推荐方法：在gradle的安装目录，编辑bin文件夹下的gradle文件，
          增加 [此行](https://github.com/GlieseStudio/Environment/blob/main/gradle/bin/gradle#L47) 更改缓存库位置

其他方法：通过修改变量更改缓存库位置：
	       变量   GRADLE_USER_HOME 
	       路径       D:\Program Files\repo\gradle_repos
	
# MAVEN
   修改 [此文件](https://github.com/GlieseStudio/Environment/blob/main/apache-maven-3.6.3/conf/settings.xml)    更改缓存库位置及镜像地址
   
# [GRADLE 国内镜像](https://github.com/GlieseStudio/Environment/blob/main/.gradle/init.gradle)

# [GRADLE 全局代理](https://github.com/GlieseStudio/Environment/blob/main/.gradle/gradle.properties)