<%@ page import="Model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <script>
        function confirmLogout() {
            if (confirm("Bạn có chắc chắn muốn đăng xuất không?")) {
                window.location.href = "/login/hien-thi";
            }
        }
    </script>
    <style>
        body {
            width: 1500px;
            margin: 0 auto;
            background: #f4f7fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .product-page {
            padding: 40px;
        }

        .card {
            border-radius: 12px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgb(0 0 0 / 0.1);
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }

        .card-text small {
            color: #777;
        }

        .btn-buy {
            background-color: #28a745;
            color: #fff;
            font-weight: 600;
            border-radius: 50px;
            padding: 8px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-buy:hover {
            background-color: #218838;
        }

        .status-badge {
            font-size: 0.85rem;
            padding: 6px 14px;
            border-radius: 20px;
            font-weight: 600;
        }

        .badge-active {
            background-color: #4caf50;
            color: #fff;
        }

        .badge-inactive {
            background-color: #b0bec5;
            color: #fff;
        }

        .cart-buttons {
            text-align: center;
            margin-top: 40px;
        }

        .cart-buttons a {
            margin: 0 10px;
            padding: 12px 25px;
            font-weight: 600;
        }

        .product-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 12px;
        }

        .form-qty {
            max-width: 80px;
        }

        .product-name {
            color: #6a1b9a;
        }

        .price {
            color: #d32f2f;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .action-btns a {
            margin-right: 10px;
        }

        .product-img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 12px 12px 0 0;
        }

        .navbar {
            background-color: rgb(255 255 255 / 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 16px rgb(0 0 0 / 0.08);
            padding: 12px 24px;
            border-bottom: 1px solid #eaeaea;
        }

        .navbar-nav .nav-link {
            font-size: 16px;
            font-weight: 500;
            color: #333;
            padding: 10px 18px;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
        }

        .navbar-nav .nav-link:hover,
        .navbar-nav .nav-link.active {
            background-color: #007bff;
            color: #fff !important;
            box-shadow: 0 4px 10px rgb(0 123 255 / 0.15);
        }

        .navbar-toggler {
            border: none;
            outline: none;
            box-shadow: none;
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23007bff' viewBox='0 0 30 30'%3e%3cpath stroke='%23007bff' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");

        }

        .navbar-brand:hover img {
            transform: scale(1.05);
        }

        .d-flex .btn-custom {
            background: #fff;
            border: 2px solid #007bff;
            color: #007bff;
            border-radius: 25px;
            padding: 8px 16px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .d-flex .btn-custom:hover {
            background-color: #007bff;
            color: #fff;
        }

        .navbar {
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        footer {
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 25px 0;
            margin-top: 40px;
        }

        footer a {
            color: #d1d1d1;
            text-decoration: none;
            display: block;
            padding: 8px 0;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: #fff;
            text-decoration: underline;
        }

        .sidebar {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgb(0 0 0 / 0.05);
            padding: 20px;
            margin-bottom: 20px;
        }

        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }

        .category-list button {
            width: 100%;
            text-align: left;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            padding: 12px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .category-list button:hover {
            background-color: #007bff;
            color: #fff;
        }

        .blog-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgb(0 0 0 / 0.05);
            padding: 20px;
        }

        .blog-item img {
            width: 100%;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .blog-item img:hover {
            transform: scale(1.05);
        }

        .blog-list .list-group-item {
            display: flex;
            align-items: center;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 10px;
            background-color: #f8f9fa;
            transition: background-color 0.3s ease;
        }

        .blog-list .list-group-item img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 15px;
        }

        .blog-list .list-group-item:hover {
            background-color: #f0f8ff;
        }

        .btn-custom {
            display: inline-block;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: 500;
            color: #333;
            background: linear-gradient(135deg, #f9f9f9, #e9e9e9);
            border: 2px solid #333;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-custom::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background-color: #333;
            transition: all 0.3s ease;
            z-index: 0;
        }

        .btn-custom:hover::before {
            left: 0;
        }

        .btn-custom:hover {
            color: #fff !important;
        }

        .btn-custom span {
            position: relative;
            z-index: 1;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="trangchu.html">
            <img src="/img/pngtree-smartphone-shop-sale-logo-design-png-image_5069958.jpg" alt="Logo" style="height: 100px; width: auto; margin-right: 10px" />
        </a>

        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-3">
                <li class="nav-item">
                    <a class="nav-link" href="/quy/hien-thi">
                        <i class="fas fa-home me-1"></i> Trang Chủ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quy/hien-thi-full-san-pham">
                        <i class="fas fa-box-open me-1"></i> Sản Phẩm
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quy/lichSuMuaHang">
                        <i class="fas fa-info-circle me-1"></i> Giới thiệu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-envelope me-1"></i> Liên hệ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login/hien-thi" onclick="confirmLogout()">
                        <i class="fas fa-sign-out-alt me-1"></i> Đăng Xuất
                    </a>
                </li>
            </ul>


            <div class="d-flex justify-content-center gap-3 mt-3">
                <%
                    Users user = (Users) session.getAttribute("user");

                    if (user != null && user.getRole().getId() == 1) {
                %>
                <a href="/quy/hienthi_giohang" class="btn-custom">🛒 Xem Giỏ Hàng</a>
                <a href="/quy/lichSuMuaHang" class="btn-custom">Lịch sử mua hàng</a>
                <%
                } else if (user != null && user.getRole().getId() == 2) {
                %>
                <a href="/quy/all_donhang" class="btn-custom">📦 Duyệt Đơn Hàng</a>
                <a href="/quy/danhSachHoaDon" class="btn-custom">Danh sách hóa đơn</a>
                <%
                    }
                %>
            </div>

        </div>
    </div>
</nav>

<div class="container mt-4">
    <h1>Danh Sách Sản Phẩm</h1>

    <div class="product-page">
        <div class="row g-4">
            <!-- Cột tìm kiếm phía trái -->
            <div class="col-md-3">
                <form action="/quy/tim-kiem-san-pham" method="get">
                    <!-- Tìm theo tên -->
                    <div class="mb-3">
                        <label for="searchTerm" class="form-label">Tên sản phẩm</label>
                        <input id="searchTerm" name="searchTerm" type="text" class="form-control" placeholder="Nhập tên sản phẩm">
                    </div>

                    <!-- Tìm theo năm sản xuất -->
                    <div class="mb-3">
                        <label for="searchYear" class="form-label">Năm sản xuất</label>
                        <select id="searchYear" name="searchYear" class="form-select">
                            <option value="">Tất cả</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                        </select>
                    </div>

                    <!-- Tìm theo trạng thái -->
                    <div class="mb-3">
                        <label for="searchStatus" class="form-label">Trạng thái</label>
                        <select id="searchStatus" name="searchStatus" class="form-select">
                            <option value="">Tất cả</option>
                            <option value="1">Còn hàng</option>
                            <option value="0">Hết hàng</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </form>
            </div>


            <!-- Cột sản phẩm phía phải -->
            <div class="col-md-9">


                <div class="row g-4">
                    <c:forEach var="phonevariant" items="${phonevariants}">
                        <div class="col-md-4">
                            <div class="card h-100 shadow-sm">
                                <img src="/img/${phonevariant.phone.id}.jpg" onerror="this.onerror=null;this.src='/img/default-phone.jpg'" class="product-img" alt="${phonevariant.phone.name}">
                                <div class="card-body">
                                    <h5 class="card-title product-name">${phonevariant.phone.name}</h5>
                                    <p class="card-text">
                                        <span class="price"><fmt:formatNumber value="${phonevariant.price}" type="currency" currencySymbol="₫"/></span><br>
                                        <small>Màu: ${phonevariant.color} | Pin: ${phonevariant.batteryCapacity} mAh</small><br>
                                        <small>Năm: ${phonevariant.releaseYear}</small><br>
                                        <span class="status-badge ${phonevariant.trangThai == 1 ? 'badge-active' : 'badge-inactive'}">
                                                ${phonevariant.trangThai == 1 ? 'Còn hàng' : 'Hết hàng'}
                                        </span>
                                    </p>

                                    <div class="product-actions">
                                        <form action="/quy/add_giohang" method="post" class="d-flex">
                                            <input type="hidden" name="variantId" value="${phonevariant.variantId}">
                                            <input value="${phonevariant.quantity}" class="form-control form-control-sm form-qty me-2" readonly>
                                            <button type="submit" class="btn btn-buy btn-sm">🛒 Thêm</button>
                                        </form>
                                    </div>

                                    <div class="action-btns mt-3">
                                        <a href="/quy/view_update?variantId=${phonevariant.variantId}" class="btn btn-outline-primary btn-sm">✏️ Cập nhật</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


            </div><!-- col-md-9 -->
        </div><!-- row -->
    </div><!-- product-page -->

</div>

<footer class="bg-dark text-center text-light pt-4">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>Về chúng tôi</h5>
                <p>Chuyên cung cấp các sản phẩm công nghệ chất lượng cao, uy tín.</p>
            </div>

            <div class="col-md-3">
                <h5>Hỗ trợ khách hàng</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Câu hỏi thường gặp</a></li>
                    <li><a href="#" class="text-light">Hướng dẫn mua hàng</a></li>
                    <li><a href="#" class="text-light">Chính sách bảo hành</a></li>
                    <li><a href="#" class="text-light">Liên hệ</a></li>
                </ul>
            </div>

            <div class="col-md-3">
                <h5>Chính sách</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Chính sách bảo mật</a></li>
                    <li><a href="#" class="text-light">Chính sách đổi trả</a></li>
                    <li><a href="#" class="text-light">Điều khoản dịch vụ</a></li>
                </ul>
            </div>

            <div class="col-md-3">
                <h5>Theo dõi chúng tôi</h5>
                <a href="#" class="text-light me-2"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="text-light me-2"><i class="fab fa-instagram"></i></a>
                <a href="#" class="text-light me-2"><i class="fab fa-youtube"></i></a>
            </div>
        </div>

        <div class="text-center mt-3">
            <p class="mb-0">
                &copy; 2025 Bản quyền thuộc về F...
            </p>
        </div>
    </div>
</footer>

</body>
</html>
