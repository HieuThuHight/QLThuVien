-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 29, 2026 lúc 08:10 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlythuvien_uneti`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietmuon`
--

CREATE TABLE `chitietmuon` (
  `MaCTM` int(11) NOT NULL,
  `MaPhieuMuon` int(11) NOT NULL,
  `MaSach` int(11) NOT NULL,
  `NgayTraThucTe` date DEFAULT NULL,
  `TinhTrangSach` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietmuon`
--

INSERT INTO `chitietmuon` (`MaCTM`, `MaPhieuMuon`, `MaSach`, `NgayTraThucTe`, `TinhTrangSach`) VALUES
(1, 1, 2, '2025-06-14', 'Bình thường'),
(2, 1, 1, '2025-06-14', 'Bình thường'),
(3, 2, 5, NULL, NULL),
(4, 3, 3, NULL, NULL),
(5, 4, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnhap`
--

CREATE TABLE `chitietnhap` (
  `MaCTN` int(11) NOT NULL,
  `MaPhieuNhap` int(11) NOT NULL,
  `MaSach` int(11) NOT NULL,
  `SoLuongNhap` int(11) NOT NULL,
  `DonGiaNhap` decimal(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietnhap`
--

INSERT INTO `chitietnhap` (`MaCTN`, `MaPhieuNhap`, `MaSach`, `SoLuongNhap`, `DonGiaNhap`) VALUES
(1, 1, 2, 15, 70000),
(2, 1, 6, 10, 60000),
(3, 2, 5, 20, 55000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doanhthu`
--

CREATE TABLE `doanhthu` (
  `MaDoanhThu` int(11) NOT NULL,
  `MaPhieuPhat` int(11) DEFAULT NULL,
  `MaNV` int(11) NOT NULL,
  `LoaiThu` varchar(50) NOT NULL,
  `SoTien` decimal(12,0) NOT NULL,
  `NgayThu` datetime NOT NULL DEFAULT current_timestamp(),
  `GhiChu` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `doanhthu`
--

INSERT INTO `doanhthu` (`MaDoanhThu`, `MaPhieuPhat`, `MaNV`, `LoaiThu`, `SoTien`, `NgayThu`, `GhiChu`) VALUES
(1, NULL, 4, 'Phí làm thẻ', 50000, '2025-06-01 09:00:00', 'Thu phí làm thẻ độc giả mới - Nguyễn Thị Lan'),
(2, 1, 4, 'Phí phạt', 50000, '2025-07-21 09:30:00', 'Thu tiền phạt trả sách quá hạn - Trần Văn Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `docgia`
--

CREATE TABLE `docgia` (
  `MaDG` int(11) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` varchar(10) DEFAULT NULL,
  `LoaiDocGia` varchar(20) NOT NULL,
  `MaThe` varchar(20) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `DiaChi` varchar(200) DEFAULT NULL,
  `NgayDangKy` date NOT NULL DEFAULT curdate(),
  `NgayHetHan` date DEFAULT NULL,
  `TrangThai` varchar(20) NOT NULL DEFAULT 'Hoạt động'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `docgia`
--

INSERT INTO `docgia` (`MaDG`, `HoTen`, `NgaySinh`, `GioiTinh`, `LoaiDocGia`, `MaThe`, `Email`, `SDT`, `DiaChi`, `NgayDangKy`, `NgayHetHan`, `TrangThai`) VALUES
(1, 'Phạm Thái Hoàng', NULL, NULL, 'Sinh viên', 'SV2025001', 'hoang@student.uneti.edu.vn', NULL, NULL, '2026-07-24', NULL, 'Hoạt động'),
(2, 'Nguyễn Thị Lan', NULL, NULL, 'Sinh viên', 'SV2025002', 'lan@student.uneti.edu.vn', '0981111111', NULL, '2026-07-24', NULL, 'Hoạt động'),
(3, 'Trần Văn Nam', NULL, NULL, 'Sinh viên', 'SV2025003', 'nam@student.uneti.edu.vn', '0981111112', NULL, '2026-07-24', NULL, 'Hoạt động'),
(4, 'Lê Thị Hoa', NULL, NULL, 'Giảng viên', 'GV2025001', 'hoa.gv@uneti.edu.vn', '0981111113', NULL, '2026-07-24', NULL, 'Hoạt động'),
(5, 'Phạm Văn Đức', NULL, NULL, 'Sinh viên', 'SV2025004', 'duc@student.uneti.edu.vn', '0981111114', NULL, '2026-07-24', NULL, 'Hoạt động'),
(6, 'Hoàng Thị Mai', NULL, NULL, 'Giảng viên', 'GV2025002', 'mai.gv@uneti.edu.vn', '0981111115', NULL, '2026-07-24', NULL, 'Hoạt động');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `MaNCC` int(11) NOT NULL,
  `TenNCC` varchar(150) NOT NULL,
  `DiaChi` varchar(200) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `NguoiLienHe` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`MaNCC`, `TenNCC`, `DiaChi`, `SDT`, `Email`, `NguoiLienHe`) VALUES
(1, 'NXB Giáo Dục Việt Nam', 'Hà Nội', '0243333333', NULL, NULL),
(2, 'NXB Bách Khoa Hà Nội', 'Hà Nội', '0243444444', NULL, 'Nguyễn Văn Bách'),
(3, 'Công ty Sách Fahasa', 'TP.HCM', '0283555555', NULL, 'Trần Thị Sách');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` varchar(10) DEFAULT NULL,
  `ChucVu` varchar(50) NOT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DiaChi` varchar(200) DEFAULT NULL,
  `NgayVaoLam` date NOT NULL DEFAULT curdate(),
  `TrangThai` varchar(20) NOT NULL DEFAULT 'Đang làm việc',
  `TaiKhoan` varchar(50) DEFAULT NULL,
  `MatKhau` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoTen`, `NgaySinh`, `GioiTinh`, `ChucVu`, `SDT`, `Email`, `DiaChi`, `NgayVaoLam`, `TrangThai`, `TaiKhoan`, `MatKhau`) VALUES
(1, 'Nguyễn Văn Quản', NULL, NULL, 'Quản lý', '0912345678', 'quanly@uneti.edu.vn', NULL, '2026-07-24', 'Đang làm việc', NULL, NULL),
(2, 'Trần Thị Thư', NULL, NULL, 'Thủ thư', '0912345679', 'thuthu@uneti.edu.vn', NULL, '2026-07-24', 'Đang làm việc', NULL, NULL),
(3, 'Lê Văn Kho', NULL, NULL, 'Thủ kho', '0912345680', 'thukho@uneti.edu.vn', NULL, '2026-07-24', 'Đang làm việc', NULL, NULL),
(4, 'Đỗ Thị Kế', NULL, NULL, 'Kế toán', '0912345681', 'ketoan@uneti.edu.vn', NULL, '2026-07-24', 'Đang làm việc', NULL, NULL),
(5, 'Vũ Văn Thư', NULL, NULL, 'Thủ thư', '0912345682', 'thuthu2@uneti.edu.vn', NULL, '2026-07-24', 'Đang làm việc', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieumuon`
--

CREATE TABLE `phieumuon` (
  `MaPhieuMuon` int(11) NOT NULL,
  `MaDG` int(11) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayMuon` datetime NOT NULL DEFAULT current_timestamp(),
  `NgayHenTra` date NOT NULL,
  `TrangThai` varchar(20) NOT NULL DEFAULT 'Đang mượn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phieumuon`
--

INSERT INTO `phieumuon` (`MaPhieuMuon`, `MaDG`, `MaNV`, `NgayMuon`, `NgayHenTra`, `TrangThai`) VALUES
(1, 2, 2, '2025-06-01 09:00:00', '2025-06-15', 'Đã trả'),
(2, 3, 2, '2025-06-10 10:30:00', '2025-06-24', 'Đang mượn'),
(3, 1, 5, '2025-07-01 14:00:00', '2025-07-15', 'Quá hạn'),
(4, 4, 2, '2025-07-10 08:45:00', '2025-07-24', 'Đang mượn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieunhap`
--

CREATE TABLE `phieunhap` (
  `MaPhieuNhap` int(11) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `MaNCC` int(11) NOT NULL,
  `NgayNhap` datetime NOT NULL DEFAULT current_timestamp(),
  `TongTien` decimal(14,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phieunhap`
--

INSERT INTO `phieunhap` (`MaPhieuNhap`, `MaNV`, `MaNCC`, `NgayNhap`, `TongTien`) VALUES
(1, 3, 2, '2025-05-01 08:00:00', 1650000),
(2, 3, 1, '2025-05-15 08:00:00', 1100000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieuphat`
--

CREATE TABLE `phieuphat` (
  `MaPhieuPhat` int(11) NOT NULL,
  `MaCTM` int(11) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `LyDoPhat` varchar(200) NOT NULL,
  `SoTienPhat` decimal(12,0) NOT NULL DEFAULT 0,
  `NgayLap` datetime NOT NULL DEFAULT current_timestamp(),
  `TrangThaiThanhToan` varchar(20) NOT NULL DEFAULT 'Chưa thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phieuphat`
--

INSERT INTO `phieuphat` (`MaPhieuPhat`, `MaCTM`, `MaNV`, `LyDoPhat`, `SoTienPhat`, `NgayLap`, `TrangThaiThanhToan`) VALUES
(1, 4, 2, 'Trả sách quá hạn 10 ngày', 50000, '2025-07-20 10:00:00', 'Chưa thanh toán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `MaSach` int(11) NOT NULL,
  `TenSach` varchar(250) NOT NULL,
  `TacGia` varchar(150) DEFAULT NULL,
  `TheLoai` varchar(100) DEFAULT NULL,
  `NhaXuatBan` varchar(150) DEFAULT NULL,
  `NamXuatBan` int(11) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `DonGia` decimal(12,0) NOT NULL DEFAULT 0,
  `SoLuongTong` int(11) NOT NULL DEFAULT 0,
  `SoLuongConLai` int(11) NOT NULL DEFAULT 0,
  `ViTriKe` varchar(50) DEFAULT NULL,
  `MoTa` text DEFAULT NULL
) ;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`MaSach`, `TenSach`, `TacGia`, `TheLoai`, `NhaXuatBan`, `NamXuatBan`, `ISBN`, `DonGia`, `SoLuongTong`, `SoLuongConLai`, `ViTriKe`, `MoTa`) VALUES
(1, 'Cơ sở dữ liệu', 'Nguyễn Văn A', 'CNTT', 'NXB Giáo Dục', 2023, NULL, 85000, 10, 10, NULL, NULL),
(2, 'Lập trình C căn bản', 'Phạm Văn Ất', 'CNTT', 'NXB Khoa học Kỹ thuật', 2022, NULL, 75000, 15, 15, 'A1-01', NULL),
(3, 'Kế toán tài chính', 'Nguyễn Văn Công', 'Kinh tế', 'NXB Tài Chính', 2021, NULL, 90000, 8, 8, 'B1-02', NULL),
(4, 'Marketing căn bản', 'Trần Minh Đạo', 'Kinh tế', 'NXB Đại học Kinh tế Quốc dân', 2020, NULL, 70000, 12, 12, 'B1-03', NULL),
(5, 'Toán cao cấp', 'Nguyễn Đình Trí', 'Toán học', 'NXB Giáo Dục', 2019, NULL, 60000, 20, 20, 'C1-01', NULL),
(6, 'Vật lý đại cương', 'Lương Duyên Bình', 'Vật lý', 'NXB Giáo Dục', 2020, NULL, 65000, 10, 10, 'C1-02', NULL),
(7, 'Tiếng Anh chuyên ngành CNTT', 'John Smith', 'Ngoại ngữ', 'NXB Đại học Quốc gia Hà Nội', 2023, NULL, 95000, 6, 6, 'D1-01', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietmuon`
--
ALTER TABLE `chitietmuon`
  ADD PRIMARY KEY (`MaCTM`),
  ADD KEY `FK_ChiTietMuon_PhieuMuon` (`MaPhieuMuon`),
  ADD KEY `FK_ChiTietMuon_Sach` (`MaSach`);

--
-- Chỉ mục cho bảng `chitietnhap`
--
ALTER TABLE `chitietnhap`
  ADD PRIMARY KEY (`MaCTN`),
  ADD KEY `FK_ChiTietNhap_PhieuNhap` (`MaPhieuNhap`),
  ADD KEY `FK_ChiTietNhap_Sach` (`MaSach`);

--
-- Chỉ mục cho bảng `doanhthu`
--
ALTER TABLE `doanhthu`
  ADD PRIMARY KEY (`MaDoanhThu`),
  ADD KEY `FK_DoanhThu_PhieuPhat` (`MaPhieuPhat`),
  ADD KEY `FK_DoanhThu_NhanVien` (`MaNV`);

--
-- Chỉ mục cho bảng `docgia`
--
ALTER TABLE `docgia`
  ADD PRIMARY KEY (`MaDG`),
  ADD UNIQUE KEY `UQ_DocGia_MaThe` (`MaThe`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`MaNCC`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`);

--
-- Chỉ mục cho bảng `phieumuon`
--
ALTER TABLE `phieumuon`
  ADD PRIMARY KEY (`MaPhieuMuon`),
  ADD KEY `FK_PhieuMuon_DocGia` (`MaDG`),
  ADD KEY `FK_PhieuMuon_NhanVien` (`MaNV`);

--
-- Chỉ mục cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD PRIMARY KEY (`MaPhieuNhap`),
  ADD KEY `FK_PhieuNhap_NhanVien` (`MaNV`),
  ADD KEY `FK_PhieuNhap_NhaCungCap` (`MaNCC`);

--
-- Chỉ mục cho bảng `phieuphat`
--
ALTER TABLE `phieuphat`
  ADD PRIMARY KEY (`MaPhieuPhat`),
  ADD KEY `FK_PhieuPhat_ChiTietMuon` (`MaCTM`),
  ADD KEY `FK_PhieuPhat_NhanVien` (`MaNV`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`MaSach`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitietmuon`
--
ALTER TABLE `chitietmuon`
  MODIFY `MaCTM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `chitietnhap`
--
ALTER TABLE `chitietnhap`
  MODIFY `MaCTN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `doanhthu`
--
ALTER TABLE `doanhthu`
  MODIFY `MaDoanhThu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `docgia`
--
ALTER TABLE `docgia`
  MODIFY `MaDG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `MaNCC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `phieumuon`
--
ALTER TABLE `phieumuon`
  MODIFY `MaPhieuMuon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  MODIFY `MaPhieuNhap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `phieuphat`
--
ALTER TABLE `phieuphat`
  MODIFY `MaPhieuPhat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `MaSach` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitietmuon`
--
ALTER TABLE `chitietmuon`
  ADD CONSTRAINT `FK_ChiTietMuon_PhieuMuon` FOREIGN KEY (`MaPhieuMuon`) REFERENCES `phieumuon` (`MaPhieuMuon`),
  ADD CONSTRAINT `FK_ChiTietMuon_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`);

--
-- Các ràng buộc cho bảng `chitietnhap`
--
ALTER TABLE `chitietnhap`
  ADD CONSTRAINT `FK_ChiTietNhap_PhieuNhap` FOREIGN KEY (`MaPhieuNhap`) REFERENCES `phieunhap` (`MaPhieuNhap`),
  ADD CONSTRAINT `FK_ChiTietNhap_Sach` FOREIGN KEY (`MaSach`) REFERENCES `sach` (`MaSach`);

--
-- Các ràng buộc cho bảng `doanhthu`
--
ALTER TABLE `doanhthu`
  ADD CONSTRAINT `FK_DoanhThu_NhanVien` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  ADD CONSTRAINT `FK_DoanhThu_PhieuPhat` FOREIGN KEY (`MaPhieuPhat`) REFERENCES `phieuphat` (`MaPhieuPhat`);

--
-- Các ràng buộc cho bảng `phieumuon`
--
ALTER TABLE `phieumuon`
  ADD CONSTRAINT `FK_PhieuMuon_DocGia` FOREIGN KEY (`MaDG`) REFERENCES `docgia` (`MaDG`),
  ADD CONSTRAINT `FK_PhieuMuon_NhanVien` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD CONSTRAINT `FK_PhieuNhap_NhaCungCap` FOREIGN KEY (`MaNCC`) REFERENCES `nhacungcap` (`MaNCC`),
  ADD CONSTRAINT `FK_PhieuNhap_NhanVien` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);

--
-- Các ràng buộc cho bảng `phieuphat`
--
ALTER TABLE `phieuphat`
  ADD CONSTRAINT `FK_PhieuPhat_ChiTietMuon` FOREIGN KEY (`MaCTM`) REFERENCES `chitietmuon` (`MaCTM`),
  ADD CONSTRAINT `FK_PhieuPhat_NhanVien` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
