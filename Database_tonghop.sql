create  database duAn_DienThoai
go

use duAn_DienThoai
go


create table trang_thai_du_an(
	 trang_thai NVARCHAR(100) ,
    name_trang_thai NVARCHAR(100) 
);
INSERT INTO trang_thai_du_an( trang_thai,name_trang_thai) VALUES 
(N'Phone',  N''),
('0',  N'Hết hàng'),
('1',  N'Còn hàng'),


('PhoneVariants',  N''),
('0',  N'Hết hàng'),
('1',  N'Còn hàng'),


('Giỏ hàng',  N''),
('0',  N'Không có sản phẩm trong giỏ'),
('1',  N'Có sản phẩm trong giỏ'),


('Giỏ hàng chi tiết',  N''),
('0',  N'Chưa đặt hàng'),
('1',  N'Đã đặt hàng'),

('Đơn hàng',  N''),
('0',  N'Chờ xử lý'),
('1',  N'Đang giao'),
('2',  N'Hoàn thành')





CREATE TABLE roles (
    id INT PRIMARY KEY IDENTITY(1,1),
    name_roles VARCHAR(100) NOT NULL
);

INSERT INTO roles (name_roles) VALUES 
('user'),
('admin');


CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    id_roles INT ,
    FOREIGN KEY (id_roles) REFERENCES roles(id)
);

CREATE TABLE Chips (
    ChipID INT PRIMARY KEY IDENTITY(1,1),  -- Mã chip
    ChipName NVARCHAR(100)                  -- Tên chip
);

-- Bảng lưu trữ các hệ điều hành
CREATE TABLE OperatingSystems (
    OSID INT PRIMARY KEY IDENTITY(1,1),    -- Mã hệ điều hành
    OSName NVARCHAR(50)                     -- Tên hệ điều hành
);

-- Bảng lưu trữ các thương hiệu
CREATE TABLE Brands (
    BrandID INT PRIMARY KEY IDENTITY(1,1),  -- Mã thương hiệu
    BrandName NVARCHAR(50)                  -- Tên thương hiệu
);

-- Bảng lưu trữ các model điện thoại
CREATE TABLE Models (
    ModelID INT PRIMARY KEY IDENTITY(1,1),  -- Mã model
    ModelName NVARCHAR(100)                  -- Tên model
);

-- Bảng Phones đã được thay đổi để tham chiếu đến các bảng mới và thêm cột Số lượng, Màu sắc, và Giá
CREATE TABLE Phones (
    PhoneID INT PRIMARY KEY IDENTITY(1,1),   -- Mã điện thoại
	NamePhone nvarchar(100),
    BrandID INT,                             -- Tham chiếu đến bảng Brands
    ModelID INT,                             -- Tham chiếu đến bảng Models
    OSID INT,                                -- Tham chiếu đến bảng OperatingSystems
    ChipID INT,									-- Tham chiếu đến bảng Chips           
	 Quantity INT, 
	 TrangThai int ,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
    FOREIGN KEY (ModelID) REFERENCES Models(ModelID),
    FOREIGN KEY (OSID) REFERENCES OperatingSystems(OSID),
    FOREIGN KEY (ChipID) REFERENCES Chips(ChipID)
);

-- Bảng PhoneVariants giữ nguyên
CREATE TABLE PhoneVariants (
    VariantID INT PRIMARY KEY IDENTITY(1,1), -- Mã biến thể
    PhoneID INT,                              -- Mã điện thoại (tham chiếu đến bảng Phones)
    Quantity INT,                            -- Số lượng sản phẩm
    Color NVARCHAR(50),                      -- Màu sắc sản phẩm
    Price DECIMAL(10, 3) ,					-- Giá
	ReleaseYear INT,                         -- Năm phát hành
    BatteryCapacity INT,                     -- Dung lượng pin
	TrangThai int ,
    FOREIGN KEY (PhoneID) REFERENCES Phones(PhoneID) ON DELETE CASCADE
);











