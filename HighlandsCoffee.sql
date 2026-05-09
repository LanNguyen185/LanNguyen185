-- I. Tạo Database
CREATE DATABASE HighlandsCoffee;
USE HighlandsCoffee;

-- II. Tạo các bảng

-- 1. Bảng ChucVu
CREATE TABLE ChucVu (
    MaCV CHAR(10) NOT NULL
        CONSTRAINT PK_ChucVu_MaCV PRIMARY KEY,
    TenCV NVARCHAR(100) NOT NULL,
    MoTaCV NVARCHAR(100) NULL
);

-- 2. Bảng NhanVien
CREATE TABLE NhanVien 
(
    MaNV CHAR(10) NOT NULL
        CONSTRAINT PK_NhanVien_MaNV PRIMARY KEY,
    HoTenNV NVARCHAR(50) NOT NULL,
    GioiTinhNV NVARCHAR(5) NULL,
    SDTNV CHAR(10) NOT NULL,
    DiaChiNV NVARCHAR(50) NOT NULL,
    NgaySinhNV Date NOT NULL,
    MaQL CHAR(10) NULL,    -- Mã nhân viên quản lý
    MaCV CHAR(10) NULL
);

-- 3. Bảng TaiKhoan
CREATE TABLE TaiKhoan 
(
    MaTK CHAR(10) NOT NULL
        CONSTRAINT PK_TaiKhoan_MaTK PRIMARY KEY,
    TenTK NVARCHAR(50) NOT NULL,
    MatKhauTK VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    VaiTro NVARCHAR(50) NOT NULL,
    MaNV CHAR(10) NOT NULL
);

-- 4. Bảng CaLamViec
CREATE TABLE CaLamViec 
(
    MaCa CHAR(10) NOT NULL
        CONSTRAINT PK_CaLamViec_MaCa PRIMARY KEY,
    ThoiGianBDCa TIME NOT NULL,
    ThoiGianKTCa TIME NOT NULL,
    LoaiCa NVARCHAR(10) NOT NULL
);

--5. Bảng Ca_DangKy 
CREATE TABLE Ca_DangKy 
(
    MaNV CHAR(10) NOT NULL,
    MaCa CHAR(10) NOT NULL,
    NgayLam DATE NOT NULL,
    CONSTRAINT PK_Ca_DangKy_MaNV_MaCa PRIMARY KEY (MaNV, MaCa)
);

-- 6. Bảng KhachHang
CREATE TABLE KhachHang 
(
    MaKH CHAR(10) NOT NULL
        CONSTRAINT PK_KhachHang_MaKH PRIMARY KEY,
    HoTenKH NVARCHAR(50) NOT NULL,
    SDTKH CHAR(10) NOT NULL,
    EmailKH NVARCHAR(50) NULL,
);

-- 7. Bảng Ban
CREATE TABLE Ban 
(
    MaBan CHAR(10) NOT NULL
        CONSTRAINT PK_Ban_MaBan PRIMARY KEY,
    SoBan INT NOT NULL,
    ViTriBan NVARCHAR(50) NOT NULL,
    TinhTrangBan NVARCHAR(50) NOT NULL,
    SoGheNgoi INT NULL
);

-- 8. Bảng HinhThucThanhToan
CREATE TABLE HinhThucThanhToan 
(
    MaHTTT CHAR(10) NOT NULL
        CONSTRAINT PK_HinhThucThanhToan_MaHTTT PRIMARY KEY,
    TenHTTT NVARCHAR(50) NOT NULL
);

-- 9. HoaDon_PhieuThanhToan
CREATE TABLE HoaDon_PhieuThanhToan 
(
    MaHD CHAR(10) NOT NULL
        CONSTRAINT PK_HoaDon_PhieuThanhToan_MaHD PRIMARY KEY,
    NgayLapHD DATE NOT NULL,
    ThueVATHD FLOAT NULL,
    ThanhTienHD DECIMAL(18,2) NOT NULL,
    SoTienKhachDua DECIMAL(18,2) NULL,
    SoTienDu DECIMAL(18,2) NULL,
    MaHTTT CHAR(10) NOT NULL
);

-- 10. Bảng DonHang
CREATE TABLE DonHang 
(
    MaDH CHAR(10) NOT NULL
        CONSTRAINT PK_DonHang_MaDH PRIMARY KEY,
    NgayTaoDH DATE NULL,
    TrangThaiDH NVARCHAR(50) NOT NULL,
    MaKH CHAR(10)  NULL,
    MaNV CHAR(10) NOT NULL,
    MaBan CHAR(10)  NULL,
    MaHD CHAR(10) NOT NULL
);

-- 11. DiemTichLuy 
CREATE TABLE DiemTichLuy 
(
    MaKH CHAR(10) NOT NULL,
    MaHD CHAR(10) NOT NULL,
    NgayCapNhatDTL DATE NOT NULL,
    DiemHienTai INT NOT NULL,
    DiemTichLuyTrongNgay INT NULL,
    DiemTichLuyCuoiKy INT NULL,
    CONSTRAINT PK_DiemTichLuy_MaKH_MaHD PRIMARY KEY (MaKH, MaHD)
);

-- 12. Bảng CTKhuyenMai
CREATE TABLE CTKhuyenMai 
(
    MaKM CHAR(10) NOT NULL
        CONSTRAINT PK_CTKhuyenMai_MaKM PRIMARY KEY,
    TenKM NVARCHAR(100) NOT NULL,
    TuNgayKM DATE NOT NULL,
    DenNgayKM DATE NOT NULL,
    LoaiKM NVARCHAR(50) NOT NULL,
    DieuKienKM NVARCHAR(100) NULL
);

-- 13. Bảng DonViTinhSP
CREATE TABLE DonViTinhSP 
(
    MaDVTSP CHAR(10) NOT NULL
        CONSTRAINT PK_DonViTinhSP_MaDVTVSP PRIMARY KEY,
    TenDVTSP NVARCHAR(50) NOT NULL
);

-- 14. Bảng SanPham
CREATE TABLE SanPham 
(
    MaSP CHAR(10) NOT NULL
        CONSTRAINT PK_SanPham_MaSP PRIMARY KEY,
    TenSP NVARCHAR(50) NOT NULL,
    MoTaSP NVARCHAR(200) NULL,
    LoaiSP NVARCHAR(30) NOT NULL,
    MaDVTSP CHAR(10) NOT NULL
);

ALTER TABLE SanPham ADD HinhAnh NVARCHAR(255) NULL;

-- 15. Bảng DonGiaSanPham 
CREATE TABLE DonGiaSanPham 
(
    MaSP CHAR(10) NOT NULL,
    NgayCapNhatGia DATE NOT NULL,
    GiaBan DECIMAL(18,2) NOT NULL,
    CONSTRAINT PK_DonGiaSanPham_MaSP_NgayCapNhatGia PRIMARY KEY (MaSP, NgayCapNhatGia)
);

-- 16. Bảng ChiTietDonHang 
CREATE TABLE ChiTietDonHang 
(
    MaDH CHAR(10) NOT NULL,
    MaSP CHAR(10) NOT NULL,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(18,2) NOT NULL,
    ThanhTienDH DECIMAL(18,2) NULL,
    GhiChuDH NVARCHAR(100) NULL,
    GiamGiaDH DECIMAL(10,0) NULL,
    CONSTRAINT PK_ChiTietDonHang_MaDH_MaSP PRIMARY KEY (MaDH, MaSP)
);

-- 17. Bảng KhuyenMaiSP 
CREATE TABLE KhuyenMaiSP 
(
    MaKM CHAR(10) NOT NULL,
    MaSP CHAR(10) NOT NULL,
    TyLeGiamSP DECIMAL(5,2) NOT NULL,
    CONSTRAINT PK_KhuyenMaiSP_MaKM_MaSP PRIMARY KEY (MaKM, MaSP)
);

-- 18. Bảng KhuyenMaiHD 
CREATE TABLE KhuyenMaiHD 
(
    MaKM CHAR(10) NOT NULL,
    MaHD CHAR(10) NOT NULL,
    TyLeGiamHD DECIMAL(5,2) NOT NULL,
    CONSTRAINT PK_KhuyenMaiHD_MaKM_MaHD PRIMARY KEY (MaKM, MaHD)
);

-- 19. Bảng LoaiNVL
CREATE TABLE LoaiNVL 
(
    MaLoaiNVL CHAR(10) NOT NULL
        CONSTRAINT PK_LoaiNVL_MaLoaiNVL PRIMARY KEY,
    TenLoaiNVL NVARCHAR(50) NOT NULL
);

-- 20. Bảng DonViTinhNL
CREATE TABLE DonViTinhNL 
(
    MaDVTNL CHAR(10) NOT NULL
        CONSTRAINT PK_DonViTinhNL_MaDVTNL PRIMARY KEY,
    TenDVTNL NVARCHAR(50) NOT NULL
);

-- 21. Bảng NguyenLieu
CREATE TABLE NguyenLieu 
(
    MaNL CHAR(10) NOT NULL
        CONSTRAINT PK_NguyenLieu_MaNL PRIMARY KEY,
    TenNL NVARCHAR(50) NOT NULL,
    NgayHetHanNL DATE NOT NULL,
    MaLoaiNVL CHAR(10) NOT NULL,
    MaDVTNL CHAR(10) NOT NULL
);

-- 22. Bảng DinhMuc 
CREATE TABLE DinhMuc 
(
    MaSP CHAR(10) NOT NULL,
    MaNL CHAR(10) NOT NULL,
    SoLuongSD INT NOT NULL,
    CONSTRAINT PK_DinhMuc_MaSP_MaNL PRIMARY KEY (MaSP, MaNL)
);

-- 23. Bảng PhieuNhapKho
CREATE TABLE PhieuNhapKho 
(
    MaPNK CHAR(10) NOT NULL
        CONSTRAINT PK_PhieuNhapKho_MaPNK PRIMARY KEY,
    TongSoLuongNK INT NOT NULL,
    NgayNK DATE NOT NULL,
    GhiChuNK NVARCHAR(200) NULL,
    LiDoNhapKho NVARCHAR(100) NULL,
    MaNV CHAR(10) NOT NULL,
    MaNCC CHAR(10) NOT NULL
);

-- 24. Bảng ChiTietPNK 
CREATE TABLE ChiTietPNK 
(
    MaPNK CHAR(10) NOT NULL,
    MaNL CHAR(10) NOT NULL,
    SoLuongNK INT NOT NULL,
    DonGiaNK DECIMAL(18,2) NOT NULL,
    ThanhTienNK DECIMAL(18,2) NULL,
    CONSTRAINT PK_ChiTietPNK_MaPNK_MaNL PRIMARY KEY (MaPNK, MaNL)
);

-- 25. Bảng TonKho 
CREATE TABLE TonKho 
(
    MaNL CHAR(10) NOT NULL,
    NgayCapNhatTK DATE NOT NULL,
    ThangTK INT NOT NULL,
    NamTK INT NOT NULL,
    TonDauKy INT NOT NULL,
    TriGiaTonDK DECIMAL(18,2) NULL,
    NhapTrongKy INT NOT NULL,
    TriGiaNhapTK DECIMAL(18,2) NULL,
    XuatTrongKy INT NOT NULL,
    TriGiaXuatTK DECIMAL(18,2) NULL,
    TonCuoiKy INT NOT NULL,
    TriGiaTonCK DECIMAL(18,2) NULL,
    CONSTRAINT PK_TonKho_MaNL_NgayCapNhatTK PRIMARY KEY (MaNL, NgayCapNhatTK)
);
--26. Bảng NhaCungCap
CREATE TABLE NhaCungCap
(
    MaNCC CHAR(10) NOT NULL,
    TenNCC NVARCHAR(50) NOT NULL,
    EmailNCC VARCHAR(50) NOT NULL,
    SDTNCC CHAR(10) NOT NULL,
    DiaChiNCC NVARCHAR(50) NOT NULL,
    LoaiHangCC NVARCHAR(50) NOT NULL,
    TinhTrangNCC NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_NhaCungCap_MaNCC PRIMARY KEY (MaNCC)
);
-- III. Alter khóa ngoại

--1. Bảng NhanVien

