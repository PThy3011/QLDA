CREATE DATABASE QuanLyVanChuyenn
GO
USE QuanLyVanChuyenn
GO


CREATE TABLE thanhPho (
    maThanhPho INT PRIMARY KEY,
    tenThanhPho NVARCHAR(100),
    ngayTao DATE,
    ngayCapNhat DATE
);


CREATE TABLE loaiXe (
    maLoaiXe INT PRIMARY KEY,
    tenLoaiXe NVARCHAR(100),
    trongTaiToiDa FLOAT,
    theTichToiDa FLOAT,
    moTa NVARCHAR(255),
    ngayTao DATE,
    ngayCapNhat DATE
);


CREATE TABLE tuyenDuong (
    maTuyenDuong INT PRIMARY KEY,
    khoangCachKm INT,
    maThanhPhoDi INT,
    maThanhPhoDen INT,
    ngayTao DATE,
    ngayCapNhat DATE,
    FOREIGN KEY (maThanhPhoDi) REFERENCES thanhPho(maThanhPho),
    FOREIGN KEY (maThanhPhoDen) REFERENCES thanhPho(maThanhPho)
);


CREATE TABLE nhanVien (
    maNhanVien INT PRIMARY KEY,
    tenNhanVien NVARCHAR(100),
    sdt VARCHAR(15),
    email VARCHAR(100),
    diaChi NVARCHAR(255),
    ngayTao DATE,
    tenDangNhap VARCHAR(50),
    trangThai NVARCHAR(50)
);


CREATE TABLE TaiXe (
    maTaiXe INT PRIMARY KEY,
    hoTen NVARCHAR(100),
    sdt VARCHAR(15),
    email VARCHAR(100),
    soBangLai VARCHAR(20),
    diaChi NVARCHAR(255),
    trangThai NVARCHAR(50),
    ngayTao DATE,
    ngayCapNhat DATE
);


CREATE TABLE xe (
    maXe INT PRIMARY KEY,
    bienSo VARCHAR(20),
    hangXe NVARCHAR(50),
    namSanXuat INT,
    trangThai NVARCHAR(50),
    maLoaiXe INT,
    ngayTao DATE,
    ngayCapNhat DATE,
    FOREIGN KEY (maLoaiXe) REFERENCES loaiXe(maLoaiXe)
);


CREATE TABLE lichSuTrangThaiXe (
    maLSXe INT PRIMARY KEY,
    maXe INT,
    trangThai NVARCHAR(50),
    ngayCapNhat DATE,
    ghiChu NVARCHAR(255),
    FOREIGN KEY (maXe) REFERENCES xe(maXe)
);


CREATE TABLE trangThaiHopDong (
    maTrangThai INT PRIMARY KEY,
    tenTrangThai NVARCHAR(50),
    moTa NVARCHAR(255),
    ngayTao DATE,
    ngayCapNhat DATE
);


CREATE TABLE khachHang (
    maKhachHang INT PRIMARY KEY,
    tenKhachHang NVARCHAR(100),
    sdt VARCHAR(15),
    email VARCHAR(100),
    diaChi NVARCHAR(255),
    ngayTao DATE,
    ngayCapNhat DATE
);


CREATE TABLE hopDong (
    maHopDong INT PRIMARY KEY,
    maNhanVien INT,
    maKhachHang INT, 
    maTuyenDuong INT,
    thoiGianBatDau DATE,
    thoiGianKetThuc DATE,
    tongChiPhi DECIMAL(18, 2),
    ghiChu NVARCHAR(255),
    ngayTao DATE,
    maTrangThai INT,
    maXe INT, 
    FOREIGN KEY (maNhanVien) REFERENCES nhanVien(maNhanVien),
    FOREIGN KEY (maKhachHang) REFERENCES khachHang(maKhachHang),
    FOREIGN KEY (maTuyenDuong) REFERENCES tuyenDuong(maTuyenDuong),
    FOREIGN KEY (maTrangThai) REFERENCES trangThaiHopDong(maTrangThai),
    FOREIGN KEY (maXe) REFERENCES xe(maXe)
);


CREATE TABLE hoaDon (
    maHoaDon INT PRIMARY KEY,
    maHopDong INT,
    ngayThanhToan DATE,
    tongTien DECIMAL(18, 2),
    trangThai NVARCHAR(50),
    ngayTao DATE,
    ngayCapNhat DATE,
    FOREIGN KEY (maHopDong) REFERENCES hopDong(maHopDong)
);

