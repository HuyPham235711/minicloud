# HƯỚNG DẪN KIỂM THỬ VÀ CHỤP ẢNH MINH CHỨNG

**Dự án:** PhamGiaHuy_PhamKhanhLinh MiniCloud  
**EC2 Public IP:** 13.213.68.94  
**Ngày hoàn thành:** 17/11/2025

---

## ��� DANH SÁCH 11 SERVICES ĐANG CHẠY

```bash
docker compose ps
```

**Kết quả mong đợi:** 11 containers đều ở trạng thái **Up**

---

## 1️⃣ WEB FRONTEND SERVER (Nginx)

### URL truy cập:
- **Trang chủ:** http://13.213.68.94/ hoặc http://13.213.68.94:8083/
- **Blog index:** http://13.213.68.94/blog/
- **Blog 1 - Cloud Computing:** http://13.213.68.94/blog/blog1.html
- **Blog 2 - Docker:** http://13.213.68.94/blog/blog2.html
- **Blog 3 - Monitoring:** http://13.213.68.94/blog/blog3.html
- **Web Server 2:** http://13.213.68.94:8082/ (để test load balancing)

### Lệnh test:
```bash
curl http://13.213.68.94/
curl http://13.213.68.94/blog/
```

### Chụp ảnh:
- Trang chủ hiển thị MyMiniCloud – Home
- Blog index có 3 bài viết
- Mỗi bài blog có nội dung đầy đủ

---

## 2️⃣ APPLICATION BACKEND SERVER (Flask)

### URL truy cập:
- **API Hello:** http://13.213.68.94/api/hello
- **API Student:** http://13.213.68.94/student/
- **Direct access:** http://13.213.68.94:8085/hello

### Lệnh test:
```bash
curl http://13.213.68.94/api/hello
curl http://13.213.68.94/student/
```

### Kết quả mong đợi:
```json
{message:Hello from App Server!}
[{id:1,major:IT,name:Pham Gia Huy},{id:2,major:IT,name:Pham Khanh Linh}]
```

### Chụp ảnh:
- JSON response từ /api/hello
- JSON response từ /student/

---

## 3️⃣ RELATIONAL DATABASE SERVER (MariaDB)

### Lệnh test:
```bash
# Show all databases
docker exec relational-database-server mariadb -uroot -proot -e SHOW DATABASES
