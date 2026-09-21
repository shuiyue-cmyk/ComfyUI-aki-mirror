#!/usr/bin/env bash
# ComfyUI-aki v3.2 Linux/macOS 合并 + 校验（包本体是 Windows 环境，此脚本仅用于合并校验）
set -euo pipefail
cd "$(dirname "$0")/.."
OUT="ComfyUI-aki-v3.2.7z"
echo "[1/2] merging parts..."
cat ComfyUI-aki-v3.2.7z.part00* > "$OUT"
echo "[2/2] verifying sha256..."
sha256sum -c SHA256SUMS.txt
echo "[OK] done. Extract on Windows with 7-Zip, entry: 绘世启动器.exe"