-- Bảng IMEI giữ nguyên
CREATE TABLE IMEI (
    IMEI_ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),  -- Mã IMEI
    VariantID INT,                             		-- Mã biến thể (tham chiếu đến bảng PhoneVariants)
    FOREIGN KEY (VariantID) REFERENCES PhoneVariants(VariantID) ON DELETE CASCADE
);







-- Bảng lưu trữ các chip
CREATE TABLE GioHang (
    GioHangID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT UNIQUE,                            -- 1-1 v?i user
    NgayTao DATETIME DEFAULT GETDATE(),
    TrangThai INT ,                      -- 0: Chua d?t, 1: Ðã d?t
    FOREIGN KEY (UserID) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE GioHangChiTiet (
    GioHangCT_ID INT PRIMARY KEY IDENTITY(1,1),
    GioHangID INT NOT NULL,              -- FK đến GioHang
    VariantID INT NOT NULL,                -- FK đến Phones
    SoLuong INT ,
	TrangThai INT , 
    FOREIGN KEY (GioHangID) REFERENCES GioHang(GioHangID) ON DELETE CASCADE,
    FOREIGN KEY (VariantID) REFERENCES PhoneVariants(VariantID) ON DELETE CASCADE
);


CREATE TABLE DonHang (
    DonHangID INT  PRIMARY KEY IDENTITY(1,1), 
    DiaChiNhanHang VARCHAR(255) ,
    SoDienThoai VARCHAR(20),
    TenNguoiNhanHang VARCHAR(100) ,
    PhuongThucThanhToan VARCHAR(50) ,
    NgayDat DATE NOT NULL,
    TongTien DECIMAL(18, 3) ,
    TrangThai INT ,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES users(id) -- Giả sử có bảng Users và cột UserID trong bảng đó
);



CREATE TABLE DonHangChiTiet (
    DonHangChiTiet_id INT  PRIMARY KEY IDENTITY(1,1),
    SoLuong INT ,
    Gia DECIMAL(18, 3) ,
    ThanhTien DECIMAL(18, 3) ,
    VariantID INT,
    DonHangID INT,
    FOREIGN KEY (VariantID) REFERENCES PhoneVariants(VariantID), -- Giả sử có bảng PhoneVariants và cột VariantID trong bảng đó
    FOREIGN KEY (DonHangID) REFERENCES DonHang(DonHangID) -- Liên kết với bảng DonHang
);

CREATE TABLE HoaDon (
    HoaDonID INT PRIMARY KEY IDENTITY(1,1),
    DonHangID INT UNIQUE,
    UserID INT, -- Người lập hóa đơn
	DiaChiNhanHang VARCHAR(255) ,
    SoDienThoai VARCHAR(20),
    TenNguoiNhanHang VARCHAR(100) ,
    PhuongThucThanhToan VARCHAR(50) ,
    NgayDat DATE ,
	NgayHoanThanhDonHang DATE  DEFAULT GETDATE(),
    TongTien DECIMAL(18, 3) ,
    TrangThai INT ,
    FOREIGN KEY (DonHangID) REFERENCES DonHang(DonHangID),
    FOREIGN KEY (UserID) REFERENCES users(id) -- Giả sử có bảng Users và cột UserID trong bảng đó
);


CREATE TABLE HoaDonChiTiet (
    HoaDonChiTietID INT PRIMARY KEY IDENTITY(1,1),
    HoaDonID INT,
    VariantID INT,
    SoLuong INT,
    DonGia DECIMAL(18, 3),
    ThanhTien DECIMAL(18, 3),
    FOREIGN KEY (HoaDonID) REFERENCES HoaDon(HoaDonID),
    FOREIGN KEY (VariantID) REFERENCES PhoneVariants(VariantID)
);




-- Thêm dữ liệu vào bảng Chips
INSERT INTO Chips (ChipName) VALUES 
(N'Snapdragon 8 Gen 1'),
(N'Snapdragon 888'),
(N'Exynos 2200'),
(N'Apple A16 Bionic'),
(N'Apple A15 Bionic'),
(N'MediaTek Dimensity 9000'),
(N'Snapdragon 870'),
(N'Exynos 2100'),
(N'MediaTek Helio G95'),
(N'Kirin 9000');


-- Thêm dữ liệu vào bảng OperatingSystems
INSERT INTO OperatingSystems (OSName) VALUES 
(N'Android 13'),
(N'Android 12'),
(N'Android 11'),
(N'Android 10'),
(N'Android 9 Pie'),
(N'iOS 16'),
(N'iOS 15'),
(N'iOS 14'),
(N'iOS 13'),
(N'EMUI 12');


-- Thêm dữ liệu vào bảng Brands
INSERT INTO Brands (BrandName) VALUES 
(N'Samsung'),
(N'Apple'),
(N'Xiaomi'),
(N'Oppo'),
(N'Vivo'),
(N'Realme'),
(N'Nokia'),
(N'Asus'),
(N'Sony'),
(N'Huawei');


-- Thêm dữ liệu vào bảng Models
INSERT INTO Models (ModelName) VALUES 
(N'Galaxy S23'),
(N'iPhone 14 Pro'),
(N'Mi 11 Ultra'),
(N'Find X5 Pro'),
(N'Vivo X90'),
(N'Realme GT Neo 3'),
(N'Nokia G21'),
(N'ROG Phone 6'),
(N'Xperia 1 IV'),
(N'P50 Pro');


-- Thêm dữ liệu vào bảng Phones (cập nhật với các cột mới: Quantity, Color, Price)
INSERT INTO Phones (NamePhone, BrandID, ModelID, OSID, ChipID, Quantity, TrangThai) VALUES
(N'Samsung Galaxy S23', 1, 1, 1, 1, 100, 1),
(N'Apple iPhone 14 Pro', 2, 2, 6, 4, 150, 1),
(N'Xiaomi Mi 11 Ultra', 3, 3, 2, 2, 120, 1),
(N'Oppo Find X5 Pro', 4, 4, 2, 3, 110, 1),
(N'Vivo X90', 5, 5, 2, 2, 90, 1),
(N'Realme GT Neo 3', 6, 6, 2, 6, 95, 1),
(N'Nokia G21', 7, 7, 4, 9, 80, 1),
(N'Asus ROG Phone 6', 8, 8, 2, 7, 70, 1),
(N'Sony Xperia 1 IV', 9, 9, 3, 8, 60, 1),
(N'Huawei P50 Pro', 10, 10, 10, 10, 100, 1);


-- Thêm dữ liệu vào bảng PhoneVariants
INSERT INTO PhoneVariants (PhoneID, Quantity, Color, Price, ReleaseYear, BatteryCapacity, TrangThai) VALUES
(1, 20, N'Den', 999.990, 2023, 3900, 1),
(2, 25, N'Tim', 1099.990, 2023, 3200, 1),
(3, 15, N'Trang', 799.500, 2022, 5000, 1),
(4, 10, N'Den', 899.000, 2022, 4800, 1),
(5, 18, N'Xanh', 699.990, 2023, 4700, 1),
(6, 22, N'Tim', 599.990, 2022, 4500, 1),
(7, 12, N'Xanh', 199.990, 2022, 5050, 1),
(8, 16, N'Den', 749.990, 2023, 6000, 1),
(9, 14, N'Trang', 849.990, 2023, 4300, 1),
(10, 20, N'Vang', 899.990, 2022, 4100, 1);


-- Thêm dữ liệu phong phú vào bảng IMEI
INSERT INTO IMEI (VariantID)
VALUES 
    (1),  -- Galaxy S21 (128GB, Phantom Gray)
    (1),  -- Galaxy S21 (128GB, Phantom Gray)
    (1),  -- Galaxy S21 (128GB, Phantom Gray)
    (2),  -- Galaxy S21 (256GB, Phantom White)
    (2),  -- Galaxy S21 (256GB, Phantom White)
    (2),  -- Galaxy S21 (256GB, Phantom White)
    (3),  -- iPhone 12 (64GB, Black)
    (3),  -- iPhone 12 (64GB, Black)
    (3),  -- iPhone 12 (64GB, Black)
    (4),  -- iPhone 12 (128GB, White)
    (4),  -- iPhone 12 (128GB, White)
    (4),  -- iPhone 12 (128GB, White)
    (5),  -- Mate 40 Pro (256GB, Black)
    (5),  -- Mate 40 Pro (256GB, Black)
    (5),  -- Mate 40 Pro (256GB, Black)
    (6),  -- Mate 40 Pro (512GB, Silver)
    (6),  -- Mate 40 Pro (512GB, Silver)
    (6);  -- Mate 40 Pro (512GB, Silver)




	DROP TRIGGER IF EXISTS trg_AfterInsertVariant;
DROP TRIGGER IF EXISTS trg_AfterUpdateVariant;
DROP TRIGGER IF EXISTS trg_AfterDeleteVariant;
GO


CREATE TRIGGER trg_AfterInsertVariant
ON PhoneVariants
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật số lượng phone sau khi thêm biến thể
    UPDATE Phones
    SET Quantity = sub.SumQuantity
    FROM Phones
    INNER JOIN (
        SELECT PhoneID, SUM(Quantity) AS SumQuantity
        FROM PhoneVariants
        GROUP BY PhoneID
    ) AS sub ON Phones.PhoneID = sub.PhoneID;
END
GO



CREATE TRIGGER trg_AfterUpdateVariant
ON PhoneVariants
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật số lượng phone sau khi biến thể được thay đổi
    UPDATE Phones
    SET Quantity = sub.SumQuantity
    FROM Phones
    INNER JOIN (
        SELECT PhoneID, SUM(Quantity) AS SumQuantity
        FROM PhoneVariants
        GROUP BY PhoneID
    ) AS sub ON Phones.PhoneID = sub.PhoneID;

    -- Cập nhật số lượng phone nếu phoneId bị thay đổi
    IF EXISTS (SELECT 1 FROM deleted WHERE PhoneID IS NOT NULL)
    BEGIN
        UPDATE Phones
        SET Quantity = ISNULL(sub.SumQuantity, 0)
        FROM Phones
        LEFT JOIN (
            SELECT PhoneID, SUM(Quantity) AS SumQuantity
            FROM PhoneVariants
            GROUP BY PhoneID
        ) AS sub ON Phones.PhoneID = sub.PhoneID
        WHERE Phones.PhoneID IN (SELECT PhoneID FROM deleted);
    END
END
GO



CREATE TRIGGER trg_AfterDeleteVariant
ON PhoneVariants
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật số lượng phone sau khi biến thể bị xóa
    UPDATE Phones
    SET Quantity = ISNULL(sub.SumQuantity, 0)
    FROM Phones
    LEFT JOIN (
        SELECT PhoneID, SUM(Quantity) AS SumQuantity
        FROM PhoneVariants
        GROUP BY PhoneID
    ) AS sub ON Phones.PhoneID = sub.PhoneID
    WHERE Phones.PhoneID IN (SELECT PhoneID FROM deleted);
END
GO
CREATE TABLE Messages (
    Message_ID INT PRIMARY KEY IDENTITY(1,1),
    FromUser_ID INT NOT NULL,   -- Người gửi
    ToUser_ID INT NOT NULL,     -- Người nhận
    Content NVARCHAR(1000) NOT NULL,
    SentAt DATETIME DEFAULT GETDATE(), 
    FOREIGN KEY (FromUser_ID) REFERENCES users(id),
    FOREIGN KEY (ToUser_ID) REFERENCES users(id)
);