ALTER TABLE NhanVien
ADD CONSTRAINT FK_NhanVien_QuanLy
FOREIGN KEY (MaQL) REFERENCES NhanVien(MaNV);

ALTER TABLE NhanVien
ADD CONSTRAINT FK_NhanVien_ChucVu
FOREIGN KEY (MaCV) REFERENCES ChucVu(MaCV);

--2. Bảng TaiKhoan

ALTER TABLE TaiKhoan
ADD CONSTRAINT FK_TaiKhoan_NhanVien
FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV);

--3. Bảng Ca_DangKy
ALTER TABLE Ca_DangKy
ADD CONSTRAINT FK_Ca_DangKy_NhanVien
FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV);

ALTER TABLE Ca_DangKy
ADD CONSTRAINT FK_Ca_DangKy_CaLamViec
FOREIGN KEY (MaCa) REFERENCES CaLamViec(MaCa);

--4. Bảng DonHang
ALTER TABLE DonHang
ADD CONSTRAINT FK_DonHang_KhachHang
FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH);

ALTER TABLE DonHang
ADD CONSTRAINT FK_DonHang_NhanVien
FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV);

ALTER TABLE DonHang
ADD CONSTRAINT FK_DonHang_Ban
FOREIGN KEY (MaBan) REFERENCES Ban(MaBan);

ALTER TABLE DonHang
ADD CONSTRAINT FK_DonHang_HoaDon
FOREIGN KEY (MaHD) REFERENCES HoaDon_PhieuThanhToan(MaHD);

--5. Bảng HoaDon_PhieuThanhToan
ALTER TABLE HoaDon_PhieuThanhToan
ADD CONSTRAINT FK_HoaDon_PhieuThanhToan_HinhThucThanhToan
FOREIGN KEY (MaHTTT) REFERENCES HinhThucThanhToan(MaHTTT);

--6. Bảng DiemTichLuy
ALTER TABLE DiemTichLuy
ADD CONSTRAINT FK_DiemTichLuy_KhachHang
FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH);

ALTER TABLE DiemTichLuy
ADD CONSTRAINT FK_DiemTichLuy_HoaDon
FOREIGN KEY (MaHD) REFERENCES HoaDon_PhieuThanhToan(MaHD);

--7. Bảng SanPham
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_DonViTinhSP
FOREIGN KEY (MaDVTSP) REFERENCES DonViTinhSP(MaDVTSP);

--8. Bảng DonGiaSanPham
ALTER TABLE DonGiaSanPham
ADD CONSTRAINT FK_DonGiaSanPham_SanPham
FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);

--9. Bảng ChiTietDonHang
ALTER TABLE ChiTietDonHang
ADD CONSTRAINT FK_ChiTietDonHang_DonHang
FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH);

ALTER TABLE ChiTietDonHang
ADD CONSTRAINT FK_ChiTietDonHang_SanPham
FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);

--10. Bảng KhuyenMaiSP
ALTER TABLE KhuyenMaiSP
ADD CONSTRAINT FK_KhuyenMaiSP_KhuyenMai
FOREIGN KEY (MaKM) REFERENCES CTKhuyenMai(MaKM);

ALTER TABLE KhuyenMaiSP
ADD CONSTRAINT FK_KhuyenMaiSP_SanPham
FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);

--11. Bảng KhuyenMaiHD
ALTER TABLE KhuyenMaiHD
ADD CONSTRAINT FK_KhuyenMaiHD_KhuyenMai
FOREIGN KEY (MaKM) REFERENCES CTKhuyenMai(MaKM);

ALTER TABLE KhuyenMaiHD
ADD CONSTRAINT FK_KhuyenMaiHD_HoaDon
FOREIGN KEY (MaHD) REFERENCES HoaDon_PhieuThanhToan(MaHD);

--12. Bảng NguyenLieu
ALTER TABLE NguyenLieu
ADD CONSTRAINT FK_NguyenLieu_LoaiNVL
FOREIGN KEY (MaLoaiNVL) REFERENCES LoaiNVL(MaLoaiNVL);

ALTER TABLE NguyenLieu
ADD CONSTRAINT FK_NguyenLieu_DonViTinhNL
FOREIGN KEY (MaDVTNL) REFERENCES DonViTinhNL(MaDVTNL);

--13. Bảng DinhMuc
ALTER TABLE DinhMuc
ADD CONSTRAINT FK_DinhMuc_SanPham
FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);

ALTER TABLE DinhMuc
ADD CONSTRAINT FK_DinhMuc_NguyenLieu
FOREIGN KEY (MaNL) REFERENCES NguyenLieu(MaNL);

--14. Bảng PhieuNhapKho
ALTER TABLE PhieuNhapKho
ADD CONSTRAINT FK_PhieuNhapKho_NhanVien
FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV);

ALTER TABLE PhieuNhapKho
ADD CONSTRAINT FK_PhieuNhapKho_NhaCungCap
FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC);

--15. Bảng ChiTietPNK
ALTER TABLE ChiTietPNK
ADD CONSTRAINT FK_ChiTietPNK_PhieuNhapKho
FOREIGN KEY (MaPNK) REFERENCES PhieuNhapKho(MaPNK);

ALTER TABLE ChiTietPNK
ADD CONSTRAINT FK_ChiTietPNK_NguyenLieu
FOREIGN KEY (MaNL) REFERENCES NguyenLieu(MaNL);

--16. Bảng TonKho
ALTER TABLE TonKho
ADD CONSTRAINT FK_TonKho_NguyenLieu
FOREIGN KEY (MaNL) REFERENCES NguyenLieu(MaNL);

-- VI. Trigger ràng buộc

--1. Ràng buộc toàn vẹn miền giá trị
--R1 – Giới tính nhân viên
CREATE TRIGGER trg_NhanVien_GioiTinh
ON NhanVien
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE GioiTinhNV NOT IN (N'Nam', N'Nữ')
    )
    BEGIN
        RAISERROR(N'Giới tính phải là Nam hoặc Nữ.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--R2 – Loại ca làm việc
CREATE TRIGGER trg_CaLamViec_LoaiCa
ON CaLamViec
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE LoaiCa NOT IN (N'Sáng', N'Chiều', N'Tối')
    )
    BEGIN
        RAISERROR(N'Loại ca phải là Sáng, Chiều hoặc Tối.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--R3 – Tình trạng bàn
CREATE TRIGGER trg_Ban_TinhTrang
ON Ban
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE TinhTrangBan NOT IN (N'Trống', N'Đang sử dụng', N'Đặt trước')
    )
    BEGIN
        RAISERROR(N'Tình trạng bàn phải là Trống, Đang sử dụng hoặc Đặt trước.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--R4 – Ngày hết hạn nguyên liệu ≥ hiện tại
CREATE TRIGGER trg_NguyenLieu_NgayHetHan
ON NguyenLieu
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE NgayHetHanNL < GETDATE()
    )
    BEGIN
        RAISERROR(N'Ngày hết hạn nguyên liệu phải >= ngày hiện tại.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;


--R5. Giá bán sản phẩm phải nằm trong khoảng MIN – MAX tùy loại sản phẩm
CREATE TRIGGER trg_DonGiaSanPham_Range
ON DonGiaSanPham
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM inserted i
        JOIN SanPham sp ON i.MaSP = sp.MaSP
        WHERE 
            (sp.LoaiSP = N'Cà phê' AND (i.GiaBan < 20000 OR i.GiaBan > 80000)) OR
            (sp.LoaiSP = N'Trà'    AND (i.GiaBan < 15000 OR i.GiaBan > 60000)) OR
            (sp.LoaiSP = N'Bánh'   AND (i.GiaBan < 10000 OR i.GiaBan > 45000))
    )
    BEGIN
        RAISERROR(N'Giá bán không nằm trong khoảng cho phép theo loại sản phẩm.', 16, 1);
        ROLLBACK;
    END
END;

--Kiểm thử hợp lệ
INSERT INTO DonGiaSanPham (MaSP, NgayCapNhatGia, GiaBan)
VALUES ('SP001', '2025-12-05', 40000);   -- SP001: Cà phê

SELECT * FROM DonGiaSanPham;

--Kiểm thử sai GiaBan
INSERT INTO DonGiaSanPham (MaSP, NgayCapNhatGia, GiaBan)
VALUES ('SP001','2025-12-06', 10000); 

--R6 – Thuế VAT 0 ≤ ThueVATHD ≤ 1
CREATE TRIGGER trg_HoaDon_PhieuThanhToan_ThueVAT
ON HoaDon_PhieuThanhToan
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE ThueVATHD < 0 OR ThueVATHD > 1
    )
    BEGIN
        RAISERROR(N'Thuế VAT phải từ 0 đến 1.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--R7 – Số lượng nhập kho > 0
CREATE TRIGGER trg_ChiTietPNK_SoLuongNK
ON ChiTietPNK
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE SoLuongNK <= 0
    )
    BEGIN
        RAISERROR(N'Số lượng nhập kho phải > 0.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--R8 – Trạng thái đơn hàng hợp lệ
CREATE TRIGGER trg_DonHang_TrangThaiDH
ON DonHang
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE TrangThaiDH NOT IN (N'Chờ xử lý', N'Đang pha chế', N'Hoàn thành')
    )
    BEGIN
        RAISERROR(N'Trạng thái đơn hàng không hợp lệ.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--R9.Giờ bắt đầu ca làm việc phải nằm trong miền hợp lệ theo loại ca
CREATE TRIGGER trg_CaLamViec_GioTheoLoaiCa
ON CaLamViec
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE
            -- Ca Sáng 06:00 - 11:00
            (LoaiCa = N'Sáng' AND 
                (ThoiGianBDCa < '06:00' OR ThoiGianBDCa > '11:00' 
                 OR ThoiGianKTCa < '06:00' OR ThoiGianKTCa > '11:59'))
            OR
            -- Ca Chiều 11:00 - 17:00
            (LoaiCa = N'Chiều' AND 
                (ThoiGianBDCa < '11:00' OR ThoiGianBDCa > '17:00'
                 OR ThoiGianKTCa < '11:00' OR ThoiGianKTCa > '17:59'))
            OR
            -- Ca Tối 17:00 - 23:00
            (LoaiCa = N'Tối' AND 
                (ThoiGianBDCa < '17:00' OR ThoiGianBDCa > '23:00'
                 OR ThoiGianKTCa < '17:00' OR ThoiGianKTCa > '23:59'))
    )
    BEGIN
        RAISERROR(N'Thời gian của ca làm việc không hợp lệ theo loại ca.', 16, 1);
        ROLLBACK;
    END
END;