CREATE TABLE phanCongTaiXe (
    maPhanCong INT PRIMARY KEY,
    maTaiXe INT,
    maXe INT,
    ngayBatDau DATE,
    ngayKetThuc DATE,
    trangThai NVARCHAR(50),
    FOREIGN KEY (maTaiXe) REFERENCES TaiXe(maTaiXe),
    FOREIGN KEY (maXe) REFERENCES xe(maXe)
);


CREATE TABLE baoDuongXe (
    maBaoDuong INT PRIMARY KEY,
    maXe INT,
    ngayBaoDuong DATE,
    noiDungBaoDuong NVARCHAR(255),
    chiPhi DECIMAL(18, 2),
    FOREIGN KEY (maXe) REFERENCES xe(maXe)
);


CREATE TABLE chiTietHangHoa (
    maHangHoa INT PRIMARY KEY,
    maHopDong INT,
    tenHangHoa NVARCHAR(100),
    khoiLuong FLOAT,
    theTich FLOAT,
    moTa NVARCHAR(255),
    FOREIGN KEY (maHopDong) REFERENCES hopDong(maHopDong)
);


CREATE TABLE lichTrinhVanChuyen (
    maLichTrinh INT PRIMARY KEY,
    maHopDong INT,
    maThanhPhoHienTai INT,
    thoiGianDen DATE,
    trangThai NVARCHAR(50), 
    ghiChu NVARCHAR(255),
    FOREIGN KEY (maHopDong) REFERENCES hopDong(maHopDong),
    FOREIGN KEY (maThanhPhoHienTai) REFERENCES thanhPho(maThanhPho)
);

INSERT INTO thanhPho (maThanhPho, tenThanhPho, ngayTao, ngayCapNhat) VALUES  
(1, N'Hà Nội', '2025-12-19', '2025-12-19'),
(2, N'TP.HCM', '2025-12-19', '2025-12-19'),
(3, N'Đà Nẵng', '2025-12-19', '2025-12-19'),
(4, N'Cần Thơ', '2025-12-19', '2025-12-19'),
(5, N'Hải Phòng', '2025-12-19', '2025-12-19'),
(6, N'Bình Dương', '2025-12-19', '2025-12-19'),
(7, N'Đồng Nai', '2025-12-19', '2025-12-19'),
(8, N'Nha Trang', '2025-12-19', '2025-12-19'),
(9, N'Vũng Tàu', '2025-12-19', '2025-12-19'),
(10, N'Buôn Ma Thuột', '2025-12-19', '2025-12-19'),
(11, N'Pleiku', '2025-12-19', '2025-12-19'),
(12, N'Quy Nhơn', '2025-12-19', '2025-12-19'),
(13, N'Phan Thiết', '2025-12-19', '2025-12-19'),
(14, N'Huế', '2025-12-19', '2025-12-19'),
(15, N'Quảng Ngãi', '2025-12-19', '2025-12-19'),
(16, N'Hạ Long', '2025-12-19', '2025-12-19'),
(17, N'Vinh', '2025-12-19', '2025-12-19'),
(18, N'Tuy Hòa', '2025-12-19', '2025-12-19'),
(19, N'Long Xuyên', '2025-12-19', '2025-12-19'),
(20, N'Rạch Giá', '2025-12-19', '2025-12-19');

INSERT INTO loaiXe (maLoaiXe, tenLoaiXe, trongTaiToiDa, theTichToiDa, moTa, ngayTao, ngayCapNhat) VALUES  
(1, N'Xe tải nhỏ', 1.5, 0, N'Chở hàng nhẹ', '2025-12-19', '2025-12-19'),
(2, N'Xe tải 2T', 2, 0, N'Giao nội thành', '2025-12-19', '2025-12-19'),
(3, N'Xe tải 5T', 5, 0, N'Liên tỉnh', '2025-12-19', '2025-12-19'),
(4, N'Xe tải 8T', 8, 0, N'Hàng cồng kềnh', '2025-12-19', '2025-12-19'),
(5, N'Xe container', 20, 0, N'Đường dài', '2025-12-19', '2025-12-19'),
(6, N'Xe đông lạnh', 5, 0, N'Thực phẩm', '2025-12-19', '2025-12-19'),
(7, N'Xe ben', 10, 0, N'Vật liệu', '2025-12-19', '2025-12-19'),
(8, N'Xe bồn', 15, 0, N'Chất lỏng', '2025-12-19', '2025-12-19'),
(9, N'Xe bán tải', 1, 0, N'Hàng nhanh', '2025-12-19', '2025-12-19'),
(10, N'Xe cứu hộ', 3, 0, N'Hỗ trợ xe hỏng', '2025-12-19', '2025-12-19'),
(11, N'Xe thùng kín', 3, 0, N'Điện tử', '2025-12-19', '2025-12-19'),
(12, N'Xe thùng mở', 4, 0, N'Hàng dễ xếp', '2025-12-19', '2025-12-19'),
(13, N'Xe chuyên dụng', 6, 0, N'Đặc biệt', '2025-12-19', '2025-12-19'),
(14, N'Xe hybrid', 2, 0, N'Tiết kiệm nhiên liệu', '2025-12-19', '2025-12-19'),
(15, N'Xe điện', 1, 0, N'Giao đô thị', '2025-12-19', '2025-12-19'),
(16, N'Xe siêu trường', 40, 0, N'Hàng dự án siêu nặng', '2025-12-19', '2025-12-19'),
(17, N'Xe bồn chở khí', 12, 0, N'Chở gas hóa lỏng', '2025-12-19', '2025-12-19'),
(18, N'Xe đầu kéo', 30, 0, N'Kéo rơ moóc rời', '2025-12-19', '2025-12-19'),
(19, N'Xe tải chở kính', 5, 0, N'Hàng dễ vỡ', '2025-12-19', '2025-12-19'),
(20, N'Xe cẩu thùng', 8, 0, N'Tự bốc dỡ hàng', '2025-12-19', '2025-12-19');

