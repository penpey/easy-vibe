# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working in this repository.

## Branch: study-notes

This is a **personal learning branch** forked from `datawhalechina/easy-vibe`. All learning notes, annotations, and experiments go here — `main` stays clean for syncing upstream updates.

**Two remotes:**
- `origin` → github.com/penpey/easy-vibe (personal fork, push here)
- `upstream` → github.com/datawhalechina/easy-vibe (original repo, pull updates)

## Curriculum Overview

Easy-Vibe is a progressive AI Vibe Coding curriculum. Four stages:

| Stage | Title | Goal |
|-------|-------|------|
| Stage 1 | AI 产品经理 | Product thinking + AI IDE tools → build a demoable prototype |
| Stage 2 | 初中级开发工程师 | Full-stack: frontend, backend, database, deployment, billing |
| Stage 3 | 高级开发工程师 | MCP, Agent Teams, cross-platform apps, RAG |
| Appendix | 知识字典 | 9 areas, 80+ topics — reference on demand |

Primary content language: **Chinese (zh-cn)**. English version also available.

## Learning Plan

See `docs/superpowers/specs/2026-05-18-learning-plan-design.md` for the full 22-week schedule (方案 A).

This plan is designed for **Stage 1 → Stage 2 → Stage 3** sequential progression, about 4-5 months total.

## Daily Learning Workflow

### 1. Start the docs server

```bash
npm run dev
```

Open `http://localhost:5173` — read with interactive components (animations, simulators).

### 2. Sync upstream updates (when needed)

```bash
git checkout main
git pull upstream main
git checkout study-notes
git merge main
# Resolve conflicts if any, then:
git push origin main study-notes
```

### 3. Take notes inline

Each chapter is at `docs/zh-cn/stage-{N}/{chapter-name}/index.md`. Read the content, then append your notes directly:

```markdown
<!-- Original chapter content above -->

---

## Penpey's Notes (2026-05-19)

- Key takeaway: ...
- Question: ...
- Practice: built a small demo using XYZ
```

### 4. Practice: Stage 2 assignments

`docs/zh-cn/stage-2/assignments/` contains 8 real projects with PRD documents. These are the core hands-on exercises — use AI IDE tools (Cursor, Claude Code) to build them.

### 5. Build & push

```bash
git add -A
git commit -m "docs: chapter 1 notes + snake game practice"
git push origin study-notes
```

## How to Navigate the Curriculum

- Start at **Stage 1 learning map**: `docs/zh-cn/stage-1/learning-map/index.md`
- Each chapter: **read → follow example → recreate with your own idea**
- Get stuck on a concept? Check the **Appendix** (`docs/zh-cn/appendix/`) before searching externally — it covers computer fundamentals, AI principles, frontend/backend basics, etc.
- The `en/` locale has the most completed translations for Stage 2 and 3

## Key Local Dev Info

- Node.js >= 18
- VitePress dev server on port 5173
- Interactive Vue components (LLM demos, Git visualizer, terminal emulator, etc.) only work locally — they're the main reason to run `npm run dev` instead of reading raw markdown
- Image viewer: click any image to zoom (Viewer.js)
- Dark mode: toggle in top nav
- Reading settings: gear icon → adjust font size / line height (persisted in localStorage)

## Success checkpoints

- **Stage 1 done**: You can take an idea → validate it → build a working prototype with AI
- **Stage 2 done**: You can build and deploy a full-stack SaaS app with database, API, and payments
- **Stage 3 done**: You can build cross-platform apps, use MCP, orchestrate AI agents, and implement RAG

## Git Hooks (pre-commit / pre-push)

There are husky hooks that run **only when Vue files change**:
- `pre-commit`: Runs ESLint + `npm run build` — skip with `git commit --no-verify`
- `pre-push`: Runs `npm run build:force` — skip with `git push --no-verify`

You probably won't hit these unless you edit interactive Vue components. Markdown-only changes bypass them.

## Note: GitHub Actions Deploy

The `.github/workflows/deploy.yml` only triggers when `github.repository_owner == 'datawhalechina'`, so **it won't run on your fork**. If you ever want to deploy your fork to GitHub Pages, you'd need a separate workflow.

## File & Formatting

- Chapters use kebab-case directories with `index.md`
- Prettier: no semicolons, single quotes, no trailing commas (`npm run format` to auto-format)
- All images use relative paths from the markdown file location
