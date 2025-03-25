#!/bin/bash

# 設定變數
FILE="mediamtx_v1.11.3_linux_arm64v8.tar.gz"
URL="https://github.com/bluenviron/mediamtx/releases/download/v1.11.3/$FILE"
USER_NAME=$(whoami)
WORK_DIR=$(pwd)
CONFIG_FILE="$WORK_DIR/mediamtx.yml"
EXEC_PATH="/usr/local/bin/mediamtx"
SERVICE_FILE="/etc/systemd/system/mediamtx.service"

echo "🔽 下載 MediaMTX..."
wget -c "$URL" -O "$FILE"

echo "📦 解壓縮檔案..."
tar -xvzf "$FILE"

echo "🚀 安裝執行檔到 /usr/local/bin..."
sudo mv mediamtx /usr/local/bin/

echo "🔧 建立 systemd 服務檔案..."
sudo tee $SERVICE_FILE > /dev/null <<EOF
[Unit]
Description=MediaMTX (RTSP Server)
After=network.target

[Service]
ExecStart=$EXEC_PATH $CONFIG_FILE
Restart=always
User=$USER_NAME
WorkingDirectory=$WORK_DIR

[Install]
WantedBy=multi-user.target
EOF

echo "🔄 載入並啟用開機啟動..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable mediamtx
sudo systemctl start mediamtx

echo "✅ 安裝與自動啟動設定完成！你可以使用以下指令檢查狀態："
echo "    sudo systemctl status mediamtx"
