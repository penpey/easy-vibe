#!/bin/bash
# 同步上游到 main，再合并到 learning

set -e

echo "[1/6] 切换到 main..."
git checkout main

echo "[2/6] 拉取上游更新..."
git fetch upstream

echo "[3/6] 合并 upstream/main → main..."
git merge upstream/main

echo "[4/6] 推送到 origin main..."
git push origin main

echo "[5/6] 切换到 learning..."
git checkout learning

echo "[6/6] 合并 main → learning..."
git merge main

echo "[7/7] 推送 learning 到 origin..."
git push origin learning

echo "✅ 同步完成！"