INSERT INTO tuyenDuong (maTuyenDuong, khoangCachKm, maThanhPhoDi, maThanhPhoDen, ngayTao, ngayCapNhat) VALUES  
(1, 170, 1, 2, '2025-12-19', '2025-12-19'),
(2, 960, 2, 3, '2025-12-19', '2025-12-19'),
(3, 900, 2, 4, '2025-12-19', '2025-12-19'),
(4, 100, 1, 5, '2025-12-19', '2025-12-19'),
(5, 30, 6, 2, '2025-12-19', '2025-12-19'),
(6, 40, 7, 2, '2025-12-19', '2025-12-19'),
(7, 500, 3, 8, '2025-12-19', '2025-12-19'),
(8, 300, 8, 9, '2025-12-19', '2025-12-19'),
(9, 450, 9, 2, '2025-12-19', '2025-12-19'),
(10, 350, 2, 10, '2025-12-19', '2025-12-19'),
(11, 280, 10, 11, '2025-12-19', '2025-12-19'),
(12, 200, 11, 12, '2025-12-19', '2025-12-19'),
(13, 180, 12, 13, '2025-12-19', '2025-12-19'),
(14, 120, 13, 14, '2025-12-19', '2025-12-19'),
(15, 220, 14, 15, '2025-12-19', '2025-12-19'),
(16, 600, 2, 12, '2025-12-19', '2025-12-19'),
(17, 300, 1, 17, '2025-12-19', '2025-12-19'),
(18, 50, 4, 19, '2025-12-19', '2025-12-19'),
(19, 250, 15, 3, '2025-12-19', '2025-12-19'),
(20, 400, 14, 1, '2025-12-19', '2025-12-19');

