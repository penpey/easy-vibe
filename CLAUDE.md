# CLAUDE.md

本文件用于指导 Claude Code 在此仓库中工作。

## 分支说明：study-notes

这是从 `datawhalechina/easy-vibe` fork 过来的**个人学习分支**。所有学习笔记、注解、练习代码都放这里 —— `main` 分支保持干净，只用来同步上游更新。

**双 remote 配置：**
- `origin` → github.com/penpey/easy-vibe (你的 fork，推送用)
- `upstream` → github.com/datawhalechina/easy-vibe (原始仓库，拉取更新用)

## 课程概览

Easy-Vibe 是一个渐进式 AI Vibe Coding 课程，分四个阶段：

| 阶段 | 名称 | 目标 |
|------|------|------|
| Stage 1 | AI 产品经理 | 产品思维 + AI IDE 工具 → 做出可演示的原型 |
| Stage 2 | 初中级开发工程师 | 全栈：前端、后端、数据库、部署、支付 |
| Stage 3 | 高级开发工程师 | MCP、Agent Teams、跨平台开发、RAG |
| Appendix | 知识字典 | 9 大领域、80+ 主题 — 随查随用 |

## 学习计划

详见 `docs/superpowers/specs/2026-05-18-learning-plan-design.md`，共 22 周的详细排期（方案 A，按阶段顺序推进，约 4-5 个月）。

## 日常学习流程

### 1. 启动文档服务

```bash
npm run dev
```

浏览器打开 `http://localhost:5173`，交互式组件（动画、模拟器）必须本地运行才能看。

### 2. 同步上游更新（需要时）

```bash
git checkout main
git pull upstream main
git checkout study-notes
git merge main
# 如果有冲突就解决，然后：
git push origin main study-notes
```

### 3. 在原文下面记笔记

每章在 `docs/zh-cn/stage-{N}/{章节目录}/index.md`，直接在末尾追加笔记：

```markdown
---

## Penpey 笔记 (2026-05-19)

- 核心收获：...
- 疑问：...
- 练习：用 XX 做了个小 demo
```

### 4. 做 Stage 2 实战项目

`docs/zh-cn/stage-2/assignments/` 下有 8 个真实项目，每个都带 PRD 文档。这是课程的精髓 —— 用 Cursor、Claude Code 等 AI IDE 跟着做。

### 5. 提交并推送

```bash
git add -A
git commit -m "第 X 章笔记 + 练习"
git push origin study-notes
```

## 课程导航建议

- 从 **Stage 1 学习地图**开始：`docs/zh-cn/stage-1/learning-map/index.md`
- 每章三步走：**读文档 → 跟做示例 → 换自己的想法复现**
- 遇到不懂的概念，先去 **Appendix** (`docs/zh-cn/appendix/`) 查，不要卡住超过 30 分钟
- Stage 2 和 3 的英文版（`en/`）翻译完成度最高，必要时可以作为参考

## 本地开发环境要点

- Node.js >= 18
- VitePress 开发服务器端口 5173
- 交互式 Vue 组件（LLM 原理演示、Git 可视化、终端模拟器等）只在本地运行生效 —— 这是为什么要用 `npm run dev` 而不是直接看 markdown 的原因
- 图片查看：点击任意图片可缩放（Viewer.js）
- 暗色模式：顶部导航栏切换
- 阅读设置：齿轮图标调节字号/行高（自动保存到浏览器）

## 各阶段完成标志

- **Stage 1 完成**：能从想法出发 → 验证需求 → 用 AI 做出可运行的产品原型
- **Stage 2 完成**：能独立构建并部署一个带数据库、API、支付的全栈 SaaS 应用
- **Stage 3 完成**：能开发跨平台应用、使用 MCP、编排 AI Agent、实现 RAG

## Git Hooks 说明

项目配置了 husky hooks，**但只有修改 Vue 文件时才会触发**，只改 markdown 不受影响：

- `pre-commit`：运行 ESLint + `npm run build`，跳过用 `git commit --no-verify`
- `pre-push`：运行 `npm run build:force`，跳过用 `git push --no-verify`

## GitHub Actions 部署

`.github/workflows/deploy.yml` 限制只有 `datawhalechina` 仓库才触发，**在你的 fork 上不会运行**。如果以后想用自己的 fork 部署到 GitHub Pages，需要单独配置。

## 文件规范

- 章节用 kebab-case 目录名 + `index.md`
- Prettier：无分号、单引号、无尾逗号（`npm run format` 自动格式化）
- 图片用相对路径引用
