Hướng dẫn cách dùng: clone → ./up.sh → chỉnh sửa site → ./down.sh để lưu database → commit + push → máy khác clone lại + ./up.sh.


Chạy trên máy khác

Trên máy khác (đã cài Docker):

git clone https://github.com/<username>/<repo>.git
cd myproject
sh up.sh


→ WordPress + Database chạy ngay ở http://localhost:8000.

-> Ghi nhớ

File wp-config.php không cần đưa vào repo (Docker tự tạo khi bạn setup lần đầu).

Mỗi lần thay đổi code + DB xong, chạy sh down.sh để export DB mới, commit lên GitHub → máy khác chỉ cần sh up.sh là có site y hệt.

