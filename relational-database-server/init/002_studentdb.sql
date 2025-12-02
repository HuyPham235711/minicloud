-- Tạo database studentdb
CREATE DATABASE IF NOT EXISTS studentdb;
USE studentdb;

-- Tạo bảng students
CREATE TABLE IF NOT EXISTS students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id VARCHAR(10) NOT NULL UNIQUE,
  fullname VARCHAR(100) NOT NULL,
  dob DATE,
  major VARCHAR(50),
  gpa DECIMAL(3,2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_student_id (student_id),
  INDEX idx_major (major)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Thêm dữ liệu mẫu (3 sinh viên theo yêu cầu + thêm 2 sinh viên nữa)
INSERT INTO students (student_id, fullname, dob, major, gpa) VALUES
  ('22110044', 'Pham Gia Huy', '2004-07-23', 'Information Technology', 3.45),
  ('22110053', 'Pham Khanh Linh', '2004-05-16', 'Information Technology', 3.67),
  ('22110012', 'Nguyen Van An', '2004-03-15', 'Computer Science', 3.21),
  ('22110089', 'Tran Thi Binh', '2004-08-22', 'Software Engineering', 3.78),
  ('22110067', 'Le Hoang Nam', '2004-11-05', 'Information Technology', 3.52);

-- Tạo view để query dễ dàng
CREATE OR REPLACE VIEW v_students_by_major AS
SELECT major, COUNT(*) as total_students, AVG(gpa) as avg_gpa
FROM students
GROUP BY major;

-- Thêm stored procedure để insert student
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS add_student(
  IN p_student_id VARCHAR(10),
  IN p_fullname VARCHAR(100),
  IN p_dob DATE,
  IN p_major VARCHAR(50),
  IN p_gpa DECIMAL(3,2)
)
BEGIN
  INSERT INTO students (student_id, fullname, dob, major, gpa)
  VALUES (p_student_id, p_fullname, p_dob, p_major, p_gpa);
END //
DELIMITER ;

-- Grant permissions
GRANT ALL PRIVILEGES ON studentdb.* TO 'root'@'%';
FLUSH PRIVILEGES;

SELECT 'studentdb created successfully!' as status;