--2. Ràng buộc toàn vẹn liên thuộc tính trên cùng một quan hệ
--R10 – Giờ kết thúc ca > giờ bắt đầu
CREATE TRIGGER trg_CaLamViec_ThoiGian
ON CaLamViec
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE ThoiGianKTCa <= ThoiGianBDCa
    )
    BEGIN
        RAISERROR(N'ThoiGianKTCa phải lớn hơn ThoiGianBDCa.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--R11 – Ngày kết thúc khuyến mãi ≥ ngày bắt đầu
CREATE TRIGGER trg_CTKhuyenMai_Ngay
ON CTKhuyenMai
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * FROM inserted
        WHERE DenNgayKM < TuNgayKM
    )
    BEGIN
        RAISERROR(N'DenNgayKM phải >= TuNgayKM.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--Kiểm thử hợp lệ
INSERT INTO CTKhuyenMai (MaKM, TenKM, TuNgayKM, DenNgayKM, LoaiKM, DieuKienKM)
VALUES ('KM01', N'Khuyến mãi Noel', '2024-12-01', '2024-12-20', N'Giảm giá', N'Không có');

SELECT * FROM CTKhuyenMai;

--Kiểm thử sai GiaBan
INSERT INTO CTKhuyenMai (MaKM, TenKM, TuNgayKM, DenNgayKM, LoaiKM, DieuKienKM)
VALUES ('KM02', N'Khuyến mãi Tết', '2024-12-20', '2024-12-01', N'Giảm giá', N'Lỗi test');

--R12 – Số tiền khách đưa ≥ ThanhTienHD 
CREATE TRIGGER trg_HoaDon_PhieuThanhToan_Tien
ON HoaDon_PhieuThanhToan
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF TRIGGER_NESTLEVEL() > 1 RETURN;
    IF EXISTS (
        SELECT * FROM inserted
        WHERE SoTienKhachDua < ThanhTienHD
    )
    BEGIN
        RAISERROR(N'Số tiền khách đưa không đủ.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--3. Ràng buộc toàn vẹn liên thuộc tính liên quan hệ
--R13 – Tổng số lượng nhập kho = tổng chi tiết phiếu
CREATE TRIGGER trg_ChiTietPNK_TongSoLuong
ON ChiTietPNK
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    IF TRIGGER_NESTLEVEL() > 1 RETURN;
    DECLARE @AffectedPNK TABLE (MaPNK CHAR(10) PRIMARY KEY);
    INSERT INTO @AffectedPNK (MaPNK)
    SELECT MaPNK FROM inserted
    UNION 
    SELECT MaPNK FROM deleted;
    UPDATE PNK
    SET PNK.TongSoLuongNK = ISNULL(T.NewSum, 0)
    FROM PhieuNhapKho PNK
    INNER JOIN @AffectedPNK AFP ON PNK.MaPNK = AFP.MaPNK 
    LEFT JOIN (
        SELECT MaPNK, SUM(SoLuongNK) AS NewSum
        FROM ChiTietPNK
        WHERE MaPNK IN (SELECT MaPNK FROM @AffectedPNK)
        GROUP BY MaPNK
    ) AS T ON PNK.MaPNK = T.MaPNK;
END;

--4. Ràng buộc toàn vẹn mặc định
--R14 – Ngày tạo đơn hàng mặc định là GETDATE()
CREATE OR ALTER TRIGGER trg_DonHang_DefaultNgayTao
ON DonHang
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    UPDATE dh
    SET NgayTaoDH = GETDATE()
    FROM DonHang dh
    INNER JOIN inserted i ON dh.MaDH = i.MaDH
    WHERE i.NgayTaoDH IS NULL;
END;

--Kiểm thử – Không truyền NgayTaoDH
INSERT INTO DonHang (MaDH, NgayTaoDH, TrangThaiDH, MaKH, MaNV, MaBan, MaHD)
VALUES ('DH034', NULL, N'Chờ xử lý', 'KH001', 'NV001', 'B001', 'HD001');

SELECT MaDH, NgayTaoDH 
FROM DonHang 
WHERE MaDH = 'DH034';

--R15 – ThanhTienDH mặc định = 0
CREATE OR ALTER TRIGGER trg_ChiTietDonHang_DefaultThanhTien
ON ChiTietDonHang
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    UPDATE ctdh
    SET ThanhTienDH = 0
    FROM ChiTietDonHang ctdh
    INNER JOIN inserted i ON ctdh.MaDH = i.MaDH AND ctdh.MaSP = i.MaSP
    WHERE i.ThanhTienDH IS NULL;
END;

--R16 – SoTienKhachDua mặc định = 0
CREATE OR ALTER TRIGGER trg_HoaDon_DefaultSoTienKhachDua
ON HoaDon_PhieuThanhToan
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    UPDATE hd
    SET SoTienKhachDua = 0
    FROM HoaDon_PhieuThanhToan hd
    INNER JOIN inserted i ON hd.MaHD = i.MaHD
    WHERE i.SoTienKhachDua IS NULL;
END;

--5. Ràng buộc toàn vẹn dẫn xuất
--R17 – SoTienDu = SoTienKhachDua – ThanhTienHD
CREATE OR ALTER TRIGGER trg_HoaDon_TinhSoTienDu
ON HoaDon_PhieuThanhToan
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Ngăn trigger đệ quy
    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    UPDATE HD
    SET SoTienDu = ISNULL(HD.SoTienKhachDua,0) - ISNULL(HD.ThanhTienHD,0)
    FROM HoaDon_PhieuThanhToan HD
    INNER JOIN inserted i ON HD.MaHD = i.MaHD
    WHERE HD.SoTienDu IS NULL 
       OR HD.SoTienDu <> ISNULL(HD.SoTienKhachDua,0) - ISNULL(HD.ThanhTienHD,0);
END;

--Kiểm thử
UPDATE HoaDon_PhieuThanhToan
SET SoTienKhachDua = 150000
WHERE MaHD = 'HD031';

SELECT * FROM HoaDon_PhieuThanhToan WHERE MaHD = 'HD031';

--R18 – ThanhTienDH = SoLuong * DonGia – GiamGiaDH
CREATE OR ALTER TRIGGER trg_ChiTietDonHang_TinhThanhTien
ON ChiTietDonHang
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Ngăn trigger đệ quy
    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    -- Cập nhật ThanhTienDH chỉ khi khác NULL hoặc khác giá trị tính toán
    UPDATE ctdh
    SET ThanhTienDH = (i.SoLuong * i.DonGia) - ISNULL(i.GiamGiaDH,0)
    FROM ChiTietDonHang ctdh
    INNER JOIN inserted i
        ON ctdh.MaDH = i.MaDH AND ctdh.MaSP = i.MaSP
    WHERE ctdh.ThanhTienDH IS NULL 
       OR ctdh.ThanhTienDH <> ((i.SoLuong * i.DonGia) - ISNULL(i.GiamGiaDH,0));
END;

--R19 – DiemTichLuyCuoiKy = DiemHienTai + DiemTichLuyTrongNgay
CREATE OR ALTER TRIGGER trg_DiemTichLuy_TinhCuoiKy
ON DiemTichLuy
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dtl
    SET DiemTichLuyCuoiKy = ISNULL(dtl.DiemHienTai,0) + ISNULL(dtl.DiemTichLuyTrongNgay,0)
    FROM DiemTichLuy dtl
    INNER JOIN inserted i ON dtl.MaKH = i.MaKH AND dtl.MaHD = i.MaHD
    WHERE dtl.DiemTichLuyCuoiKy IS NULL
       OR dtl.DiemTichLuyCuoiKy <> ISNULL(dtl.DiemHienTai,0) + ISNULL(dtl.DiemTichLuyTrongNgay,0);
END;

--R20 – ThanhTienNK = SoLuongNK * DonGiaNK
CREATE OR ALTER TRIGGER trg_ChiTietPNK_TinhThanhTien
ON ChiTietPNK
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ctpnk
    SET ThanhTienNK = ISNULL(ctpnk.SoLuongNK,0) * ISNULL(ctpnk.DonGiaNK,0)
    FROM ChiTietPNK ctpnk
    INNER JOIN inserted i ON ctpnk.MaPNK = i.MaPNK AND ctpnk.MaNL = i.MaNL
    WHERE ctpnk.ThanhTienNK IS NULL
       OR ctpnk.ThanhTienNK <> ISNULL(ctpnk.SoLuongNK,0) * ISNULL(ctpnk.DonGiaNK,0);
END;

--R21 – TonCuoiKy = TonDauKy + NhapTrongKy – XuatTrongKy
CREATE OR ALTER TRIGGER trg_TonKho_TinhTonCuoiKy
ON TonKho
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE tk
    SET TonCuoiKy = ISNULL(tk.TonDauKy,0) + ISNULL(tk.NhapTrongKy,0) - ISNULL(tk.XuatTrongKy,0)
    FROM TonKho tk
    INNER JOIN inserted i ON tk.MaNL = i.MaNL AND tk.NgayCapNhatTK = i.NgayCapNhatTK
    WHERE tk.TonCuoiKy IS NULL
       OR tk.TonCuoiKy <> ISNULL(tk.TonDauKy,0) + ISNULL(tk.NhapTrongKy,0) - ISNULL(tk.XuatTrongKy,0);
END;

-- Trigger Audit
-- Tạo bảng AuditLog
CREATE TABLE AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    TenBang NVARCHAR(100),
    KieuThaoTac NVARCHAR(10),
    KhoaChinh NVARCHAR(200),
    GiaTriCu NVARCHAR(MAX),
    GiaTriMoi NVARCHAR(MAX),
    NguoiThucHien NVARCHAR(100),
    ThoiGian DATETIME DEFAULT GETDATE()
);

--Trigger theo dõi bảng ChiTietDonHang
CREATE OR ALTER TRIGGER trg_Audit_ChiTietDonHang
ON ChiTietDonHang
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DECLARE @TenBang NVARCHAR(100) = 'ChiTietDonHang';
        DECLARE @Nguoi NVARCHAR(100) = SYSTEM_USER;

        -------------------------------------------------------
        -- INSERT
        -------------------------------------------------------
        IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
        BEGIN
            INSERT INTO AuditLog (TenBang, KieuThaoTac, KhoaChinh, GiaTriMoi, NguoiThucHien)
            SELECT 
                @TenBang,
                'INSERT',
                CONCAT('MaDH=', i.MaDH, ', MaSP=', i.MaSP),
                (SELECT i.* FOR JSON PATH),
                @Nguoi
            FROM inserted i;
        END

        -------------------------------------------------------
        -- DELETE
        -------------------------------------------------------
        IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
        BEGIN
            INSERT INTO AuditLog (TenBang, KieuThaoTac, KhoaChinh, GiaTriCu, NguoiThucHien)
            SELECT 
                @TenBang,
                'DELETE',
                CONCAT('MaDH=', d.MaDH, ', MaSP=', d.MaSP),
                (SELECT d.* FOR JSON PATH),
                @Nguoi
            FROM deleted d;
        END

        -------------------------------------------------------
        -- UPDATE
        -------------------------------------------------------
        IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
        BEGIN
            INSERT INTO AuditLog (TenBang, KieuThaoTac, KhoaChinh, GiaTriCu, GiaTriMoi, NguoiThucHien)
            SELECT 
                @TenBang,
                'UPDATE',
                CONCAT('MaDH=', d.MaDH, ', MaSP=', d.MaSP),
                (SELECT d.* FOR JSON PATH),
                (SELECT i.* FOR JSON PATH),
                @Nguoi
            FROM deleted d
            JOIN inserted i
                ON d.MaDH = i.MaDH AND d.MaSP = i.MaSP;
        END
    END TRY
    BEGIN CATCH
        INSERT INTO AuditLog (TenBang, KieuThaoTac, GiaTriMoi, NguoiThucHien)
        VALUES ('ChiTietDonHang', 'ERROR', ERROR_MESSAGE(), SYSTEM_USER);
    END CATCH;
END;

--Kiểm thử
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia,ThanhTienDH,GhiChuDH,GiamGiaDH)
VALUES ('DH003', 'SP005', 2, 25000, 50000, NULL,5000);

UPDATE ChiTietDonHang
SET GiamGiaDH = 10000
WHERE MaDH = 'DH003' AND MaSP = 'SP005';

DELETE FROM ChiTietDonHang
WHERE MaDH = 'DH003' AND MaSP = 'SP005';

SELECT * FROM AuditLog ORDER BY AuditID;


CREATE VIEW HoaDonFull AS
SELECT 
    hd.MaHD,
    hd.NgayLapHD,
    hd.ThueVATHD,
    hd.ThanhTienHD,
    hd.SoTienKhachDua,
    hd.SoTienDu,
    sp.TenSP,
    ct.SoLuong,
    ct.DonGia,
    (ct.SoLuong * ct.DonGia) AS ThanhTien
FROM HoaDon_PhieuThanhToan hd
JOIN DonHang dh ON hd.MaHD = dh.MaHD
JOIN ChiTietDonHang ct ON ct.MaDH = dh.MaDH
JOIN SanPham sp ON sp.MaSP = ct.MaSP;

--Insert dữ liệu

