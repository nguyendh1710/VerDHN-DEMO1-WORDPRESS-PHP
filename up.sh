#!/bin/bash
docker-compose up -d
# chờ DB sẵn sàng
sleep 15
if [ -f "./database/db.sql" ]; then
  echo "Nhập database từ db.sql..."
  docker exec -i $(docker-compose ps -q db) mysql -uroot -pexample wordpress < database/db.sql
else
  echo "Không tìm thấy file db.sql, bỏ qua bước import."
fi
