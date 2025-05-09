# Tự động tra cứu vi phạm giao thông trên trang CSGT

## Thư viện cần thiết
Xem chi tiết trong `requirements.txt`.

## Lệnh cài đặt các thư viện

```bash
pip install -r requirements.txt
```
## Nếu lỗi không lấy được mã captcha
```bash
pip install easyocr
```
```bash
pip install pillow
```
## Mục đích cài đặt các thư viện

- **selenium**: Điều khiển trình duyệt để tự động hóa tra cứu

- **schedule**: Đặt lịch chạy chương trình vào thời gian định trước

- **easyocr** & **pillow**: Đọc và xử lý ảnh captcha

- **python-docx**: Lưu kết quả tra cứu vào file Word


## Hướng dẫn thay đổi cấu hình

### Đổi biển số và loại xe:

- Trong file `tracuu.robot`

- Tại mục `*** Variables ***`

- Thay đổi biển số tại: `${bienso}`

- Thay đổi loại xe tại: `${loaixe}` (ví dụ: Ô tô, Xe máy, Xe đạp điện)

### Set thời gian chạy chương trình:

- Trong file `main.py`

- Thay đổi dòng sau theo thời gian mong muốn:

```python
schedule.every().day.at("06:00").do(run_robot_test)
schedule.every().day.at("12:00").do(run_robot_test)
```

## Test nhanh (không theo lịch đã set sẵn)

```bash
robot tracuu.robot
```

## Chạy chương trình chính theo lịch

```bash
python main.py
```
