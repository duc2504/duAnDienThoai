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
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />

    <script>
        function confirmLogout() {
            if (confirm("Bạn có chắc chắn muốn đăng xuất không?")) {
                window.location.href = "/login/hien-thi"; // Đường dẫn đến servlet xử lý logout
            }
        }
    </script>
    <style>

        body {
            width: 1500px;
            margin: 0 auto; /* Giúp căn giữa ngang */
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

        /*nav*/

        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.08);
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
            box-shadow: 0 4px 10px rgba(0, 123, 255, 0.15);
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
            color: white;
        }

        .navbar {
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        /*nav*/

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
                    src="/img/pngtree-smartphone-shop-sale-logo-design-png-image_5069958.jpg"
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
                    <a class="nav-link" href="/quy/hien-thi">
                        <i class="fas fa-home"></i> Trang Chủ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quy/hien-thi-full-san-pham">
                        <i class="fas fa-box-open"></i> Sản Phẩm
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/quy/lichSuMuaHang">
                        <i class="fas fa-info-circle"></i> Giới thiệu
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-envelope"></i> Liên hệ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login/hien-thi" onclick="confirmLogout()">
                        <i class="fas fa-sign-out-alt"></i> Đăng Xuất
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


            <%--      <div class="cart-buttons mt-5">--%>
            <%--        <a href="/quy/hienthi_giohang" class="btn btn-primary btn-lg">🛒 Xem Giỏ Hàng</a>--%>
            <%--        <a href="/quy/all_donhang" class="btn btn-dark btn-lg">📦 Duyệt Đơn Hàng</a>--%>
            <%--      </div>--%>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-3">
            <h5 class="mb-3 fw-bold">Về tôi</h5>
            <div class="sidebar text-center" style="height: 550px">
                <img
                        src="/img/Screenshot 2025-03-29 150910.png"
                        alt="Avatar"
                        class="avatar mb-3"
                        style="width: auto; height: 250px"
                />
                <h6 class="fw-bold">Giới thiệu bản thân</h6>
                <p class="text-muted mb-0">
                    Đỗ Văn Quý PH54081 <br/>
                    Sinh viên khóa 19.3 FPT Polytechnic Quản lý trang web bán giày
                    SHOES
                </p>
            </div>
        </div>


        <div class="col-md-9">
            <h5 class="mb-3 fw-bold">Tin công nghệ</h5>
            <div class="blog-container" style="height: 550px">
                <div class="row">
                    <div class="col-md-7 mb-3 blog-item">
                        <img
                                src="/img/Smartphone-Specifications-Explained-2.webp"
                                alt="Công nghệ điện thoại"
                        />
                        <h6 class="mt-3">Cuộc cách mạng smartphone</h6>
                        <p class="text-muted">
                            Điện thoại ngày nay không chỉ là công cụ liên lạc, mà còn là thiết bị giải trí,
                            học tập, làm việc và thể hiện cá tính công nghệ của bạn.
                        </p>
                    </div>

                    <div class="col-md-5">
                        <ul class="list-group blog-list">
                            <li class="list-group-item">
                                <img
                                        src="/img/the-best-camera-phone-2019.png"
                                        alt="Camera phone"
                                />
                                <div>
                                    <strong>
                                        Top 5 điện thoại có camera tốt nhất năm 2025
                                    </strong>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <img src="/img/R.jpg" alt="Pin điện thoại" />
                                <div>
                                    <strong>Mẹo tiết kiệm pin điện thoại hiệu quả</strong>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <img src="/img/tim-hieu-chip-snapdragon-750g-9-800x493.jpg" alt="Chip xử lý" />
                                <div>
                                    <strong>So sánh hiệu năng chip Snapdragon vs Apple A-series</strong>
                                </div>
                            </li>
                            <li class="list-group-item">
                                <img src="/img/nen-thay-pin-iphone-loai-nao-5-didongviet-1.jpg" alt="Sửa điện thoại" />
                                <div>
                                    <strong>Khi nào bạn nên thay pin điện thoại?</strong>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <button
                            class="btn btn-info text-white"
                            style="width: 100px; margin-left: 1.3%; margin-top: -10px"
                    >
                        Xem thêm
                    </button>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <h5 class="mb-3 fw-bold text-center">📱Sản phẩm nổi bật</h5>

            <div class="container product-page">
                <div class="row g-4">
                    <c:forEach var="phonevariant" items="${phonevariants}">
                        <div class="col-md-4">
                            <div class="card h-100 shadow-sm">
                                <!-- Hiển thị ảnh từ thư mục /img -->
                                <img src="/img/${phonevariant.phone.id}.jpg"
                                     onerror="this.onerror=null;this.src='/img/default-phone.jpg'"
                                     class="product-img"
                                     alt="${phonevariant.phone.name}">

                                <div class="card-body">
                                    <h5 class="card-title product-name">${phonevariant.phone.name}</h5>
                                    <p class="card-text">
                                        <span class="price"><fmt:formatNumber value="${phonevariant.price}" type="currency" currencySymbol="₫"/></span><br>
                                        <small>Màu: ${phonevariant.color} | Pin: ${phonevariant.batteryCapacity} mAh</small><br>
                                        <small>Năm: ${phonevariant.releaseYear}</small><br>
                                    </p>

                                    <div class="product-actions">
                                        <form action="/quy/add_giohang" method="post">
                                            <input type="hidden" name="variantId" value="${phonevariant.variantId}">
                                            <input value="${phonevariant.quantity}" readonly>

                                            <c:choose>
                                                <c:when test="${phonevariant.quantity < 1}">
                                                    <button disabled>🚫 Hết hàng</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="submit">🛒 Thêm</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                    </div>

                                    <div class="action-btns">
                                        <a href="/quy/view_update?variantId=${phonevariant.variantId}">✏️ Cập nhật</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>

<%--                <div class="cart-buttons mt-5">--%>
<%--                    <a href="/quy/hienthi_giohang" class="btn btn-primary btn-lg">🛒 Xem Giỏ Hàng</a>--%>
<%--                    <a href="/quy/all_donhang" class="btn btn-dark btn-lg">📦 Duyệt Đơn Hàng</a>--%>
<%--                </div>--%>
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
<a href="${pageContext.request.contextPath}/Message/hien-thi?toUserId=1">
    Xem hoặc gửi tin nhắn đến User 1
</a>

</body>
</html>


