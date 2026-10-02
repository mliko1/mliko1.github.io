# 项目长期笔记 (blog-clean)

- 站点：Hugo + ananke 主题，源码在 `E:\blog-clean`，构建产物 `public/`。
- 部署目标：GitHub Pages 仓库 `mliko1.github.io` 的 `main` 分支根目录（直接存 `public/` 内容，需含 `.nojekyll`）。
- 部署方式：本机 git / GitHub Desktop / `deploy.bat`（需要本机 GitHub 写入凭证）。**GitHub 连接器在本环境不可靠，不能用于自动部署 Hugo 站点**（文本通道推不了压缩单行 HTML 与二进制图）。
- 本地 Hugo：托管安装 extended v0.166.0 于 `C:\Users\Mliko\.workbuddy\binaries\hugo\hugo.exe`。
