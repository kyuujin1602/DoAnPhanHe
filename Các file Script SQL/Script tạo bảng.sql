-- Tạo bảng 
-- Bảng NHANSU
CREATE TABLE DAPH_NHANSU(
    MANV VARCHAR(20) PRIMARY KEY,
    HOTEN VARCHAR2(100),
    PHAI VARCHAR2(5),
    NGSINH DATE,
    PHUCAP INT,
    DT VARCHAR(15),
    VAITRO VARCHAR2(100),
    MADV VARCHAR(15)
);

-- Bảng SINHVIEN
CREATE TABLE DAPH_SINHVIEN(
    MASV VARCHAR(20) PRIMARY KEY,
    HOTEN VARCHAR2(100),
    PHAI VARCHAR2(5),
    NGSINH DATE,
    DCHI VARCHAR2(200),
    DT VARCHAR(15),
    MACT VARCHAR(15),
    MANGANH VARCHAR(15),
    SOTCTL INT,
    DTBTL FLOAT
);

-- Bảng DONVI
CREATE TABLE DAPH_DONVI(
    MADV VARCHAR(15) PRIMARY KEY,
    TENDV VARCHAR2(100),
    TRGDV VARCHAR(15)
);

-- Bảng HOCPHAN
CREATE TABLE DAPH_HOCPHAN(
    MAHP VARCHAR(15) PRIMARY KEY,
    TENHP VARCHAR2(100),
    SOTC INT,
    STLT INT,
    STTH INT,
    SOSVTD INT,
    MADV VARCHAR(15),
    MACT VARCHAR(15)
);

-- Bảng KHMO
CREATE TABLE DAPH_KHMO(
    MAHP VARCHAR(15),
    HK INT,
    NAM INT,
    MACT VARCHAR(5),
    PRIMARY KEY(MAHP, HK, NAM, MACT)
);

-- Bảng PHANCONG
CREATE TABLE DAPH_PHANCONG(
    MAGV VARCHAR(20),
    MAHP VARCHAR(15),
    HK INT, 
    NAM INT, 
    MACT VARCHAR(5),
    PRIMARY KEY(MAGV, MAHP, HK, NAM, MACT)
);

-- Bảng DANGKY
CREATE TABLE DAPH_DANGKY(
    MASV VARCHAR(20),
    MAGV VARCHAR(20),
    MAHP VARCHAR(15),
    HK INT, 
    NAM INT,
    MACT VARCHAR(5),
    DIEMTH FLOAT,
    DIEMQT FLOAT,
    DIEMCK FLOAT,
    DIEMTK FLOAT,
    PRIMARY KEY(MASV, MAGV, MAHP, HK, NAM, MACT)
);

-- Bảng DANGKY dành cho Sinh viên thực hiện đăng ký
CREATE TABLE DAPH_DANGKY_SV (
    MASV VARCHAR(20),
    MAHP VARCHAR(15),
    HK INT, 
    NAM INT,
    MACT VARCHAR(5),
    PRIMARY KEY (MASV, MAHP, HK, NAM, MACT)
);

-- Bảng THONGBAO sử dụng cho OLS
CREATE TABLE DAPH_THONGBAO(
    NOIDUNG varchar2(255),
    NGAY Date,
    CHUCVU number, -- 6: Truong khoa, 5: Truong don vi, 4: Giang vien, 3: Giao vu:, 2: Nhan vien, 1: Sinh vien (Co phan biet thu tu)
    NGANH number, -- 0: Khong thuoc linh vuc 1: HTTT, 2: CNPM, 3: KHMT, 4: CNTT, 5: TGMT, 6: MMT, 7: Tat ca linh vuc
    COSO number -- 1: Co so 1, 2: Co so 2
);


-- Tạo liên kết khóa phụ giữa các bảng
ALTER TABLE DAPH_NHANSU
ADD CONSTRAINT FK_DAPH_NHANSU_DONVI
FOREIGN KEY (MADV)
REFERENCES DAPH_DONVI(MADV);

ALTER TABLE DAPH_HOCPHAN
ADD CONSTRAINT FK_DAPH_HOCPHAN_DONVI
FOREIGN KEY (MADV)
REFERENCES DAPH_DONVI(MADV);

ALTER TABLE DAPH_KHMO
ADD CONSTRAINT FK_DAPH_KHMO_HOCPHAN
FOREIGN KEY (MAHP)
REFERENCES DAPH_HOCPHAN(MAHP);

ALTER TABLE DAPH_PHANCONG
ADD CONSTRAINT FK_DAPH_PHANCONG_NHANSU
FOREIGN KEY (MAGV)
REFERENCES DAPH_NHANSU(MANV);

ALTER TABLE DAPH_PHANCONG
ADD CONSTRAINT FK_DAPH_PHANCONG_HOCPHAN
FOREIGN KEY (MAHP)
REFERENCES DAPH_HOCPHAN(MAHP);

ALTER TABLE DAPH_DANGKY
ADD CONSTRAINT FK_DAPH_DANGKY_SINHVIEN
FOREIGN KEY (MASV)
REFERENCES DAPH_SINHVIEN(MASV);

ALTER TABLE DAPH_DANGKY
ADD CONSTRAINT FK_DAPH_DANGKY_NHANSU
FOREIGN KEY (MAGV)
REFERENCES DAPH_NHANSU(MANV);

ALTER TABLE DAPH_DANGKY
ADD CONSTRAINT FK_DAPH_DANGKY_HOCPHAN
FOREIGN KEY (MAHP)
REFERENCES DAPH_HOCPHAN(MAHP);

ALTER TABLE DAPH_DANGKY_SV
ADD CONSTRAINT FK_DANGKYSV_SINHVIEN
FOREIGN KEY (MASV)
REFERENCES DAPH_SINHVIEN(MASV);

ALTER TABLE DAPH_DANGKY_SV
ADD CONSTRAINT FK_DANGKYSV_HOCPHAN
FOREIGN KEY (MAHP)
REFERENCES DAPH_HOCPHAN(MAHP);