INSERT INTO ChucVu VALUES
('CV01', N'Nhân viên pha chế', N'Chịu trách nhiệm pha chế đồ uống theo menu và order khách'),
('CV02', N'Thu ngân', N'Xử lý thanh toán, xuất hóa đơn, nhận tiền khách'),
('CV03', N'Phục vụ', N'Phục vụ khách tại quầy và bàn, đảm bảo vệ sinh khu vực'),
('CV04', N'Quản lý ca', N'Điều phối nhân sự trong ca, giám sát vận hành quầy'),
('CV05', N'Quản lý cửa hàng', N'Quản lý toàn bộ hoạt động cửa hàng, báo cáo doanh thu'),
('CV06', N'Kiểm kho', N'Kiểm kê nguyên liệu, báo cáo tồn kho hàng ngày'),
('CV07', N'Nhân viên kho', N'Nhận hàng, nhập kho, kiểm tra chất lượng nguyên liệu'),
('CV08', N'Barista', N'Pha chế cà phê espresso và đồ uống đặc biệt'),
('CV09', N'Pha chế trà sữa', N'Chuẩn bị trà sữa, topping và các loại đồ uống liên quan'),
('CV10', N'Barista chính', N'Điều phối quầy cà phê, huấn luyện nhân viên mới'),
('CV11', N'Barista Cold Brew', N'Chịu trách nhiệm pha chế đồ uống cold brew'),
('CV12', N'Barista phụ', N'Hỗ trợ Barista chính và chuẩn bị nguyên liệu'),
('CV13', N'Nhân viên online', N'Xử lý đơn online, đóng gói và giao hàng'),
('CV14', N'Nhân viên bánh', N'Chế biến và trang trí bánh ngọt, bánh mì, pastry'),
('CV15', N'Nhân viên marketing', N'Quản lý fanpage, đăng bài, chương trình khuyến mãi'),
('CV16', N'Phó quản lý', N'Hỗ trợ quản lý cửa hàng, giải quyết vấn đề phát sinh'),
('CV17', N'Trưởng ca', N'Điều phối hoạt động trong ca, hỗ trợ quản lý ca'),
('CV18', N'Nhân viên vệ sinh', N'Dọn dẹp khu vực, giữ vệ sinh chung cửa hàng'),
('CV19', N'IT Support', N'Hỗ trợ phần mềm, máy POS, hệ thống mạng'),
('CV20', N'Chăm sóc khách hàng', N'Giải quyết thắc mắc, feedback khách hàng'),
('CV21', N'QC - Chất lượng', N'Kiểm tra chất lượng nguyên liệu, đồ uống và dịch vụ'),
('CV22', N'Nhân viên đào tạo', N'Hướng dẫn nhân viên mới, tập huấn nội bộ'),
('CV23', N'Quản lý marketing', N'Xây dựng chiến lược marketing cửa hàng'),
('CV24', N'Thực tập sinh', N'Học việc và hỗ trợ nhân viên pha chế/thu ngân'),
('CV25', N'Bảo vệ', N'Đảm bảo an ninh cửa hàng'),
('CV26', N'Topping', N'Chuẩn bị topping, trang trí đồ uống'),
('CV27', N'Quản lý bàn', N'Điều phối đặt bàn, quản lý khu vực phục vụ'),
('CV28', N'Kho lạnh', N'Quản lý nguyên liệu đông lạnh, bảo quản theo tiêu chuẩn'),
('CV29', N'Kế toán quầy', N'Theo dõi thu chi, tính lương, báo cáo tài chính quầy'),
('CV30', N'Chuyên môn cà phê', N'Phát triển menu, thử nghiệm đồ uống mới');

INSERT INTO NhanVien VALUES
('NV001', N'Nguyễn Văn Quang', N'Nam', '0912345671', N'Quận 1, TP.HCM', '1985-05-10', NULL, 'CV05'),
('NV002', N'Nguyễn Thị Hương Lan', N'Nữ', '0912345672', N'Quận 3, TP.HCM', '1990-03-15', 'NV001', 'CV04'),
('NV003', N'Lê Mỹ Duyên', N'Nữ', '0912345673', N'Quận 5, TP.HCM', '1992-07-20', 'NV001', 'CV03'),
('NV004', N'Phạm Gia Huy', N'Nam', '0912345674', N'Quận 7, TP.HCM', '1988-11-25', 'NV001', 'CV04'),
('NV005', N'Nguyễn Anh Tuấn', N'Nam', '0912345675', N'Quận 10, TP.HCM', '1995-01-05', 'NV001', 'CV16'),
('NV006', N'Võ Hồng Ngọc', N'Nữ', '0912345676', N'Quận Bình Thạnh, TP.HCM', '1993-09-12', 'NV001', 'CV08'),
('NV007', N'Mai Thu Trang', N'Nữ', '0912345677', N'Quận Gò Vấp, TP.HCM', '1994-06-18', 'NV001', 'CV02'),
('NV008', N'Hồ Thanh Phát', N'Nam', '0912345678', N'Quận Tân Bình, TP.HCM', '1991-12-30', 'NV001', 'CV01'),
('NV009', N'Ngô Bảo Lâm', N'Nam', '0912345679', N'Quận Phú Nhuận, TP.HCM', '1989-08-22', 'NV001', 'CV17'),
('NV010', N'Nguyễn Hoài Phổ', N'Nam', '0912345680', N'Quận 12, TP.HCM', '1996-04-14', 'NV001', 'CV23'),
('NV011', N'Đặng Gia Nhi', N'Nữ', '0912345681', N'Quận Thủ Đức, TP.HCM', '1997-02-28', 'NV001', 'CV09'),
('NV012', N'Vũ Minh Quân', N'Nam', '0912345682', N'Quận 2, TP.HCM', '1987-10-09', 'NV001', 'CV13'),
('NV013', N'Bùi Kim Yến', N'Nữ', '0912345683', N'Quận 6, TP.HCM', '1993-05-21', 'NV001', 'CV12'),
('NV014', N'Phạm Bảo Châu', N'Nữ', '0912345684', N'Quận 8, TP.HCM', '1992-11-11', 'NV001', 'CV03'),
('NV015', N'Nguyễn Hoàng Bảo', N'Nam', '0912345685', N'Quận Bình Tân, TP.HCM', '1990-07-07', 'NV001', 'CV14'),
('NV016', N'Trần Đình Tài', N'Nam', '0912345686', N'Quận 9, TP.HCM', '1988-03-03', 'NV001', 'CV19'),
('NV017', N'Trịnh Khánh Linh', N'Nữ', '0912345687', N'Quận 4, TP.HCM', '1995-12-12', 'NV001', 'CV18'),
('NV018', N'Lê Minh Châu', N'Nữ', '0912345688', N'Quận 11, TP.HCM', '1996-06-06', 'NV001', 'CV11'),
('NV019', N'Phạm Trung Thông', N'Nam', '0912345689', N'Quận Tân Phú, TP.HCM', '1991-09-19', 'NV001', 'CV21'),
('NV020', N'Ngô Gia Khiêm', N'Nam', '0912345690', N'Hóc Môn, TP.HCM', '1987-01-01', 'NV001', 'CV25'),
('NV021', N'Đỗ Phương Linh', N'Nữ', '0912345691', N'Củ Chi, TP.HCM', '1998-08-08', 'NV001', 'CV18'),
('NV022', N'Hồ Văn Khang', N'Nam', '0912345692', N'Nhà Bè, TP.HCM', '1993-03-13', 'NV001', 'CV15'),
('NV023', N'Nguyễn Thái Bảo', N'Nam', '0912345693', N'Bình Chánh, TP.HCM', '1994-04-24', 'NV001', 'CV28'),
('NV024', N'Lý Hồng Phúc', N'Nam', '0912345694', N'Quận 1, TP.HCM', '1990-10-10', 'NV001', 'CV22'),
('NV025', N'Hà Thanh Nhi', N'Nữ', '0912345695', N'Quận 3, TP.HCM', '1997-07-17', 'NV001', 'CV20'),
('NV026', N'Trần Đức Kiên', N'Nam', '0912345696', N'Quận 5, TP.HCM', '1989-02-02', 'NV001', 'CV24'),
('NV027', N'Võ Tiến Đạt', N'Nam', '0912345697', N'Quận 7, TP.HCM', '1992-12-22', 'NV001', 'CV24'),
('NV028', N'Nguyễn Thị Hạnh', N'Nữ', '0912345698', N'Quận 10, TP.HCM', '1996-05-05', 'NV001', 'CV22'),
('NV029', N'Bùi Hoàng Gia', N'Nam', '0912345699', N'Quận Bình Thạnh, TP.HCM', '1991-11-30', 'NV001', 'CV29'),
('NV030', N'Lê Phương Thanh', N'Nữ', '0912345700', N'Quận Gò Vấp, TP.HCM', '1993-09-09', 'NV001', 'CV30');

INSERT INTO TaiKhoan (MaTK, TenTK, MatKhauTK, Email, VaiTro, MaNV)
VALUES 
('TK001','ngquan','Pass@123','ngquan@gmail.com','Manager','NV001'),
('TK002','lanhtl','Lan@2025','lanhtl@gmail.com','Manager','NV002'),
('TK003','duyenlm','Duyen@2025','duyenlm@gmail.com','Manager','NV003'),
('TK004','huypg','Huy@2025','huypg@gmail.com','Manager','NV004'),
('TK005','tuantn','Tuan@2025','tuantn@gmail.com','Staff','NV005'),
('TK006','ngocvh','Ngoc@2025','ngocvh@gmail.com','Staff','NV006'),
('TK007','trangmt','Trang@2025','trangmt@gmail.com','Staff','NV007'),
('TK008','phathh','Phat@2025','phathh@gmail.com','Staff','NV008'),
('TK009','lamnb','Lam@2025','lamnb@gmail.com','Staff','NV009'),
('TK010','phongnh','Pho@2025','phongnh@gmail.com','Staff','NV010'),
('TK011','nhi.dg','Nhi@2025','nhi.dg@gmail.com','Staff','NV011'),
('TK012','quanvm','Quan@2025','quanvm@gmail.com','Manager','NV012'),
('TK013','yenkb','Yen@2025','yenkb@gmail.com','Staff','NV013'),
('TK014','chaupb','Chau@2025','chaupb@gmail.com','Manager','NV014'),
('TK015','baonh','Bao@2025','baonh@gmail.com','Staff','NV015'),
('TK016','taidt','Tai@2025','taidt@gmail.com','Staff','NV016'),
('TK017','linh.tk','Linh@2025','linh.tk@gmail.com','Staff','NV017'),
('TK018','chau.lm','Chau2@2025','chau.lm@gmail.com','Manager','NV018'),
('TK019','thongpt','Thong@2025','thongpt@gmail.com','Staff','NV019'),
('TK020','khiemng','Khiem@2025','khiemng@gmail.com','Staff','NV020'),
('TK021','linhp','LinhP@2025','linhp@gmail.com','Staff','NV021'),
('TK022','khanghv','Khang@2025','khanghv@gmail.com','Staff','NV022'),
('TK023','baot','BaoT@2025','baot@gmail.com','Manager','NV023'),
('TK024','phuclh','Phuc@2025','phuclh@gmail.com','Manager','NV024'),
('TK025','nhin','Nhi2@2025','nhin@gmail.com','Staff','NV025'),
('TK026','kientd','Kien@2025','kientd@gmail.com','Staff','NV026'),
('TK027','datvt','Dat@2025','datvt@gmail.com','Staff','NV027'),
('TK028','hanhtn','Hanh@2025','hanhtn@gmail.com','Manager','NV028'),
('TK029','giabh','Gia@2025','giabh@gmail.com','Staff','NV029'),
('TK030','phth','PThanh@2025','phth@gmail.com','Manager','NV030');

INSERT INTO CaLamViec VALUES
('CA001','06:00','10:00',N'Sáng'),
('CA002','07:00','11:00',N'Sáng'),
('CA003','08:00','11:00',N'Sáng'),
('CA004','09:00','11:00',N'Sáng'),
('CA005','10:00','11:00',N'Sáng'),
('CA006','07:00','11:00',N'Sáng'),
('CA007','08:00','11:00',N'Sáng'),
('CA008','09:00','11:00',N'Sáng'),
('CA009','10:00','11:00',N'Sáng'),
('CA010','06:30','10:30',N'Sáng'),
('CA016','11:00','15:00',N'Chiều'),
('CA017','12:00','16:00',N'Chiều'),
('CA018','13:00','17:00',N'Chiều'),
('CA019','14:00','17:00',N'Chiều'),
('CA020','15:00','17:00',N'Chiều'),
('CA011','11:00','15:00',N'Chiều'),
('CA012','12:00','16:00',N'Chiều'),
('CA013','13:00','17:00',N'Chiều'),
('CA014','14:00','17:00',N'Chiều'),
('CA015','15:00','17:00',N'Chiều'),
('CA021','17:00','20:00',N'Tối'),
('CA022','18:00','21:00',N'Tối'),
('CA023','19:00','22:00',N'Tối'),
('CA024','20:00','23:00',N'Tối'),
('CA025','21:00','23:59',N'Tối'),
('CA026','06:00','11:00',N'Sáng'),
('CA027','06:00','09:00',N'Sáng'),
('CA028','11:00','17:00',N'Chiều'),
('CA029','11:00','14:00',N'Chiều'),
('CA030','17:00','23:00',N'Tối'),
('CA031','17:00','21:00',N'Tối');

