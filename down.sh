#!/bin/bash
echo "Xuất database sang database/db.sql..."
docker exec $(docker-compose ps -q db) mysqldump -uroot -pexample wordpress > database/db.sql
docker-compose down
