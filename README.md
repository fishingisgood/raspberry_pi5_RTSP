# raspberry_pi5_RTSP

這個專案用於在 **Raspberry Pi 5** 上快速安裝與執行 **MediaMTX（RTSP Server）**。

---

## 📦 安裝步驟

1. 下載專案後，給予執行權限：

    ```bash
    cd raspberry_pi5_RTSP
    chmod +x run.sh
    ```

2. 執行安裝腳本：

    ```bash
    sudo ./run.sh
    ```

3. 安裝完成後，你可以直接執行 MediaMTX：

    ```bash
    mediamtx
    ```

---

## 📡 RTSP 使用說明

MediaMTX 預設會開啟 RTSP 伺服器在 `rtsp://<你的樹梅派IP>:8554`，你可以使用以下方式推流／拉流：

| 類型 | URL 範例 | 用途 |
|------|----------|------|
| 推流 | `rtsp://<IP>:8554/mystream` | 用 FFmpeg、OBS 等工具上傳串流 |
| 拉流 | `rtsp://<IP>:8554/mystream` | 用 VLC、RTSP 播放器觀看 |

---

## 🎥 FFmpeg 範例（從 USB 攝影機推流）

```bash
ffmpeg -f v4l2 -i /dev/video0 -f rtsp rtsp://localhost:8554/mystream