INSERT INTO Ca_DangKy VALUES
('NV001','CA001','2025-12-01'),
('NV002','CA002','2025-12-02'),
('NV003','CA003','2025-12-03'),
('NV004','CA004','2025-12-04'),
('NV005','CA005','2025-12-05'),
('NV006','CA006','2025-12-06'),
('NV007','CA007','2025-12-07'),
('NV008','CA008','2025-12-08'),
('NV009','CA009','2025-12-09'),
('NV010','CA010','2025-12-10'),
('NV011','CA011','2025-12-11'),
('NV012','CA012','2025-12-12'),
('NV013','CA013','2025-12-13'),
('NV014','CA014','2025-12-14'),
('NV015','CA015','2025-12-15'),
('NV016','CA016','2025-12-16'),
('NV017','CA017','2025-12-17'),
('NV018','CA018','2025-12-18'),
('NV019','CA019','2025-12-19'),
('NV020','CA020','2025-12-20'),
('NV021','CA021','2025-12-21'),
('NV022','CA022','2025-12-22'),
('NV023','CA023','2025-12-23'),
('NV024','CA024','2025-12-24'),
('NV025','CA025','2025-12-25'),
('NV026','CA026','2025-12-26'),
('NV027','CA027','2025-12-27'),
('NV028','CA028','2025-12-28'),
('NV029','CA029','2025-12-29'),
('NV030','CA030','2025-12-30');

INSERT INTO KhachHang VALUES
('KH001',N'Trần Minh Anh','0901234561','minhanh@gmail.com'),
('KH002',N'Nguyễn Thị Bích','0901234562','bichnt@gmail.com'),
('KH003',N'Lê Văn Cường','0901234563','cuonglv@gmail.com'),
('KH004',N'Phạm Thị Duyên','0901234564','duenpt@gmail.com'),
('KH005',N'Nguyễn Hữu Em','0901234565','emnh@gmail.com'),
('KH006',N'Hoàng Thị Giao','0901234566','giaoh@gmail.com'),
('KH007',N'Đặng Văn Hòa','0901234567','hoadv@gmail.com'),
('KH008',N'Trần Thị Kiều','0901234568','kieutn@gmail.com'),
('KH009',N'Nguyễn Văn Long','0901234569','longnv@gmail.com'),
('KH010',N'Lê Thị Mai','0901234570','mainv@gmail.com'),
('KH011',N'Phạm Văn Nam','0901234571','nampv@gmail.com'),
('KH012',N'Vũ Thị Oanh','0901234572','oanhtv@gmail.com'),
('KH013',N'Nguyễn Văn Phú','0901234573','phunv@gmail.com'),
('KH014',N'Trần Thị Quỳnh','0901234574','quynhtt@gmail.com'),
('KH015',N'Lê Văn Sơn','0901234575','sonlv@gmail.com'),
('KH016',N'Nguyễn Thị Thanh','0901234576','thanhnt@gmail.com'),
('KH017',N'Phạm Văn Trung','0901234577','trungpv@gmail.com'),
('KH018',N'Hoàng Thị Uyên','0901234578','uyenht@gmail.com'),
('KH019',N'Đinh Văn Vinh','0901234579','vinhdv@gmail.com'),
('KH020',N'Nguyễn Thị Xuyến','0901234580','xuyennt@gmail.com'),
('KH021',N'Ngô Văn Yên','0901234581','yennv@gmail.com'),
('KH022',N'Lê Thị Ánh','0901234582','anhlt@gmail.com'),
('KH023',N'Trần Văn Bình','0901234583','binhtv@gmail.com'),
('KH024',N'Nguyễn Thị Cẩm','0901234584','camnt@gmail.com'),
('KH025',N'Phan Văn Duy','0901234585','duypv@gmail.com'),
('KH026',N'Nguyễn Thị Giang','0901234586','giangnt@gmail.com'),
('KH027',N'Trần Văn Hùng','0901234587','hungtv@gmail.com'),
('KH028',N'Nguyễn Thị Lan','0901234588','lantt@gmail.com'),
('KH029',N'Phạm Văn Minh','0901234589','minhpv@gmail.com'),
('KH030',N'Lê Thị Ngọc','0901234590','ngoclt@gmail.com');

INSERT INTO Ban VALUES
('B001',1,N'Khu vực A - gần cửa',N'Trống',4),
('B002',2,N'Khu vực A - giữa',N'Đang sử dụng',4),
('B003',3,N'Khu vực A - cuối',N'Trống',4),
('B004',4,N'Khu vực B - gần cửa sổ',N'Đang sử dụng',4),
('B005',5,N'Khu vực B - giữa',N'Trống',4),
('B006',6,N'Khu vực B - cuối',N'Trống',4),
('B007',7,N'Khu vực C - gần quầy',N'Đang sử dụng',2),
('B008',8,N'Khu vực C - giữa',N'Trống',2),
('B009',9,N'Khu vực C - cuối',N'Trống',2),
('B010',10,N'Khu vực D - gần lối ra',N'Trống',4),
('B011',11,N'Khu vực D - giữa',N'Đang sử dụng',4),
('B012',12,N'Khu vực D - cuối',N'Trống',4),
('B013',13,N'Khu vực E - gần quầy pha chế',N'Trống',4),
('B014',14,N'Khu vực E - giữa',N'Đang sử dụng',6),
('B015',15,N'Khu vực E - cuối',N'Trống',4),
('B016',16,N'Khu vực F - gần cửa sổ',N'Trống',4),
('B017',17,N'Khu vực F - giữa',N'Trống',2),
('B018',18,N'Khu vực F - cuối',N'Đang sử dụng',4),
('B019',19,N'Khu vực G - gần lối đi',N'Trống',4),
('B020',20,N'Khu vực G - giữa',N'Đang sử dụng',4),
('B021',21,N'Khu vực G - cuối',N'Trống',4),
('B022',22,N'Khu vực H - gần cửa',N'Trống',6),
('B023',23,N'Khu vực H - giữa',N'Đặt trước',4),
('B024',24,N'Khu vực H - cuối',N'Đang sử dụng',4),
('B025',25,N'Khu vực I - gần quầy',N'Trống',4),
('B026',26,N'Khu vực I - giữa',N'Trống',2),
('B027',27,N'Khu vực I - cuối',N'Trống',4),
('B028',28,N'Khu vực J - gần cửa',N'Trống',2),
('B029',29,N'Khu vực J - giữa',N'Đang sử dụng',4),
('B030',30,N'Khu vực J - cuối',N'Trống',4);

INSERT INTO HinhThucThanhToan VALUES
('HT001',N'Tiền mặt'),
('HT002',N'Thẻ tín dụng'),
('HT003',N'Thẻ ghi nợ'),
('HT004',N'Ví điện tử MoMo'),
('HT005',N'Ví điện tử ZaloPay'),
('HT006',N'Chuyển khoản ngân hàng'),
('HT007',N'Thẻ quà tặng Highlands'),
('HT008',N'QR Pay'),
('HT009',N'Apple Pay'),
('HT010',N'Google Pay'),
('HT011',N'Thanh toán tại bàn'),
('HT012',N'Thanh toán online'),
('HT013',N'COD'),
('HT014',N'Gift Card'),
('HT015',N'Voucher khuyến mãi'),
('HT016',N'Thanh toán định kỳ'),
('HT017',N'Thanh toán qua POS'),
('HT018',N'Thanh toán qua app'),
('HT019',N'Thanh toán qua website'),
('HT020',N'Tích điểm & thanh toán'),
('HT021',N'Thanh toán tập thể'),
('HT022',N'Thanh toán nhóm'),
('HT023',N'Thẻ nhân viên'),
('HT024',N'Ưu đãi đối tác'),
('HT025',N'Thanh toán bằng QR code'),
('HT026',N'Thanh toán NFC'),
('HT027',N'Thanh toán tự động'),
('HT028',N'Thanh toán bằng PayPal'),
('HT029',N'Thanh toán bằng Samsung Pay'),
('HT030',N'Thanh toán khác');


INSERT INTO HoaDon_PhieuThanhToan VALUES
('HD001','2025-12-01',0.1,165000,200000,35000,'HT001'),
('HD002','2025-12-01',0.1,132000,150000,18000,'HT002'),
('HD003','2025-12-02',0.1,220000,250000,30000,'HT003'),
('HD004','2025-12-02',0.1,198000,220000,22000,'HT004'),
('HD005','2025-12-03',0.1,242000,250000,8000,'HT005'),
('HD006','2025-12-03',0.1,275000,300000,25000,'HT006'),
('HD007','2025-12-04',0.1,187000,200000,13000,'HT007'),
('HD008','2025-12-04',0.1,209000,220000,11000,'HT008'),
('HD009','2025-12-05',0.1,231000,240000,9000,'HT009'),
('HD010','2025-12-05',0.1,176000,200000,24000,'HT010'),
('HD011','2025-12-06',0.1,253000,260000,7000,'HT001'),
('HD012','2025-12-06',0.1,198000,210000,12000,'HT002'),
('HD013','2025-12-07',0.1,165000,180000,15000,'HT003'),
('HD014','2025-12-07',0.1,187000,200000,13000,'HT004'),
('HD015','2025-12-08',0.1,220000,230000,10000,'HT005'),
('HD016','2025-12-08',0.1,231000,250000,19000,'HT006'),
('HD017','2025-12-09',0.1,209000,220000,11000,'HT007'),
('HD018','2025-12-09',0.1,176000,190000,14000,'HT008'),
('HD019','2025-12-10',0.1,275000,280000,5000,'HT009'),
('HD020','2025-12-10',0.1,198000,210000,12000,'HT010'),
('HD021','2025-12-11',0.1,242000,250000,8000,'HT001'),
('HD022','2025-12-11',0.1,220000,230000,10000,'HT002'),
('HD023','2025-12-12',0.1,187000,200000,13000,'HT003'),
('HD024','2025-12-12',0.1,209000,220000,11000,'HT004'),
('HD025','2025-12-13',0.1,253000,260000,7000,'HT005'),
('HD026','2025-12-13',0.1,231000,250000,19000,'HT006'),
('HD027','2025-12-14',0.1,198000,210000,12000,'HT007'),
('HD028','2025-12-14',0.1,165000,180000,15000,'HT008'),
('HD029','2025-12-15',0.1,220000,230000,10000,'HT009'),
('HD030','2025-12-15',0.1,187000,200000,13000,'HT010');

INSERT INTO DonHang VALUES
('DH001','2025-12-01',N'Chờ xử lý','KH001','NV001','B001','HD001'),
('DH002','2025-12-01',N'Hoàn thành','KH002','NV002','B002','HD002'),
('DH003','2025-12-02',N'Đang pha chế','KH003','NV003','B003','HD003'),
('DH004','2025-12-02',N'Hoàn thành','KH004','NV004','B004','HD004'),
('DH005','2025-12-03',N'Chờ xử lý','KH005','NV005','B005','HD005'),
('DH006','2025-12-03',N'Hoàn thành','KH006','NV006','B006','HD006'),
('DH007','2025-12-04',N'Đang pha chế','KH007','NV007','B007','HD007'),
('DH008','2025-12-04',N'Hoàn thành','KH008','NV008','B008','HD008'),
('DH009','2025-12-05',N'Đang pha chế','KH009','NV009','B009','HD009'),
('DH010','2025-12-05',N'Hoàn thành','KH010','NV010','B010','HD010'),
('DH011','2025-12-06',N'Hoàn thành','KH011','NV011','B011','HD011'),
('DH012','2025-12-06',N'Chờ xử lý','KH012','NV012','B012','HD012'),
('DH013','2025-12-07',N'Đang pha chế','KH013','NV013','B013','HD013'),
('DH014','2025-12-07',N'Hoàn thành','KH014','NV014','B014','HD014'),
('DH015','2025-12-08',N'Hoàn thành','KH015','NV015','B015','HD015'),
('DH016','2025-12-08',N'Chờ xử lý','KH016','NV016','B016','HD016'),
('DH017','2025-12-09',N'Đang pha chế','KH017','NV017','B017','HD017'),
('DH018','2025-12-09',N'Hoàn thành','KH018','NV018','B018','HD018'),
('DH019','2025-12-10',N'Hoàn thành','KH019','NV019','B019','HD019'),
('DH020','2025-12-10',N'Đang pha chế','KH020','NV020','B020','HD020'),
('DH021','2025-12-11',N'Hoàn thành','KH021','NV021','B021','HD021'),
('DH022','2025-12-11',N'Chờ xử lý','KH022','NV022','B022','HD022'),
('DH023','2025-12-12',N'Đang pha chế','KH023','NV023','B023','HD023'),
('DH024','2025-12-12',N'Hoàn thành','KH024','NV024','B024','HD024'),
('DH025','2025-12-13',N'Hoàn thành','KH025','NV025','B025','HD025'),
('DH026','2025-12-13',N'Chờ xử lý','KH026','NV026','B026','HD026'),
('DH027','2025-12-14',N'Đang pha chế','KH027','NV027','B027','HD027'),
('DH028','2025-12-14',N'Hoàn thành','KH028','NV028','B028','HD028'),
('DH029','2025-12-15',N'Hoàn thành','KH029','NV029','B029','HD029'),
('DH030','2025-12-15',N'Chờ xử lý','KH030','NV030','B030','HD030');

