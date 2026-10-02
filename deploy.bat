@echo off
REM ============================================================
REM  mliko 博客一键部署脚本（部署到 GitHub Pages 的 main 分支）
REM  前提：本机已安装 Git，且已登录 GitHub（或已配置 PAT 凭证）
REM  用法：在 E:\blog-clean 目录下双击运行，或命令行执行 deploy.bat
REM  说明：脚本会克隆线上仓库到临时目录，把本地 public/ 同步进去再推送
REM ============================================================
setlocal
set "REPO=https://github.com/mliko1/mliko1.github.io.git"
set "TMPD=%TEMP%\mliko-blog-deploy"

if exist "%TMPD%" rmdir /s /q "%TMPD%"

echo [1/4] 克隆线上仓库...
git clone --depth 1 "%REPO%" "%TMPD%"
if errorlevel 1 (
  echo 克隆失败：请检查网络连接与 GitHub 登录状态。
  exit /b 1
)

echo [2/4] 同步构建结果 public/ ...
xcopy /E /Y /I "public\*" "%TMPD%\" >nul
REM 确保 .nojekyll 存在（防止 GitHub Pages 用 Jekyll 处理导致静态文件 404）
if not exist "%TMPD%\.nojekyll" copy /Y nul "%TMPD%\.nojekyll" >nul

cd /d "%TMPD%"
echo [3/4] 提交变更...
git add -A
git commit -m "deploy: update blog (%date% %time%)"
if errorlevel 1 echo 没有需要提交的新变更。

echo [4/4] 推送到 main 分支...
git push origin main
if errorlevel 1 (
  echo 推送失败：请确认 GitHub 写入权限（需要能 push 到 mliko1.github.io）。
  exit /b 1
)

echo.
echo 部署完成！等待 1~2 分钟让 GitHub Pages 生效：
echo   https://mliko1.github.io/
endlocal
