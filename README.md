JDK 环境变量

JDK 下载地址 https://bell-sw.com/pages/downloads/#mn
下载zip解压到当目录

JAVA_HOME D:\GitHub\Environment\jdk17
找到Path：   新建     %JAVA_HOME%\jre\bin
					%JAVA_HOME%\bin
java 1.8之后以下ClassPath变量无需添加
ClassPath 	.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar; 				

# GRADLE 
通过修改变量更改缓存库位置：
	变量   GRADLE_USER_HOME 
	路径   D:\GitHub\Environment\repo\gradle_repos

# MAVEN 环境变量

MAVEN_HOME D:\GitHub\Environment\maven
找到Path：   新建 %MAVEN_HOME%\bin

# MAVEN

   修改 [此文件](https://github.com/ods-im/Environment/blob/main/maven/conf/settings.xml)    更改缓存库位置及镜像地址
   apache-maven-3.6.3/conf/settings.xml
   1.  <localRepository>D:\repo\maven_repos</localRepository>
   2.
    <mirrors>
    <!-- mirror
     | Specifies a repository mirror site to use instead of a given repository. The repository that
     | this mirror serves has an ID that matches the mirrorOf element of this mirror. IDs are used
     | for inheritance and direct lookup purposes, and must be unique across the set of mirrors.
     |
    <mirror>
      <id>mirrorId</id>
      <mirrorOf>repositoryId</mirrorOf>
      <name>Human Readable Name for this Mirror.</name>
      <url>http://my.repository.com/repo/path</url>
    </mirror>
     -->
<!--       1. 阿里云得远程仓库 -->
    <mirror>
        <id>nexus-aliyun</id>
        <name>Nexus aliyun</name>
        <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
        <mirrorOf>central</mirrorOf>
    </mirror>
<!--       2. maven官方运维的2号仓库 -->
    <mirror>
        <id>repo2</id>
        <name>Mirror from Maven Repo2</name>
        <url>http://repo2.maven.org/maven2/</url>
        <mirrorOf>central</mirrorOf>
    </mirror>

<!--       3. maven在UK架设的仓库 -->

    <mirror>
        <id>ui</id>
        <name>Mirror from UK</name>
        <url>http://uk.maven.org/maven2/</url>
        <mirrorOf>central</mirrorOf>
    </mirror>
<!--       4. JBoss的仓库 -->

    <mirror>
        <id>jboss-public-repository-group</id>
        <mirrorOf>central</mirrorOf>
        <name>JBoss Public Repository Group</name>
        <url>http://repository.jboss.org/nexus/content/groups/public</url>
    </mirror>
  </mirrors>
   
   
# [GRADLE 国内镜像](https://github.com/GlieseStudio/Environment/blob/main/.gradle/init.gradle)

# [GRADLE 全局代理](https://github.com/GlieseStudio/Environment/blob/main/.gradle/gradle.properties)