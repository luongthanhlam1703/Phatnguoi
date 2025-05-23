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

- **easyocr** & **pillow**: Thư viện đọc và xử lý ảnh captcha

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
## File
- main.py: file dùng để set thời gian, và chạy file tracuu.robot

- tracuu.robot: dùng để xử lý các hành động nhập dữ liệu và các ô input và click button

- captcha.py: dùng để xử lý captcha

- world.py: dùng để xử lý in dữ liệu ra world
## Tính năng của chương trình
- Tự động mở trình duyệt web chrome và truy cập link kiểm tra phạt nguội
- Nhập biển số và mã captcha vào ô input và select loại xe
- Nếu như mã captcha sai sẽ tự động reload trang và nhập lại mã captcha
- Nhập mã captcha đến khi nào đúng và web hiển thị kết quả sẽ tiến hành lưu nội dung tra cứu được ra wolrd và lưu vào thư mục ketquatracuu/
- Kết thúc chương trình
## Test nhanh (không theo lịch đã set sẵn)

```bash
robot tracuu.robot
```

## Chạy chương trình chính theo lịch

```bash
python main.py
```