INSERT INTO nhanVien (maNhanVien, tenNhanVien, sdt, email, diaChi, ngayTao, tenDangNhap, trangThai) VALUES  
(1, N'Admin 1', '0931111111', 'admin1@cty.com', N'TP.HCM', '2025-12-19', 'admin1', N'Hoạt động'),
(2, N'Admin 2', '0932222222', 'admin2@cty.com', N'Hà Nội', '2025-12-19', 'admin2', N'Hoạt động'),
(3, N'NV Điều phối 1', '0933333333', 'dp1@cty.com', N'Đà Nẵng', '2025-12-19', 'dp1', N'Hoạt động'),
(4, N'NV Điều phối 2', '0934444444', 'dp2@cty.com', N'Cần Thơ', '2025-12-19', 'dp2', N'Hoạt động'),
(5, N'NV Kế toán', '0935555555', 'kt@cty.com', N'TP.HCM', '2025-12-19', 'ketoan', N'Hoạt động'),
(6, N'NV Kho 1', '0936666666', 'kho1@cty.com', N'Bình Dương', '2025-12-19', 'kho1', N'Hoạt động'),
(7, N'NV Kho 2', '0937777777', 'kho2@cty.com', N'Đồng Nai', '2025-12-19', 'kho2', N'Nghỉ phép'),
(8, N'NV CSKH', '0938888888', 'cskh@cty.com', N'TP.HCM', '2025-12-19', 'cskh', N'Hoạt động'),
(9, N'NV IT', '0939999999', 'it@cty.com', N'Hà Nội', '2025-12-19', 'it', N'Hoạt động'),
(10, N'NV Giám sát', '0941111111', 'gs@cty.com', N'TP.HCM', '2025-12-19', 'giamsat', N'Hoạt động'),
(11, N'NV 11', '0942222222', 'nv11@cty.com', N'TP.HCM', '2025-12-19', 'nv11', N'Hoạt động'),
(12, N'NV 12', '0943333333', 'nv12@cty.com', N'TP.HCM', '2025-12-19', 'nv12', N'Hoạt động'),
(13, N'NV 13', '0944444444', 'nv13@cty.com', N'Hà Nội', '2025-12-19', 'nv13', N'Hoạt động'),
(14, N'NV 14', '0945555555', 'nv14@cty.com', N'Hà Nội', '2025-12-19', 'nv14', N'Hoạt động'),
(15, N'NV 15', '0946666666', 'nv15@cty.com', N'Đà Nẵng', '2025-12-19', 'nv15', N'Hoạt động'),
(16, N'NV Tiếp nhận 1', '0947777777', 'tn1@cty.com', N'Cần Thơ', '2025-12-19', 'tn1', N'Hoạt động'),
(17, N'NV Tiếp nhận 2', '0948888888', 'tn2@cty.com', N'Hải Phòng', '2025-12-19', 'tn2', N'Hoạt động'),
(18, N'NV Kiểm toán', '0949999999', 'kiemtoan@cty.com', N'TP.HCM', '2025-12-19', 'kiemtoan', N'Hoạt động'),
(19, N'Quản lý Đội xe', '0951111111', 'qlxe@cty.com', N'Bình Dương', '2025-12-19', 'qlxe', N'Nghỉ phép'),
(20, N'Giám đốc Chi nhánh', '0952222222', 'giamdoc@cty.com', N'Hà Nội', '2025-12-19', 'giamdoc', N'Hoạt động');

INSERT INTO TaiXe (maTaiXe, hoTen, sdt, email, soBangLai, diaChi, trangThai, ngayTao, ngayCapNhat) VALUES  
(1, N'Nguyễn Văn A', '0901111111', 'a@gmail.com', 'B2-123', N'Gần đây', N'Đang làm', '2025-12-19', '2025-12-19'),
(2, N'Trần Văn B', '0902222222', 'b@gmail.com', 'C-234', N'Gần đây', N'Đang làm', '2025-12-19', '2025-12-19'),
(3, N'Lê Văn C', '0903333333', 'c@gmail.com', 'D-345', N'Gần đây', N'Nghỉ phép', '2025-12-19', '2025-12-19'),
(4, N'Phạm Văn D', '0904444444', 'd@gmail.com', 'C-456', N'Gần đây', N'Đang làm', '2025-12-19', '2025-12-19'),
(5, N'Hoàng Văn E', '0905555555', 'e@gmail.com', 'B2-567', N'Gần đây', N'Bị đình chỉ', '2025-12-19', '2025-12-19'),
(6, N'Võ Văn F', '0906666666', 'f@gmail.com', 'D-678', N'TP.HCM', N'Đang làm', '2025-12-19', '2025-12-19'),
(7, N'Đặng Văn G', '0907777777', 'g@gmail.com', 'C-789', N'Hà Nội', N'Đang làm', '2025-12-19', '2025-12-19'),
(8, N'Bùi Văn H', '0908888888', 'h@gmail.com', 'B2-890', N'Đà Nẵng', N'Nghỉ phép', '2025-12-19', '2025-12-19'),
(9, N'Ngô Văn I', '0909999999', 'i@gmail.com', 'C-901', N'Cần Thơ', N'Đang làm', '2025-12-19', '2025-12-19'),
(10, N'Đỗ Văn K', '0911111111', 'k@gmail.com', 'D-012', N'Hải Phòng', N'Đang làm', '2025-12-19', '2025-12-19'),
(11, N'Phan Văn L', '0912222222', 'l@gmail.com', 'C-111', N'Bình Dương', N'Đang làm', '2025-12-19', '2025-12-19'),
(12, N'Chu Văn M', '0913333333', 'm@gmail.com', 'B2-222', N'Đồng Nai', N'Đang làm', '2025-12-19', '2025-12-19'),
(13, N'Tạ Văn N', '0914444444', 'n@gmail.com', 'C-333', N'Nha Trang', N'Nghỉ phép', '2025-12-19', '2025-12-19'),
(14, N'Mai Văn O', '0915555555', 'o@gmail.com', 'D-444', N'Vũng Tàu', N'Đang làm', '2025-12-19', '2025-12-19'),
(15, N'Cao Văn P', '0916666666', 'p@gmail.com', 'C-555', N'Huế', N'Đang làm', '2025-12-19', '2025-12-19'),
(16, N'Lý Văn Q', '0917777777', 'q@gmail.com', 'D-666', N'Hà Nội', N'Đang làm', '2025-12-19', '2025-12-19'),
(17, N'Dương Văn R', '0918888888', 'r@gmail.com', 'B2-777', N'TP.HCM', N'Nghỉ phép', '2025-12-19', '2025-12-19'),
(18, N'Hồ Văn S', '0919999999', 's@gmail.com', 'C-888', N'Đà Nẵng', N'Đang làm', '2025-12-19', '2025-12-19'),
(19, N'Trịnh Văn T', '0921111111', 't@gmail.com', 'E-999', N'Vinh', N'Đang làm', '2025-12-19', '2025-12-19'),
(20, N'Vương Văn U', '0922222222', 'u@gmail.com', 'C-101', N'Quy Nhơn', N'Đang làm', '2025-12-19', '2025-12-19');

