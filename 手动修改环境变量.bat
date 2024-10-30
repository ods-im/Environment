@echo off
:: 设置控制台代码页为 UTF-8
chcp 65001 > nul

:: 检查是否以管理员身份运行
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 请以管理员身份重新运行此脚本！
    pause
    exit /b
)

:: 切换到批处理文件所在的目录
cd /d "%~dp0"

:: 获取当前目录
set "CURRENT_DIR=%CD%"

:: 提示用户输入 JAVA_HOME
:input_java_home
set /p JAVA_HOME="请输入 JAVA_HOME 的路径 (例如 C:\path\to\jdk): "
if not exist "%JAVA_HOME%" (
    echo 输入的路径不存在，请重新输入。
    goto input_java_home
)
setx JAVA_HOME "%JAVA_HOME%" /M

:: 提示用户输入 MAVEN_HOME
:input_maven_home
set /p MAVEN_HOME="请输入 MAVEN_HOME 的路径 (例如 C:\path\to\maven): "
if not exist "%MAVEN_HOME%" (
    echo 输入的路径不存在，请重新输入。
    goto input_maven_home
)
setx MAVEN_HOME "%MAVEN_HOME%" /M

:: 设置 GRADLE_USER_HOME
set "GRADLE_USER_HOME=%CURRENT_DIR%\repo\gradle_repos"
setx GRADLE_USER_HOME "%GRADLE_USER_HOME%" /M

:: 获取当前的 PATH 环境变量
for /f "usebackq tokens=*" %%i in (`%SystemRoot%\System32\reg.exe query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path`) do set "current_path=%%i"

:: 提取实际的路径字符串
setlocal enabledelayedexpansion
set "path_value="
for /f "tokens=2*" %%a in ('echo !current_path! ^| findstr /c:"REG_SZ"') do set "path_value=%%b"
endlocal & set "current_path=%path_value:~1,-1%"

:: 定义需要追加的新路径
set "new_paths=%JAVA_HOME%\bin;%MAVEN_HOME%\bin"

:: 检查并追加新的路径到 PATH 中
set "updated_path=%current_path%"
for %%p in (%new_paths%) do (
    if not "!current_path:%%p;=!" == "%current_path%" (
        echo 跳过已存在的路径: %%p
    ) else (
        if "%updated_path%"=="" (
            set "updated_path=%%p"
        ) else (
            set "updated_path=!updated_path!;%%p"
        )
    )
)

:: 更新系统环境变量 PATH
if not "%updated_path%"=="%current_path%" (
    setx PATH "%updated_path%" /M
) else (
    echo PATH 环境变量无需更改。
)

:: 获取当前的 CLASSPATH 环境变量
for /f "tokens=2*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v CLASSPATH') do set "current_classpath=%%b"

:: 如果 CLASSPATH 不存在，则初始化为空
if "%current_classpath%"=="" (set "current_classpath=")

:: 追加新的类路径
set "new_classpath=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar"

:: 将新路径添加到现有的 CLASSPATH 中
set "updated_classpath=%current_classpath%;%new_classpath%"

:: 更新系统环境变量 CLASSPATH
if not "%updated_classpath%"=="%current_classpath%" (
    setx CLASSPATH "%updated_classpath%" /M
) else (
    echo CLASSPATH 环境变量无需更改。
)

:: 输出设置结果
if %errorlevel% equ 0 (
    echo 环境变量已成功设置。
) else (
    echo 设置环境变量失败，请检查是否有足够的权限或参数是否正确。
)

:: 提示用户重启命令提示符窗口
echo.
echo 请关闭并重新打开命令提示符窗口以使环境变量更改生效。
pause