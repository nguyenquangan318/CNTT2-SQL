-- INDEX
SELECT COUNT(*) FROM students;

-- Tạo NON_CLUSTERED INDEX
CREATE INDEX idx_avgScore ON students(avgScore);

EXPLAIN SELECT fullName, avgScore
FROM students
WHERE avgScore > 8;

DROP INDEX idx_avgScore ON students;

-- Tạo COMPOSITE INDEX
CREATE INDEX idx_fullName_score ON students(fullName, avgScore);

-- Xóa INDEX
DROP INDEX idx_fullName_score ON students;