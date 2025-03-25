#!/bin/bash

# 設定變數
FILE="mediamtx_v1.11.3_linux_arm64v8.tar.gz"
URL="https://github.com/bluenviron/mediamtx/releases/download/v1.11.3/$FILE"

echo "🔽 開始下載 MediaMTX..."
wget -c "$URL" -O "$FILE"

echo "📦 解壓縮檔案..."
tar -xvzf "$FILE"

echo "🚀 移動執行檔到 /usr/local/bin..."
sudo mv mediamtx /usr/local/bin/

echo "✅ 安裝完成！你可以執行：mediamtx"
