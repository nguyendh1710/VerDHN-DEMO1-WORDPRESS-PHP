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

Cách chạy:
📝 Bước 1: Cài Docker

Nếu chưa có Docker:

Windows: tải Docker Desktop
 → cài đặt.

macOS/Linux: cài Docker theo hướng dẫn.

Sau khi cài xong, mở Terminal/PowerShell chạy:

docker --version
docker compose version


để chắc chắn Docker đã hoạt động.

📝 Bước 2: Mở Terminal/PowerShell trong thư mục dự án
cd path/to/myproject

📝 Bước 3: Chạy up.sh để khởi động site

Trên Linux/Mac:

sh up.sh


Trên Windows (PowerShell):

bash up.sh


Script sẽ:

Bật container wordpress + db

Chờ database khởi động

Import database/db.sql vào MySQL

→ Mở trình duyệt: http://localhost:8000 → thấy site WordPress chạy.

📝 Bước 4: Làm việc trên site

Bạn có thể:

Sửa theme/plugin trong wp-content (trên máy hoặc qua WP Admin)

Upload ảnh, tạo bài viết mới trên WP Admin

→ WordPress đang chạy trên Docker, dữ liệu ở trong container.

📝 Bước 5: Khi xong, xuất DB + tắt container
sh down.sh


Script sẽ dump database trong container ra file database/db.sql

Tắt container Docker

→ Giờ thư mục myproject/ có code + DB mới nhất.

📝 Bước 6: Đồng bộ GitHub
git add .
git commit -m "Update site"
git push


→ Repo GitHub chứa code + DB mới nhất.

📝 Bước 7: Trên máy khác
git clone https://github.com/<username>/<repo>.git
cd myproject
sh up.sh


→ Máy khác chạy site y hệt máy này.
---------------------
Ý tưởng của up.sh và down.sh:

up.sh = khởi động WordPress + MySQL bằng Docker + import database từ file db.sql (nếu có).

down.sh = xuất database hiện tại trong container ra file db.sql + tắt container.

→ Nhờ vậy: file db.sql trong repo luôn chứa database mới nhất, còn thư mục wp-content chứa theme/plugin/upload mới nhất. Khi đẩy lên GitHub, cả code + DB đều cập nhật.

-------------------

🔄 Quy trình hằng ngày khi bạn làm việc:
🟢 1. Khi bắt đầu làm trên máy:
sh up.sh


Docker bật 2 container: wordpress + mysql

Tự động import file db.sql trong repo vào database MySQL.

Website chạy ở http://localhost:8000.

Bạn vào site sửa theme/plugin, upload ảnh, tạo bài viết… thoải mái.

🔵 2. Khi bạn kết thúc (muốn đồng bộ lên GitHub):
sh down.sh


Script sẽ mysqldump database hiện tại trong container ra file database/db.sql

Tắt container Docker.

Lúc này:

wp-content/ chứa code mới nhất (theme/plugin/ảnh).

database/db.sql chứa database mới nhất.

Bạn chỉ cần:

git add .
git commit -m "Update site"
git push


→ Repo GitHub của bạn sẽ có code + database mới nhất.

🔴 3. Trên máy khác muốn lấy site y hệt:
git clone https://github.com/<username>/<repo>.git
cd repo
sh up.sh


Docker bật container + import database/db.sql (mới nhất)

Website chạy ở http://localhost:8000 y hệt máy trước.

📝 Tóm lại:

sh up.sh = Start + Import DB

sh down.sh = Export DB + Stop

git push = đẩy code + DB mới lên GitHub

Máy khác git pull + sh up.sh = chạy site y hệt

