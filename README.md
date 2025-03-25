# raspberry_pi5_RTSP

在 Raspberry Pi 5 上安裝並使用 **MediaMTX（RTSP Server）**，支援 USB 攝影機即時串流，並整合低延遲推流與開機自動啟動設定。

---

## 🚀 安裝與開機啟動設定

1. 給腳本執行權限：

    ```bash
    chmod +x install_and_autostart.sh
    ```

2. 執行腳本，將自動完成以下步驟：
    - 下載並安裝 MediaMTX
    - 搬移執行檔到 `/usr/local/bin`
    - 建立並啟用 systemd 開機自動啟動服務

    ```bash
    sudo ./install_and_autostart.sh
    ```

3. 檢查 MediaMTX 狀態：

    ```bash
    sudo systemctl status mediamtx
    ```

---

## 🎥 低延遲 RTSP 推流

使用 USB 攝影機（例如 `/dev/video0`）推流：

1. 給推流腳本權限：

    ```bash
    chmod +x low_latency_push.sh
    ```

2. 執行推流腳本：

    ```bash
    ./low_latency_push.sh
    ```

3. 預設會將影像串流至：

    ```
    rtsp://<樹梅派IP>:8554/mystream
    ```

---

## 📺 VLC 播放設定（建議調整）

為降低延遲，建議調整 VLC：

- 工具 → 偏好設定（左下角選「全部」）
- 前往：**輸入 / 編解碼器**
- 將「網路快取 (ms)」改為：`200`（或更小）
- 儲存後重新啟動 VLC

---

## 📁 專案檔案說明

| 檔案名稱                 | 說明                                |
|--------------------------|-------------------------------------|
| `install_and_autostart.sh` | 安裝 MediaMTX 並設定開機自動啟動     |
| `low_latency_push.sh`      | 使用 FFmpeg 推送低延遲 RTSP 串流     |
| `README.md`                | 使用說明與設定文件                   |

---

## 🛠️ 錯誤排查：ffmpeg 找不到格式？

如果看到以下錯誤：