INSERT INTO DiemTichLuy VALUES
('KH001','HD001','2025-12-01',150,50,200),
('KH002','HD002','2025-12-01',120,30,150),
('KH003','HD003','2025-12-02',200,40,240),
('KH004','HD004','2025-12-02',180,20,200),
('KH005','HD005','2025-12-03',220,50,270),
('KH006','HD006','2025-12-03',250,50,300),
('KH007','HD007','2025-12-04',170,30,200),
('KH008','HD008','2025-12-04',190,10,200),
('KH009','HD009','2025-12-05',210,10,220),
('KH010','HD010','2025-12-05',160,40,200),
('KH011','HD011','2025-12-06',230,20,250),
('KH012','HD012','2025-12-06',180,20,200),
('KH013','HD013','2025-12-07',150,50,200),
('KH014','HD014','2025-12-07',170,30,200),
('KH015','HD015','2025-12-08',200,20,220),
('KH016','HD016','2025-12-08',210,40,250),
('KH017','HD017','2025-12-09',190,10,200),
('KH018','HD018','2025-12-09',160,40,200),
('KH019','HD019','2025-12-10',250,50,300),
('KH020','HD020','2025-12-10',180,20,200),
('KH021','HD021','2025-12-11',220,30,250),
('KH022','HD022','2025-12-11',200,50,250),
('KH023','HD023','2025-12-12',170,30,200),
('KH024','HD024','2025-12-12',190,30,220),
('KH025','HD025','2025-12-13',230,20,250),
('KH026','HD026','2025-12-13',210,40,250),
('KH027','HD027','2025-12-14',180,20,200),
('KH028','HD028','2025-12-14',150,50,200),
('KH029','HD029','2025-12-15',200,20,220),
('KH030','HD030','2025-12-15',170,30,200);

INSERT INTO CTKhuyenMai VALUES
('KM001', N'Giảm 10% đồ uống', '2025-12-01', '2025-12-10', N'Giảm giá', N'Tất cả đồ uống'),
('KM002', N'Mua 1 tặng 1', '2025-12-01', '2025-12-05', N'Khuyến mãi', N'Áp dụng trà sữa'),
('KM003', N'Giảm 20% combo', '2025-12-02', '2025-12-12', N'Giảm giá', N'Combo ăn uống'),
('KM004', N'Tặng thêm điểm thưởng', '2025-12-03', '2025-12-15', N'Tích điểm', N'Khách hàng thân thiết'),
('KM005', N'Giảm giá ngày lễ', '2025-12-04', '2025-12-06', N'Giảm giá', N'Ngày lễ'),
('KM006', N'Mua 2 tặng 1', '2025-12-05', '2025-12-15', N'Khuyến mãi', N'Áp dụng bánh ngọt'),
('KM007', N'Giảm 15% đồ uống', '2025-12-06', '2025-12-20', N'Giảm giá', N'Cà phê và trà'),
('KM008', N'Tặng voucher 50k', '2025-12-07', '2025-12-17', N'Voucher', N'Khách hàng VIP'),
('KM009', N'Giảm giá cuối tuần', '2025-12-08', '2025-12-10', N'Giảm giá', N'Tất cả sản phẩm'),
('KM010', N'Mua 3 tặng 1', '2025-12-09', '2025-12-19', N'Khuyến mãi', N'Áp dụng nước ép'),
('KM011', N'Tặng thẻ quà', '2025-12-10', '2025-12-20', N'Voucher', N'Khách hàng mới'),
('KM012', N'Giảm 5% cho học sinh', '2025-12-01', '2025-12-31', N'Giảm giá', N'Học sinh, sinh viên'),
('KM013', N'Giảm giá sinh nhật', '2025-12-15', '2025-12-15', N'Giảm giá', N'Khách hàng sinh nhật'),
('KM014', N'Combo giảm giá', '2025-12-11', '2025-12-25', N'Giảm giá', N'Combo cà phê + bánh'),
('KM015', N'Tặng kèm bánh ngọt', '2025-12-05', '2025-12-15', N'Khuyến mãi', N'Đơn hàng >100k'),
('KM016', N'Giảm 30% món mới', '2025-12-12', '2025-12-20', N'Giảm giá', N'Món mới'),
('KM017', N'Tặng thẻ thành viên', '2025-12-01', '2025-12-31', N'Voucher', N'Khách hàng thân thiết'),
('KM018', N'Giảm 50k đơn trên 500k', '2025-12-03', '2025-12-10', N'Giảm giá', N'Đơn >500k'),
('KM019', N'Mua 2 giảm 10%', '2025-12-02', '2025-12-12', N'Khuyến mãi', N'Áp dụng trà sữa'),
('KM020', N'Tặng coupon 20k', '2025-12-08', '2025-12-18', N'Voucher', N'Đơn hàng online'),
('KM021', N'Giảm 15% trà sữa', '2025-12-05', '2025-12-15', N'Giảm giá', N'Trà sữa Highlands'),
('KM022', N'Mua 1 tặng 1 bánh', '2025-12-06', '2025-12-12', N'Khuyến mãi', N'Bánh ngọt'),
('KM023', N'Giảm 10% cho nhóm', '2025-12-07', '2025-12-17', N'Giảm giá', N'Nhóm 4 người trở lên'),
('KM024', N'Tặng thẻ quà 100k', '2025-12-10', '2025-12-20', N'Voucher', N'Khách VIP'),
('KM025', N'Giảm giá đồ uống lớn', '2025-12-12', '2025-12-22', N'Giảm giá', N'Cốc lớn, combo'),
('KM026', N'Mua 3 tặng 1 combo', '2025-12-13', '2025-12-20', N'Khuyến mãi', N'Combo đồ uống'),
('KM027', N'Tặng điểm thưởng', '2025-12-14', '2025-12-24', N'Tích điểm', N'Khách thân thiết'),
('KM028', N'Giảm 5% tất cả đơn', '2025-12-15', '2025-12-31', N'Giảm giá', N'Toàn hệ thống'),
('KM029', N'Mua 2 tặng 1 trà sữa', '2025-12-16', '2025-12-25', N'Khuyến mãi', N'Trà sữa Highlands'),
('KM030', N'Giảm 20k cho khách mới', '2025-12-01', '2025-12-31', N'Giảm giá', N'Khách hàng mới');

INSERT INTO DonViTinhSP VALUES
('DV001', N'Cốc'),
('DV002', N'Ly'),
('DV003', N'Hộp'),
('DV004', N'Chai'),
('DV005', N'Gói'),
('DV006', N'Phần'),
('DV007', N'Set'),
('DV008', N'Bịch'),
('DV009', N'Kg'),
('DV010', N'Gram'),
('DV011', N'Lít'),
('DV012', N'Ml'),
('DV013', N'Lon'),
('DV014', N'Combo'),
('DV015', N'Miếng'),
('DV016', N'Túi'),
('DV017', N'Đĩa'),
('DV018', N'Tách'),
('DV019', N'Gói nhỏ'),
('DV020', N'Gói lớn'),
('DV021', N'Cốc nhỏ'),
('DV022', N'Cốc vừa'),
('DV023', N'Cốc lớn'),
('DV024', N'Ly giấy'),
('DV025', N'Ly nhựa'),
('DV026', N'Bình'),
('DV027', N'Hũ'),
('DV028', N'Thanh'),
('DV029', N'Viên'),
('DV030', N'Phần ăn');

INSERT INTO SanPham   (MaSP, TenSP,MoTaSP ,LoaiSP,MaDVTSP)
VALUES
('SP001', N'Cà phê sữa', N'Cà phê pha máy với sữa tươi', N'Cà phê', 'DV001'),
('SP002', N'Cà phê đen', N'Cà phê pha máy', N'Cà phê', 'DV001'),
('SP003', N'Trà sữa trân châu', N'Trà sữa truyền thống với trân châu', N'Trà', 'DV001'),
('SP004', N'Trà đào cam sả', N'Trà trái cây với đào tươi và cam', N'Trà', 'DV001'),
('SP005', N'Bánh flan', N'Bánh tráng miệng mềm mịn', N'Bánh', 'DV003'),
('SP006', N'Bánh cupcake socola', N'Bánh nhỏ, phủ socola', N'Bánh', 'DV003'),
('SP007', N'Bánh mousse chanh', N'Bánh mousse tươi mát', N'Bánh', 'DV003'),
('SP008', N'Trà chanh', N'Trà pha với chanh tươi', N'Trà', 'DV001'),
('SP009', N'Nước ép cam', N'Nước ép trái cây tươi', N'Trà', 'DV004'),
('SP010', N'Sinh tố bơ', N'Sinh tố bơ mịn', N'Trà', 'DV001'),
('SP011', N'Cà phê mocha', N'Cà phê sữa chocolate', N'Cà phê', 'DV001'),
('SP012', N'Cà phê caramel', N'Cà phê sữa caramel', N'Cà phê', 'DV001'),
('SP013', N'Trà sữa matcha', N'Trà sữa vị matcha', N'Trà', 'DV001'),
('SP014', N'Bánh tart dâu', N'Bánh tart trái cây', N'Bánh', 'DV003'),
('SP015', N'Bánh kem sữa chua', N'Bánh kem mềm mịn', N'Bánh', 'DV003'),
('SP016', N'Trà xanh mật ong', N'Trà xanh pha mật ong', N'Trà', 'DV001'),
('SP017', N'Nước ép cà rốt', N'Nước ép cà rốt tươi', N'Trà', 'DV004'),
('SP018', N'Sinh tố dâu', N'Sinh tố dâu tươi', N'Trà', 'DV001'),
('SP019', N'Bánh sandwich', N'Bánh mì sandwich', N'Bánh', 'DV006'),
('SP020', N'Bánh mì nướng phô mai', N'Bánh mì nướng với phô mai', N'Bánh', 'DV006'),
('SP021', N'Trà sữa socola', N'Trà sữa vị socola', N'Trà', 'DV001'),
('SP022', N'Cà phê bạc xỉu', N'Cà phê sữa với nhiều sữa', N'Cà phê', 'DV001'),
('SP023', N'Trà vải', N'Trà pha với vải tươi', N'Trà', 'DV001'),
('SP024', N'Sinh tố kiwi', N'Sinh tố kiwi mịn', N'Trà', 'DV001'),
('SP025', N'Bánh brownie', N'Bánh socola mềm', N'Bánh', 'DV003'),
('SP026', N'Bánh crepe', N'Bánh crepe mỏng', N'Bánh', 'DV003'),
('SP027', N'Trà hoa nhài', N'Trà xanh hoa nhài', N'Trà', 'DV001'),
('SP028', N'Nước dừa tươi', N'Nước dừa nguyên chất', N'Trà', 'DV004'),
('SP029', N'Sinh tố xoài', N'Sinh tố xoài tươi', N'Trà', 'DV001'),
('SP030', N'Bánh quy bơ', N'Bánh quy giòn thơm', N'Bánh', 'DV003');