INSERT INTO xe (maXe, bienSo, hangXe, namSanXuat, trangThai, maLoaiXe, ngayTao, ngayCapNhat) VALUES  
(1, '51A-12345', N'Isuzu', 2020, N'Hoạt động', 3, '2025-12-19', '2025-12-19'),
(2, '51A-22345', N'Hino', 2019, N'Bảo trì', 4, '2025-12-19', '2025-12-19'),
(3, '51A-32345', N'Hyundai', 2021, N'Hoạt động', 2, '2025-12-19', '2025-12-19'),
(4, '51A-42345', N'Thaco', 2018, N'Hoạt động', 1, '2025-12-19', '2025-12-19'),
(5, '51A-52345', N'Isuzu', 2022, N'Hoạt động', 5, '2025-12-19', '2025-12-19'),
(6, '51A-62345', N'Hino', 2017, N'Hỏng máy', 3, '2025-12-19', '2025-12-19'),
(7, '51A-72345', N'Hyundai', 2020, N'Hoạt động', 6, '2025-12-19', '2025-12-19'),
(8, '51A-82345', N'Isuzu', 2021, N'Hoạt động', 7, '2025-12-19', '2025-12-19'),
(9, '51A-92345', N'Hino', 2016, N'Ngừng sử dụng', 8, '2025-12-19', '2025-12-19'),
(10, '51A-10234', N'Thaco', 2023, N'Hoạt động', 9, '2025-12-19', '2025-12-19'),
(11, '51A-11234', N'Hyundai', 2022, N'Hoạt động', 10, '2025-12-19', '2025-12-19'),
(12, '51A-12234', N'Isuzu', 2021, N'Hoạt động', 11, '2025-12-19', '2025-12-19'),
(13, '51A-13234', N'Hino', 2019, N'Bảo trì', 12, '2025-12-19', '2025-12-19'),
(14, '51A-14234', N'Thaco', 2020, N'Hoạt động', 13, '2025-12-19', '2025-12-19'),
(15, '51A-15234', N'Isuzu', 2022, N'Hoạt động', 14, '2025-12-19', '2025-12-19'),
(16, '29A-16234', N'Volvo', 2023, N'Hoạt động', 16, '2025-12-19', '2025-12-19'),
(17, '29A-17234', N'Hino', 2021, N'Hoạt động', 17, '2025-12-19', '2025-12-19'),
(18, '43A-18234', N'Hyundai', 2018, N'Hỏng điện', 18, '2025-12-19', '2025-12-19'),
(19, '65A-19234', N'Thaco', 2022, N'Hoạt động', 19, '2025-12-19', '2025-12-19'),
(20, '15A-20234', N'Isuzu', 2021, N'Bảo trì', 20, '2025-12-19', '2025-12-19');

