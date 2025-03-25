# raspberry_pi5_RTSP

本專案用於在 **Raspberry Pi 5** 上安裝並設定 **MediaMTX（RTSP Server）**，支援 RTSP 推流與開機自動啟動。

---

## 🚀 安裝與自動啟動設定

1. 下載本專案後，先給腳本執行權限：

    ```bash
    chmod +x install_and_autostart.sh
    ```

2. 執行腳本，自動完成下載、安裝、與開機啟動設定：

    ```bash
    sudo ./install_and_autostart.sh
    ```

3. 執行完成後，可檢查服務狀態：

    ```bash
    sudo systemctl status mediamtx
    ```

---

## 📡 RTSP 使用方式

MediaMTX 啟動後會監聽以下通訊埠（預設）：

| 協定   | 通訊埠           | 功能描述         |
|--------|------------------|------------------|
| RTSP   | `8554` (TCP)     | 串流主用         |
| RTP    | `8000` (UDP)     | 傳送視訊資料流   |
| RTMP   | `1935`           | 可選直播支援     |
| HLS    | `8888` (HTTP)    | 播放器支援       |
| WebRTC | `8889`, `8189`   | 瀏覽器串流支援   |
| SRT    | `8890` (UDP)     | 穩定低延遲串流   |

---

## 📤 推流範例（使用 USB 攝影機）

用 FFmpeg 從 `/dev/video0` 推送 RTSP 串流：

```bash
ffmpeg -f v4l2 -i /dev/video0 -f rtsp rtsp://localhost:8554/mystream