INSERT INTO DonGiaSanPham VALUES
('SP001','2025-12-01',35000),
('SP002','2025-12-01',30000),
('SP003','2025-12-01',45000),
('SP004','2025-12-01',40000),
('SP005','2025-12-01',25000),
('SP006','2025-12-01',30000),
('SP007','2025-12-01',28000),
('SP008','2025-12-01',20000),
('SP009','2025-12-01',40000),
('SP010','2025-12-01',45000),
('SP011','2025-12-01',50000),
('SP012','2025-12-01',50000),
('SP013','2025-12-01',48000),
('SP014','2025-12-01',35000),
('SP015','2025-12-01',40000),
('SP016','2025-12-01',30000),
('SP017','2025-12-01',35000),
('SP018','2025-12-01',40000),
('SP019','2025-12-01',30000),
('SP020','2025-12-01',35000),
('SP021','2025-12-01',48000),
('SP022','2025-12-01',35000),
('SP023','2025-12-01',40000),
('SP024','2025-12-01',45000),
('SP025','2025-12-01',30000),
('SP026','2025-12-01',32000),
('SP027','2025-12-01',30000),
('SP028','2025-12-01',40000),
('SP029','2025-12-01',45000),
('SP030','2025-12-01',25000);

-- ChiTietDonHang mẫu khớp với DonHang và HoaDon_PhieuThanhToan
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia, GiamGiaDH)
VALUES
-- DH001
('DH001','SP001',2,35000,0),
('DH001','SP005',1,25000,0),
-- DH002
('DH002','SP002',1,30000,0),
('DH002','SP006',2,30000,5000),
-- DH003
('DH003','SP003',1,45000,0),
('DH003','SP004',1,40000,0),
-- DH004
('DH004','SP001',1,35000,0),
('DH004','SP007',1,28000,0),
-- DH005
('DH005','SP008',2,20000,0),
('DH005','SP009',1,40000,0),
-- DH006
('DH006','SP010',1,45000,0),
('DH006','SP011',1,50000,0),
-- DH007
('DH007','SP012',1,50000,0),
('DH007','SP013',1,48000,0),
-- DH008
('DH008','SP014',1,35000,0),
('DH008','SP015',1,40000,0),
-- DH009
('DH009','SP016',2,30000,0),
('DH009','SP017',1,35000,0),
-- DH010
('DH010','SP018',1,40000,0),
('DH010','SP019',1,30000,0);

-- DH011 → DH020
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia, GiamGiaDH)
VALUES
-- DH011
('DH011','SP001',1,35000,0),
('DH011','SP002',2,30000,0),
-- DH012
('DH012','SP003',1,45000,0),
('DH012','SP004',1,40000,0),
-- DH013
('DH013','SP005',1,25000,0),
('DH013','SP006',1,30000,0),
-- DH014
('DH014','SP007',2,28000,0),
('DH014','SP008',1,20000,0),
-- DH015
('DH015','SP009',1,40000,0),
('DH015','SP010',1,45000,0),
-- DH016
('DH016','SP011',1,50000,0),
('DH016','SP012',1,50000,0),
-- DH017
('DH017','SP013',1,48000,0),
('DH017','SP014',1,35000,0),
-- DH018
('DH018','SP015',1,40000,0),
('DH018','SP016',2,30000,0),
-- DH019
('DH019','SP017',1,35000,0),
('DH019','SP018',1,40000,0),
-- DH020
('DH020','SP019',2,30000,0),
('DH020','SP020',1,35000,0);

-- DH021 → DH030
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia, GiamGiaDH)
VALUES
-- DH021
('DH021','SP021',1,48000,0),
('DH021','SP022',1,35000,0),
-- DH022
('DH022','SP023',1,40000,0),
('DH022','SP024',1,45000,0),
-- DH023
('DH023','SP025',1,30000,0),
('DH023','SP026',1,32000,0),
-- DH024
('DH024','SP027',1,30000,0),
('DH024','SP028',1,40000,0),
-- DH025
('DH025','SP029',1,45000,0),
('DH025','SP030',1,25000,0),
-- DH026
('DH026','SP001',1,35000,0),
('DH026','SP003',1,45000,0),
-- DH027
('DH027','SP005',2,25000,0),
('DH027','SP007',1,28000,0),
-- DH028
('DH028','SP009',1,40000,0),
('DH028','SP011',1,50000,0),
-- DH029
('DH029','SP013',1,48000,0),
('DH029','SP015',1,40000,0),
-- DH030
('DH030','SP017',1,35000,0),
('DH030','SP019',1,30000,0);

INSERT INTO KhuyenMaiSP (MaKM, MaSP, TyLeGiamSP) VALUES
('KM001','SP001',0.10),
('KM002','SP002',0.15),
('KM003','SP003',0.20),
('KM004','SP004',0.05),
('KM005','SP005',0.10),
('KM006','SP006',0.12),
('KM007','SP007',0.08),
('KM008','SP008',0.18),
('KM009','SP009',0.07),
('KM010','SP010',0.10),
('KM011','SP011',0.15),
('KM012','SP012',0.05),
('KM013','SP013',0.20),
('KM014','SP014',0.10),
('KM015','SP015',0.08),
('KM016','SP016',0.12),
('KM017','SP017',0.15),
('KM018','SP018',0.10),
('KM019','SP019',0.05),
('KM020','SP020',0.20),
('KM021','SP021',0.10),
('KM022','SP022',0.15),
('KM023','SP023',0.08),
('KM024','SP024',0.12),
('KM025','SP025',0.10),
('KM026','SP026',0.05),
('KM027','SP027',0.15),
('KM028','SP028',0.10),
('KM029','SP029',0.20),
('KM030','SP030',0.10);

INSERT INTO KhuyenMaiHD (MaKM, MaHD, TyLeGiamHD) VALUES
('KM001', 'HD001', 0.10),
('KM002', 'HD002', 0.15),
('KM003', 'HD003', 0.20),
('KM004', 'HD004', 0.05),
('KM005', 'HD005', 0.10),
('KM006', 'HD006', 0.12),
('KM007', 'HD007', 0.08),
('KM008', 'HD008', 0.10),
('KM009', 'HD009', 0.15),
('KM010', 'HD010', 0.05),
('KM011', 'HD011', 0.10),
('KM012', 'HD012', 0.12),
('KM013', 'HD013', 0.08),
('KM014', 'HD014', 0.10),
('KM015', 'HD015', 0.20),
('KM016', 'HD016', 0.15),
('KM017', 'HD017', 0.10),
('KM018', 'HD018', 0.05),
('KM019', 'HD019', 0.10),
('KM020', 'HD020', 0.12),
('KM021', 'HD021', 0.08),
('KM022', 'HD022', 0.10),
('KM023', 'HD023', 0.15),
('KM024', 'HD024', 0.05),
('KM025', 'HD025', 0.10),
('KM026', 'HD026', 0.12),
('KM027', 'HD027', 0.08),
('KM028', 'HD028', 0.10),
('KM029', 'HD029', 0.20),
('KM030', 'HD030', 0.15);

INSERT INTO LoaiNVL VALUES
('LNVL01',N'Nguyên liệu cà phê'),
('LNVL02',N'Nguyên liệu trà'),
('LNVL03',N'Nguyên liệu sữa'),
('LNVL04',N'Nguyên liệu đường'),
('LNVL05',N'Nguyên liệu trái cây'),
('LNVL06',N'Nguyên liệu bánh'),
('LNVL07',N'Nguyên liệu topping'),
('LNVL08',N'Nguyên liệu nước ép'),
('LNVL09',N'Nguyên liệu phụ kiện'),
('LNVL10',N'Nguyên liệu khác'),
('LNVL11',N'Hạt cacao'),
('LNVL12',N'Siro hương vị'),
('LNVL13',N'Kem tươi'),
('LNVL14',N'Thạch trân châu'),
('LNVL15',N'Bột cacao'),
('LNVL16',N'Bột trà xanh'),
('LNVL17',N'Bánh bông lan'),
('LNVL18',N'Bánh tart'),
('LNVL19',N'Trái cây tươi'),
('LNVL20',N'Đường cát'),
('LNVL21',N'Sữa đặc'),
('LNVL22',N'Sữa tươi'),
('LNVL23',N'Bột mì'),
('LNVL24',N'Phô mai'),
('LNVL25',N'Trái cây đông lạnh'),
('LNVL26',N'Nước lọc'),
('LNVL27',N'Trà túi lọc'),
('LNVL28',N'Đá viên'),
('LNVL29',N'Topping socola'),
('LNVL30',N'Topping caramel');

INSERT INTO DonViTinhNL VALUES
('DVT01',N'Kg'),
('DVT02',N'Gram'),
('DVT03',N'Lít'),
('DVT04',N'Ml'),
('DVT05',N'Hộp'),
('DVT06',N'Gói'),
('DVT07',N'Chai'),
('DVT08',N'Lon'),
('DVT09',N'Cốc'),
('DVT10',N'Túi'),
('DVT11',N'Viên'),
('DVT12',N'Phần'),
('DVT13',N'Thanh'),
('DVT14',N'Tách'),
('DVT15',N'Set'),
('DVT16',N'Đĩa'),
('DVT17',N'Hũ'),
('DVT18',N'Bình'),
('DVT19',N'Ly'),
('DVT20',N'Miếng'),
('DVT21',N'Bịch'),
('DVT22',N'Gói nhỏ'),
('DVT23',N'Gói lớn'),
('DVT24',N'Combo'),
('DVT25',N'Cốc nhỏ'),
('DVT26',N'Cốc vừa'),
('DVT27',N'Cốc lớn'),
('DVT28',N'Ly giấy'),
('DVT29',N'Ly nhựa'),
('DVT30',N'Phần ăn');

INSERT INTO NguyenLieu VALUES
('NL001',N'Cà phê Arabica','2026-06-30','LNVL01','DVT01'),
('NL002',N'Cà phê Robusta','2026-06-30','LNVL01','DVT01'),
('NL003',N'Trà đen','2026-05-31','LNVL02','DVT02'),
('NL004',N'Trà xanh','2026-05-31','LNVL02','DVT02'),
('NL005',N'Sữa tươi','2026-12-31','LNVL03','DVT03'),
('NL006',N'Sữa đặc có đường','2026-12-31','LNVL03','DVT03'),
('NL007',N'Đường cát trắng','2026-12-31','LNVL04','DVT01'),
('NL008',N'Trái cây tươi','2026-12-31','LNVL05','DVT01'),
('NL009',N'Bánh flan','2026-12-31','LNVL06','DVT05'),
('NL010',N'Bánh cupcake','2026-12-31','LNVL06','DVT05'),
('NL011',N'Thạch trân châu','2026-12-31','LNVL07','DVT06'),
('NL012',N'Nước cam','2026-12-31','LNVL08','DVT03'),
('NL013',N'Nước ép cà rốt','2026-12-31','LNVL08','DVT03'),
('NL014',N'Ly nhựa','2027-12-31','LNVL09','DVT29'),
('NL015',N'Hộp bánh','2027-12-31','LNVL09','DVT05'),
('NL016',N'Hạt cacao','2026-06-30','LNVL11','DVT01'),
('NL017',N'Siro caramel','2026-12-31','LNVL12','DVT04'),
('NL018',N'Kem tươi','2026-12-31','LNVL13','DVT03'),
('NL019',N'Bột cacao','2026-06-30','LNVL15','DVT02'),
('NL020',N'Bột trà xanh','2026-06-30','LNVL16','DVT02'),
('NL021',N'Bánh bông lan','2026-12-31','LNVL17','DVT05'),
('NL022',N'Bánh tart dâu','2026-12-31','LNVL18','DVT05'),
('NL023',N'Đá viên','2027-12-31','LNVL28','DVT28'),
('NL024',N'Trái cây đông lạnh','2026-12-31','LNVL25','DVT25'),
('NL025',N'Topping socola','2026-12-31','LNVL29','DVT06'),
('NL026',N'Topping caramel','2026-12-31','LNVL30','DVT06'),
('NL027',N'Sữa hạnh nhân','2026-12-31','LNVL03','DVT03'),
('NL028',N'Trà oolong','2026-05-31','LNVL02','DVT02'),
('NL029',N'Siro vanilla','2026-12-31','LNVL12','DVT04'),
('NL030',N'Bột mì','2026-12-31','LNVL23','DVT02');