INSERT INTO lichSuTrangThaiXe (maLSXe, maXe, trangThai, ngayCapNhat, ghiChu) VALUES  
(1, 1, N'Hoạt động', '2024-01-01', N'Bình thường'),
(2, 2, N'Bảo trì', '2024-02-01', N'Thay dầu'),
(3, 3, N'Hoạt động', '2024-03-01', N'Hoàn tất bảo trì'),
(4, 4, N'Hỏng máy', '2024-03-15', N'Xe chết máy giữa đường'),
(5, 5, N'Hoạt động', '2024-04-01', N'Đã sửa xong'),
(6, 6, N'Bảo trì', '2024-04-15', N'Kiểm tra định kỳ'),
(7, 7, N'Hoạt động', '2024-05-01', N'Sẵn sàng chạy'),
(8, 8, N'Hỏng lốp', '2024-05-20', N'Nổ lốp cao tốc'),
(9, 9, N'Hoạt động', '2024-06-01', N'Đã thay lốp'),
(10, 10, N'Ngừng sử dụng', '2024-06-15', N'Xe quá cũ'),
(11, 11, N'Hoạt động', '2024-07-01', N'Quay lại sử dụng'),
(12, 12, N'Bảo trì', '2024-07-20', N'Bảo dưỡng lớn'),
(13, 13, N'Hoạt động', '2024-08-01', N'Hoàn thành bảo trì'),
(14, 14, N'Hỏng điện', '2024-08-15', N'Lỗi hệ thống điện'),
(15, 15, N'Hoạt động', '2024-09-01', N'Đã sửa chữa xong'),
(16, 16, N'Hoạt động', '2024-10-01', N'Xe mới nhập đội'),
(17, 17, N'Hoạt động', '2024-10-15', N'Chạy thử nghiệm'),
(18, 18, N'Hỏng máy', '2024-11-01', N'Gặp sự cố động cơ'),
(19, 19, N'Hoạt động', '2024-11-20', N'Giao hàng ổn định'),
(20, 20, N'Bảo trì', '2024-12-05', N'Kiểm tra cuối năm');

INSERT INTO trangThaiHopDong (maTrangThai, tenTrangThai, moTa, ngayTao, ngayCapNhat) VALUES  
(1, N'Đang hiệu lực', N'Hợp đồng đang sử dụng', '2025-12-19', '2025-12-19'),
(2, N'Hết hạn', N'Hợp đồng hết thời gian', '2025-12-19', '2025-12-19'),
(3, N'Tạm dừng', N'Tạm ngừng vận chuyển', '2025-12-19', '2025-12-19'),
(4, N'Hủy', N'Hợp đồng bị hủy', '2025-12-19', '2025-12-19'),
(5, N'Chờ ký', N'Chưa ký chính thức', '2025-12-19', '2025-12-19'),
(6, N'Gia hạn', N'Gia hạn hợp đồng', '2025-12-19', '2025-12-19'),
(7, N'Đang thanh lý', N'Chuẩn bị kết thúc', '2025-12-19', '2025-12-19'),
(8, N'Vi phạm', N'Có vi phạm điều khoản', '2025-12-19', '2025-12-19'),
(9, N'Hoàn thành', N'Đã hoàn tất', '2025-12-19', '2025-12-19'),
(10, N'Đình chỉ', N'Tạm đình chỉ', '2025-12-19', '2025-12-19'),
(11, N'Thử nghiệm', N'Hợp đồng thử', '2025-12-19', '2025-12-19'),
(12, N'Đang xem xét', N'Đang duyệt', '2025-12-19', '2025-12-19'),
(13, N'Chờ gia hạn', N'Sắp hết hạn', '2025-12-19', '2025-12-19'),
(14, N'Gia hạn lần 2', N'Gia hạn thêm', '2025-12-19', '2025-12-19'),
(15, N'Hết hiệu lực', N'Không còn giá trị', '2025-12-19', '2025-12-19');

