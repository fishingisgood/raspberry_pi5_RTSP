#!/bin/bash

# 顯示本機 IP，方便 VLC 播放用
echo "📡 你可以在 VLC 播放：rtsp://$(hostname -I | awk '{print $1}'):8554/mystream"
echo "🎥 正在從 /dev/video0 推送低延遲 RTSP 串流..."

ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 \
-c:v libx264 -preset ultrafast -tune zerolatency -f rtsp \
rtsp://localhost:8554/mystream