INSERT INTO DinhMuc VALUES
('SP001','NL001',50),
('SP001','NL005',100),
('SP002','NL002',50),
('SP002','NL006',50),
('SP003','NL004',30),
('SP003','NL005',50),
('SP003','NL011',20),
('SP004','NL004',50),
('SP004','NL008',30),
('SP005','NL009',1),
('SP006','NL010',1),
('SP007','NL021',1),
('SP008','NL004',20),
('SP008','NL007',10),
('SP009','NL012',200),
('SP009','NL008',50),
('SP010','NL008',50),
('SP010','NL018',50),
('SP011','NL001',50),
('SP011','NL017',20),
('SP012','NL001',50),
('SP012','NL017',25),
('SP013','NL020',30),
('SP013','NL005',50),
('SP014','NL022',1),
('SP015','NL021',1),
('SP016','NL004',30),
('SP016','NL017',10),
('SP017','NL013',200),
('SP017','NL018',50),
('SP018','NL008',50),
('SP018','NL018',50),
('SP019','NL021',1),
('SP020','NL021',1);

INSERT INTO NhaCungCap VALUES
('NCC001', N'Công ty Cà phê Trung Nguyên', 'trungnguyen@gmail.com', '0901111111', N'Buôn Ma Thuột, Đắk Lắk', N'Cà phê hạt', N'Đang hợp tác'),
('NCC002', N'Công ty Vinamilk', 'vinamilk@gmail.com', '0902222222', N'Quận 7, TP.HCM', N'Sữa và chế phẩm từ sữa', N'Đang hợp tác'),
('NCC003', N'Công ty Tân Hiệp Phát', 'thp@gmail.com', '0903333333', N'Bình Dương', N'Trà đóng chai, nước giải khát', N'Đang hợp tác'),
('NCC004', N'Công ty Bột Mì Bình An', 'botmi@gmail.com', '0904444444', N'Long An', N'Bột mì, nguyên liệu pha chế', N'Ngừng hợp tác'),
('NCC005', N'Công ty Đường Biên Hòa', 'duongbh@gmail.com', '0905555555', N'Đồng Nai', N'Đường, siro', N'Đang hợp tác'),
('NCC006', N'Công ty Bao bì Sài Gòn', 'baobi@gmail.com', '0906666666', N'Quận 12, TP.HCM', N'Ly giấy, ống hút, bao bì', N'Đang hợp tác'),
('NCC007', N'Công ty Rau củ sạch Đà Lạt', 'dalatfarm@gmail.com', '0907777777', N'Đà Lạt, Lâm Đồng', N'Trái cây, rau củ', N'Đang hợp tác'),
('NCC008', N'Công ty Trà Phúc Long', 'phuclong@gmail.com', '0908888888', N'Quận 1, TP.HCM', N'Trà nguyên liệu', N'Đang hợp tác'),
('NCC009', N'Công ty Thiết bị Barista Pro', 'barista@gmail.com', '0909999999', N'Hà Nội', N'Máy pha cà phê, thiết bị', N'Đang hợp tác'),
('NCC010', N'Công ty Đá viên Sạch Sài Gòn', 'davien@gmail.com', '0910000000', N'Quận Bình Thạnh, TP.HCM', N'Đá viên', N'Đang hợp tác'),
('NCC011', N'Công ty Socola Việt', 'socola@gmail.com', '0911111111', N'Quận 5, TP.HCM', N'Socola, topping', N'Đang hợp tác'),
('NCC012', N'Công ty Hương liệu FoodTech', 'foodtech@gmail.com', '0912222222', N'Quận Tân Bình, TP.HCM', N'Hương liệu pha chế', N'Đang hợp tác'),
('NCC013', N'Công ty Giao hàng Nhanh', 'ghn@gmail.com', '0913333333', N'Quận Phú Nhuận, TP.HCM', N'Dịch vụ vận chuyển', N'Đang hợp tác'),
('NCC014', N'Công ty Khăn giấy An Phát', 'khangiay@gmail.com', '0914444444', N'Bình Dương', N'Khăn giấy, vật tư tiêu hao', N'Đang hợp tác'),
('NCC015', N'Công ty Nước tinh khiết Lavie', 'lavie@gmail.com', '0915555555', N'Long An', N'Nước uống đóng chai', N'Đang hợp tác');

INSERT INTO PhieuNhapKho VALUES
('PNK001',100,'2025-11-01',N'Nhập nguyên liệu cơ bản',N'Bổ sung stock','NV001','NCC001'),
('PNK002',50,'2025-11-02',N'Nhập nguyên liệu đồ uống',N'Bổ sung stock','NV002','NCC002'),
('PNK003',70,'2025-11-03',N'Nhập nguyên liệu bánh ngọt',N'Bổ sung stock','NV003','NCC004'),
('PNK004',60,'2025-11-04',N'Nhập trái cây',N'Bổ sung stock','NV004','NCC007'),
('PNK005',80,'2025-11-05',N'Nhập nguyên liệu topping',N'Bổ sung stock','NV005','NCC011'),
('PNK006',40,'2025-11-06',N'Nhập nước ép',N'Bổ sung stock','NV006','NCC003'),
('PNK007',90,'2025-11-07',N'Nhập trà',N'Bổ sung stock','NV007','NCC008'),
('PNK008',30,'2025-11-08',N'Nhập sữa',N'Bổ sung stock','NV008','NCC002'),
('PNK009',20,'2025-11-09',N'Nhập cacao',N'Bổ sung stock','NV009','NCC011'),
('PNK010',60,'2025-11-10',N'Nhập bánh ngọt',N'Bổ sung stock','NV010','NCC004'),
('PNK011',50,'2025-11-11',N'Nhập nguyên liệu cơ bản',N'Bổ sung stock','NV011','NCC001'),
('PNK012',70,'2025-11-12',N'Nhập nguyên liệu đồ uống',N'Bổ sung stock','NV012','NCC002'),
('PNK013',40,'2025-11-13',N'Nhập nguyên liệu topping',N'Bổ sung stock','NV013','NCC011'),
('PNK014',60,'2025-11-14',N'Nhập nước ép',N'Bổ sung stock','NV014','NCC003'),
('PNK015',80,'2025-11-15',N'Nhập sữa',N'Bổ sung stock','NV015','NCC002'),
('PNK016',90,'2025-11-16',N'Nhập trà',N'Bổ sung stock','NV016','NCC008'),
('PNK017',100,'2025-11-17',N'Nhập nguyên liệu cơ bản',N'Bổ sung stock','NV017','NCC001'),
('PNK018',50,'2025-11-18',N'Nhập nguyên liệu đồ uống',N'Bổ sung stock','NV018','NCC002'),
('PNK019',70,'2025-11-19',N'Nhập nguyên liệu topping',N'Bổ sung stock','NV019','NCC011'),
('PNK020',60,'2025-11-20',N'Nhập nước ép',N'Bổ sung stock','NV020','NCC003'),
('PNK021',80,'2025-11-21',N'Nhập sữa',N'Bổ sung stock','NV021','NCC002'),
('PNK022',40,'2025-11-22',N'Nhập cacao',N'Bổ sung stock','NV022','NCC011'),
('PNK023',90,'2025-11-23',N'Nhập bánh ngọt',N'Bổ sung stock','NV023','NCC004'),
('PNK024',30,'2025-11-24',N'Nhập trà',N'Bổ sung stock','NV024','NCC008'),
('PNK025',50,'2025-11-25',N'Nhập nguyên liệu cơ bản',N'Bổ sung stock','NV025','NCC001'),
('PNK026',70,'2025-11-26',N'Nhập nguyên liệu đồ uống',N'Bổ sung stock','NV026','NCC002'),
('PNK027',40,'2025-11-27',N'Nhập nước ép',N'Bổ sung stock','NV027','NCC003'),
('PNK028',60,'2025-11-28',N'Nhập sữa',N'Bổ sung stock','NV028','NCC002'),
('PNK029',80,'2025-11-29',N'Nhập trà',N'Bổ sung stock','NV029','NCC008'),
('PNK030',90,'2025-11-30',N'Nhập nguyên liệu topping',N'Bổ sung stock','NV030','NCC011');

INSERT INTO ChiTietPNK VALUES
('PNK001','NL001',20,50000,1000000),
('PNK002','NL002',15,48000,720000),
('PNK003','NL003',30,20000,600000),
('PNK004','NL004',25,25000,625000),
('PNK005','NL005',40,30000,1200000),
('PNK006','NL006',35,32000,1120000),
('PNK007','NL007',50,15000,750000),
('PNK008','NL008',20,40000,800000),
('PNK009','NL009',10,25000,250000),
('PNK010','NL010',15,30000,450000),
('PNK011','NL011',10,20000,200000),
('PNK012','NL012',20,30000,600000),
('PNK013','NL013',15,35000,525000),
('PNK014','NL014',30,5000,150000),
('PNK015','NL015',20,10000,200000),
('PNK016','NL016',25,60000,1500000),
('PNK017','NL017',20,20000,400000),
('PNK018','NL018',30,40000,1200000),
('PNK019','NL019',25,25000,625000),
('PNK020','NL020',15,30000,450000),
('PNK021','NL021',10,20000,200000),
('PNK022','NL022',10,25000,250000),
('PNK023','NL023',50,10000,500000),
('PNK024','NL024',30,40000,1200000),
('PNK025','NL025',20,15000,300000),
('PNK026','NL026',15,20000,300000),
('PNK027','NL027',25,35000,875000),
('PNK028','NL028',10,30000,300000),
('PNK029','NL029',20,25000,500000),
('PNK030','NL030',30,15000,450000);

INSERT INTO TonKho VALUES
('NL001','2025-12-01',12,2025,50,2500000,20,1000000,10,500000,60,3000000),
('NL002','2025-12-01',12,2025,30,1440000,15,720000,5,240000,40,1920000),
('NL003','2025-12-01',12,2025,40,800000,30,600000,25,500000,45,900000),
('NL004','2025-12-01',12,2025,25,625000,25,625000,15,375000,35,875000),
('NL005','2025-12-01',12,2025,60,1800000,40,1200000,30,900000,70,2100000),
('NL006','2025-12-01',12,2025,50,1600000,35,1120000,20,640000,65,2080000),
('NL007','2025-12-01',12,2025,80,1200000,50,750000,30,450000,100,1500000),
('NL008','2025-12-01',12,2025,30,1200000,20,800000,10,400000,40,1600000),
('NL009','2025-12-01',12,2025,15,375000,10,250000,5,125000,20,500000),
('NL010','2025-12-01',12,2025,20,600000,15,450000,10,300000,25,750000),
('NL011','2025-12-01',12,2025,10,200000,10,200000,5,100000,15,300000),
('NL012','2025-12-01',12,2025,25,750000,20,600000,15,450000,30,900000),
('NL013','2025-12-01',12,2025,20,700000,15,525000,10,350000,25,875000),
('NL014','2025-12-01',12,2025,50,250000,30,150000,20,100000,60,300000),
('NL015','2025-12-01',12,2025,40,400000,20,200000,10,100000,50,500000),
('NL016','2025-12-01',12,2025,30,1800000,25,1500000,15,900000,40,3000000),
('NL017','2025-12-01',12,2025,20,400000,20,400000,10,200000,30,600000),
('NL018','2025-12-01',12,2025,50,2000000,30,1200000,25,1000000,55,2200000),
('NL019','2025-12-01',12,2025,25,625000,25,625000,15,375000,35,875000),
('NL020','2025-12-01',12,2025,15,450000,15,450000,10,300000,20,600000),
('NL021','2025-12-01',12,2025,10,200000,10,200000,5,100000,15,300000),
('NL022','2025-12-01',12,2025,10,200000,10,200000,5,100000,15,300000),
('NL023','2025-12-01',12,2025,50,500000,50,500000,25,250000,75,750000),
('NL024','2025-12-01',12,2025,20,800000,30,1200000,15,600000,35,2000000),
('NL025','2025-12-01',12,2025,15,225000,20,300000,10,150000,25,525000);