INSERT INTO hopDong (maHopDong, maNhanVien, maTuyenDuong, thoiGianBatDau, thoiGianKetThuc, tongChiPhi, ghiChu, ngayTao, maTrangThai, maXe) VALUES  
(1, 1, 1, '2024-01-01', '2024-12-31', 50000000, N'Hợp đồng vận chuyển Bắc Nam', '2025-12-19', 1, 1),
(2, 2, 2, '2024-02-01', '2024-08-01', 30000000, N'Hợp đồng ngắn hạn', '2025-12-19', 2, 2),
(3, 3, 3, '2024-03-01', '2025-03-01', 70000000, N'Đang gia hạn', '2025-12-19', 6, 3),
(4, 4, 4, '2024-04-01', '2024-10-01', 25000000, N'Tạm dừng do xe hỏng', '2025-12-19', 3, 4),
(5, 5, 5, '2024-05-01', '2025-05-01', 90000000, N'Hợp đồng lớn', '2025-12-19', 1, 5),
(6, 6, 6, '2024-06-01', '2025-06-01', 45000000, N'Vận chuyển đông lạnh', '2025-12-19', 1, 6),
(7, 7, 7, '2024-07-01', '2025-01-01', 60000000, N'Hết hạn sắp tới', '2025-12-19', 13, 7),
(8, 8, 8, '2024-08-01', '2024-12-01', 20000000, N'Chờ ký chính thức', '2025-12-19', 5, 8),
(9, 9, 9, '2024-09-01', '2025-09-01', 80000000, N'Đang hiệu lực', '2025-12-19', 1, 9),
(10, 10, 10, '2024-10-01', '2025-10-01', 100000000, N'Hợp đồng chiến lược', '2025-12-19', 1, 10),
(11, 11, 11, '2024-01-15', '2024-07-15', 15000000, N'Hợp đồng chạy thử', '2025-12-19', 11, 11),
(12, 12, 12, '2024-02-15', '2025-02-15', 40000000, N'Thanh lý cuối năm', '2025-12-19', 7, 12),
(13, 13, 13, '2024-03-15', '2024-09-15', 22000000, N'Phát sinh tranh chấp', '2025-12-19', 8, 13),
(14, 14, 14, '2024-04-15', '2025-04-15', 52000000, N'Kế hoạch bị hủy', '2025-12-19', 4, 14),
(15, 15, 15, '2024-05-15', '2024-11-15', 18000000, N'Hoàn thành tốt', '2025-12-19', 9, 15),
(16, 1, 16, '2024-06-15', '2025-06-15', 75000000, N'Bị đình chỉ thi công', '2025-12-19', 10, 16),
(17, 2, 17, '2024-07-15', '2025-01-15', 35000000, N'Đang nộp hồ sơ duyệt', '2025-12-19', 12, 17),
(18, 3, 18, '2024-08-15', '2025-08-15', 65000000, N'Hợp đồng tái ký đợt 2', '2025-12-19', 14, 18),
(19, 4, 19, '2024-09-15', '2025-03-15', 28000000, N'Đã quá hạn lâu ngày', '2025-12-19', 15, 19),
(20, 5, 20, '2024-10-15', '2025-10-15', 120000000, N'Khách hàng thân thiết', '2025-12-19', 1, 20);

