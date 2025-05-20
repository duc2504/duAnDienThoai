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
    <script>
        function confirmLogout() {
            if (confirm("Bạn có chắc chắn muốn đăng xuất không?")) {
                window.location.href = "/login/hien-thi"; // Đường dẫn đến servlet xử lý logout
            }
        }
    </script>
    <style>



        .product-page {
            padding: 40px;
        }

        .card {
            border-radius: 12px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
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
            color: white;
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
            color: white;
        }

        .badge-inactive {
            background-color: #b0bec5;
            color: white;
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
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            color: #19213f;
            font-weight: bold;
            padding: 6px 15px;
            border-radius: 5px;
        }

        .navbar-nav {
            margin-left: 30px;
        }

        .navbar-nav .nav-item {
            margin: 0 15px;
            padding-right: 50px;

        }

        .navbar-nav .nav-link {
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 30px;
            transition: background-color 0.3s ease;
        }

        .navbar-nav .nav-link:hover {
            background-color: #007bff;
            color: white !important;
        }

        .navbar-nav .nav-link.active {
            background-color: #0056b3;
            font-weight: bold;
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
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
            color: white;
        }

        .blog-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
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
            color: white !important;
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
            <img
                    src="/img/logo-shop-giay-11-768x463.jpg"
                    alt="Logo"
                    style="height: 100px; width: auto; margin-right: 10px"
            />
        </a>

        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Menu trái -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-3">
                <li class="nav-item">
                    <a class="nav-link" href="/quy/hien-thi">Trang Chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sanpham.html">Sản Phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quy/lichSuMuaHang">Lịch sử mua hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quy/hienthi_giohang">🛒Giỏ hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Liên hệ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login/hien-thi" onclick="confirmLogout()"
                    >Đăng Xuất</a
                    >
                </li>
            </ul>

            <div class="d-flex justify-content-center gap-3 mt-3">
                <%
                    Users user = (Users) session.getAttribute("user");
                    if (user != null && user.getRole().getId() == 1) {
                %>
                <a href="/quy/hienthi_giohang" class="btn-custom">🛒 Xem Giỏ Hàng</a>
                <%
                } else if (user != null && user.getRole().getId() == 2) {
                %>
                <a href="/quy/all_donhang" class="btn-custom">📦 Duyệt Đơn Hàng</a>
                <%
                    }
                %>
            </div>



            <%--      <div class="cart-buttons mt-5">--%>
            <%--        <a href="/quy/hienthi_giohang" class="btn btn-primary btn-lg">🛒 Xem Giỏ Hàng</a>--%>
            <%--        <a href="/quy/all_donhang" class="btn btn-dark btn-lg">📦 Duyệt Đơn Hàng</a>--%>
            <%--      </div>--%>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <div class="row mt-4">
            <form action="/quy/loc" method="post" class="mb-4">
                <div class="row">
                    <div class="col-md-3">
                        <label for="price">Giá</label>
                        <input type="text" class="form-control" id="price" name="price" placeholder="Nhập giá" />
                    </div>
                    <div class="col-md-3">
                        <label for="releaseYear">Năm phát hành</label>
                        <input type="text" class="form-control" id="releaseYear" name="releaseYear" placeholder="Nhập năm phát hành" />
                    </div>
                    <div class="col-md-3">
                        <label for="batteryCapacity">Dung lượng pin</label>
                        <input type="text" class="form-control" id="batteryCapacity" name="batteryCapacity" placeholder="Nhập dung lượng pin" />
                    </div>
                    <div class="col-md-3">
                        <label for="trangThai">Trạng thái</label>
                        <select class="form-control" id="trangThai" name="trangThai">
                            <option value="">Chọn trạng thái</option>
                            <option value="1">Đang bán</option>
                            <option value="0">Hết hàng</option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mt-3">Lọc</button>
            </form>


            <div class="container product-page">
                <div class="row g-4">
                    <c:forEach var="phonevariant" items="${phonevariants}">
                        <div class="col-md-4">
                            <div class="card h-100 shadow-sm">
                                <!-- Hiển thị ảnh từ thư mục /img -->
                                <img src="/img/${phonevariant.phone.id}.jpg"
                                     onerror="this.onerror=null;this.src='/img/default-phone.jpg';"
                                     class="product-img" alt="${phonevariant.phone.name}">

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
                                                <%--                      <input type="number" name="soLuong" value="1" min="1" class="form-control form-control-sm form-qty me-2" required>--%>
                                            <button type="submit" class="btn btn-buy btn-sm">🛒 Thêm</button>
                                        </form>
                                    </div>


                                    <div class="action-btns mt-3">
                                        <a href="/quy/view_update?variantId=${phonevariant.variantId}" class="btn btn-outline-primary btn-sm">✏️ Cập nhật</a>
                                            <%--<a href="/quy/delete?variantId=${phonevariant.variantId}" class="btn btn-outline-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?')">🗑️ Xóa</a>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="cart-buttons mt-5">
                    <a href="/quy/hienthi_giohang" class="btn btn-primary btn-lg">🛒 Xem Giỏ Hàng</a>
                    <a href="/quy/all_donhang" class="btn btn-dark btn-lg">📦 Duyệt Đơn Hàng</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- FOOTER -->
<footer class="mt-4 bg-dark text-white pt-4 pb-2">
    <div class="container">
        <div class="row">
            <!-- Cột 1: Giới thiệu -->
            <div class="col-md-3">
                <h5>Về chúng tôi</h5>
                <p>
                    Chuyên cung cấp các sản phẩm công nghệ chất lượng cao, uy tín và
                    dịch vụ hỗ trợ tận tâm.
                </p>
            </div>

            <!-- Cột 2: Hỗ trợ -->
            <div class="col-md-3">
                <h5>Hỗ trợ khách hàng</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">Câu hỏi thường gặp</a></li>
                    <li><a href="#" class="text-white">Hướng dẫn mua hàng</a></li>
                    <li><a href="#" class="text-white">Chính sách bảo hành</a></li>
                    <li><a href="#" class="text-white">Liên hệ hỗ trợ</a></li>
                </ul>
            </div>

            <!-- Cột 3: Chính sách -->
            <div class="col-md-3">
                <h5>Chính sách</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">Chính sách bảo mật</a></li>
                    <li><a href="#" class="text-white">Chính sách đổi trả</a></li>
                    <li><a href="#" class="text-white">Điều khoản dịch vụ</a></li>
                </ul>
            </div>

            <!-- Cột 4: Mạng xã hội -->
            <div class="col-md-3">
                <h5>Theo dõi chúng tôi</h5>
                <a href="#" class="text-white me-2"
                ><i class="fab fa-facebook"></i
                ></a>
                <a href="#" class="text-white me-2"
                ><i class="fab fa-instagram"></i
                ></a>
                <a href="#" class="text-white me-2"
                ><i class="fab fa-youtube"></i
                ></a>
            </div>
        </div>

        <!-- Bản quyền -->
        <div class="text-center mt-3">
            <p class="mb-0">
                &copy; 2025 Bản quyền thuộc về FPT Polytechnic. Mọi quyền được bảo
                lưu.
            </p>
        </div>
    </div>
</footer>



</body>
</html>