INSERT INTO hoaDon (maHoaDon, maHopDong, ngayThanhToan, tongTien, trangThai, ngayTao, ngayCapNhat) VALUES  
(1, 1, '2024-02-01', 50000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(2, 2, NULL, 30000000, N'Chưa thanh toán', '2025-12-19', '2025-12-19'),
(3, 3, '2024-04-01', 70000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(4, 4, NULL, 25000000, N'Trễ hạn', '2025-12-19', '2025-12-19'),
(5, 5, '2024-06-01', 90000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(6, 6, '2024-07-01', 45000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(7, 7, NULL, 60000000, N'Chưa thanh toán', '2025-12-19', '2025-12-19'),
(8, 8, NULL, 20000000, N'Chờ xử lý', '2025-12-19', '2025-12-19'),
(9, 9, '2024-10-01', 80000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(10, 10, '2024-11-01', 100000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(11, 11, NULL, 15000000, N'Chưa thanh toán', '2025-12-19', '2025-12-19'),
(12, 12, '2024-12-01', 40000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(13, 13, NULL, 22000000, N'Trễ hạn', '2025-12-19', '2025-12-19'),
(14, 14, '2025-01-01', 52000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(15, 15, '2024-11-15', 18000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(16, 16, '2024-12-20', 75000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(17, 17, NULL, 35000000, N'Chưa thanh toán', '2025-12-19', '2025-12-19'),
(18, 18, NULL, 65000000, N'Chờ xử lý', '2025-12-19', '2025-12-19'),
(19, 19, '2025-02-10', 28000000, N'Đã thanh toán', '2025-12-19', '2025-12-19'),
(20, 20, NULL, 120000000, N'Chưa thanh toán', '2025-12-19', '2025-12-19');


SELECT * FROM thanhPho;
SELECT * FROM loaiXe;
SELECT * FROM tuyenDuong;
SELECT * FROM nhanVien;
SELECT * FROM TaiXe;
SELECT * FROM xe;
SELECT * FROM lichSuTrangThaiXe;
SELECT * FROM trangThaiHopDong;
SELECT * FROM khachHang;
SELECT * FROM hopDong;
SELECT * FROM hoaDon;
SELECT * FROM phanCongTaiXe;
SELECT * FROM baoDuongXe;
SELECT * FROM chiTietHangHoa;
SELECT * FROM lichTrinhVanChuyen;


USE QuanLyVanChuyenn;
GO



-- 1. View Trạng thái xe (Xem xe và trạng thái hiện tại)
CREATE VIEW v_TrangThaiXe AS
SELECT 
    x.maXe,
    x.bienSo,
    x.hangXe,
    lx.tenLoaiXe,
    x.trangThai AS trangThaiHienTai,
    x.ngayCapNhat
FROM xe x
LEFT JOIN loaiXe lx ON x.maLoaiXe = lx.maLoaiXe;
GO

-- 2. View Hóa đơn chưa thanh toán
CREATE VIEW v_HoaDonChuaThanhToan AS
SELECT 
    hd.maHoaDon,
    hd.maHopDong,
    kh.tenKhachHang,
    hd.tongTien,
    hd.trangThai,
    hd.ngayTao
FROM hoaDon hd
LEFT JOIN hopDong hdong ON hd.maHopDong = hdong.maHopDong
LEFT JOIN khachHang kh ON hdong.maKhachHang = kh.maKhachHang
WHERE hd.trangThai = N'Chưa thanh toán' OR hd.trangThai = N'Trễ hạn';
GO

-- 3. View Tổng hợp (Doanh thu theo tuyến đường)
CREATE VIEW v_TongHopDoanhThuTuyenDuong AS
SELECT 
    td.maTuyenDuong,
    tp1.tenThanhPho AS thanhPhoDi,
    tp2.tenThanhPho AS thanhPhoDen,
    COUNT(hd.maHopDong) AS soLuongHopDong,
    SUM(hd.tongChiPhi) AS tongDoanhThu
FROM tuyenDuong td
LEFT JOIN thanhPho tp1 ON td.maThanhPhoDi = tp1.maThanhPho
LEFT JOIN thanhPho tp2 ON td.maThanhPhoDen = tp2.maThanhPho
LEFT JOIN hopDong hd ON td.maTuyenDuong = hd.maTuyenDuong
GROUP BY td.maTuyenDuong, tp1.tenThanhPho, tp2.tenThanhPho;
GO



-- 1. Procedure Cập nhật trạng thái xe và tự động lưu lịch sử
CREATE PROCEDURE sp_CapNhatTrangThaiXe
    @maXe INT,
    @trangThaiMoi NVARCHAR(50),
    @ghiChu NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE xe 
    SET trangThai = @trangThaiMoi, ngayCapNhat = GETDATE() 
    WHERE maXe = @maXe;

    DECLARE @maLS INT;
    SELECT @maLS = ISNULL(MAX(maLSXe), 0) + 1 FROM lichSuTrangThaiXe;

    INSERT INTO lichSuTrangThaiXe (maLSXe, maXe, trangThai, ngayCapNhat, ghiChu)
    VALUES (@maLS, @maXe, @trangThaiMoi, GETDATE(), @ghiChu);
END;
GO

-- 2. Procedure Tính tổng doanh thu của một khách hàng
CREATE PROCEDURE sp_TinhDoanhThuKhachHang
    @maKhachHang INT,
    @tongDoanhThu DECIMAL(18,2) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT @tongDoanhThu = SUM(tongTien)
    FROM hoaDon hd
    JOIN hopDong h ON hd.maHopDong = h.maHopDong
    WHERE h.maKhachHang = @maKhachHang AND hd.trangThai = N'Đã thanh toán';

    SET @tongDoanhThu = ISNULL(@tongDoanhThu, 0);
END;
GO



-- 1. Trigger Tự động tạo hóa đơn khi một hợp đồng mới được tạo
CREATE TRIGGER trg_TuDongTaoHoaDon
ON hopDong
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @maHD INT;
    SELECT @maHD = ISNULL(MAX(maHoaDon), 0) FROM hoaDon;

    INSERT INTO hoaDon (maHoaDon, maHopDong, ngayThanhToan, tongTien, trangThai, ngayTao, ngayCapNhat)
    SELECT 
        @maHD + ROW_NUMBER() OVER(ORDER BY i.maHopDong),
        i.maHopDong,
        NULL,
        i.tongChiPhi,
        N'Chưa thanh toán',
        GETDATE(),
        GETDATE()
    FROM inserted i;
END;
GO

-- 2. Trigger Kiểm tra tải trọng xe trước khi gán vào hợp đồng
CREATE TRIGGER trg_KiemTraTaiTrongXe
ON hopDong
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        JOIN xe x ON i.maXe = x.maXe
        JOIN loaiXe lx ON x.maLoaiXe = lx.maLoaiXe
        JOIN chiTietHangHoa cthh ON i.maHopDong = cthh.maHopDong
        GROUP BY i.maHopDong, lx.trongTaiToiDa
        HAVING SUM(cthh.khoiLuong) > lx.trongTaiToiDa
    )
    BEGIN
        RAISERROR (N'Lỗi: Tổng khối lượng hàng hóa vượt quá trọng tải cho phép của xe!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO