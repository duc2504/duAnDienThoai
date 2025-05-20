<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<h2>Đăng Nhập</h2>--%>
<%--&lt;%&ndash; Hiển thị lỗi nếu có &ndash;%&gt;--%>
<%--<% if (request.getAttribute("error") != null) { %>--%>
<%--<p class="error-message"><%= request.getAttribute("error") %></p>--%>
<%--<% } %>--%>

<%--<form action="/login/dang-nhap" method="post" class="login-container">--%>
<%--    <label class="form-label">Tài khoản:</label>--%>
<%--    <input type="text" name="username" required class="form-control"> <br><br>--%>

<%--    <label class="form-label">Mật khẩu:</label>--%>
<%--    <input type="password" name="password" required class="form-control"> <br><br>--%>

<%--    <button type="submit" class="btn btn-primary w-100">Đăng Nhập</button>--%>
<%--</form>--%>

<%--<a href="/login/view/dang-ky">Đăng ký</a>--%>
<%--<a href="/khachServlet/hien-thi">Khách</a>--%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Nhập - Energy Pilates</title>
    <!-- Bootstrap 5.0.2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap 5.0.2 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* Nền */
        body {
            background-image: url("/img/black-friday-concept-with-space-middle.jpg");
            background-size: cover; /* Đảm bảo ảnh phủ toàn bộ trang */
            background-position: center center; /* Căn giữa ảnh */
            background-attachment: fixed; /* Giữ ảnh cố định khi cuộn trang */
            background-repeat: no-repeat; /* Không lặp lại ảnh */
        }

        /* Khung đăng nhập */
        .login-container {
            max-width: 1000px;
            margin: 80px auto;
            display: flex;
            background: rgba(255, 255, 255, 0.8); /* Mờ nền */
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }

        /* Ảnh nền trong khung đăng nhập */
        .login-image {
            width: 50%;
            background: url("/img/pngtree-smartphone-shop-sale-logo-design-png-image_5069958.jpg") no-repeat center;
            opacity: 0.3; /* Điều chỉnh độ trong suốt */
            background-size: cover;
        }

        /* Form đăng nhập */
        .login-form {
            width: 50%;
            padding: 40px;
            background: rgba(255, 255, 255, 0.35);
        }

        /* Tiêu đề của form */
        .login-form h4 {
            font-size: 28px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }

        /* Form input */
        .form-control {
            height: 50px;
            font-size: 18px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        /* Nút đăng nhập */
        .btn-primary {
            font-size: 18px;
            padding: 12px;
            background-color: #007bff;
            border: none;
            width: 100%;
            border-radius: 5px;
        }

        /* Thêm hiệu ứng hover cho nút */
        .btn-primary:hover {
            background-color: #0056b3;
            transition: background-color 0.3s ease;
        }

        /* Thêm link Quên mật khẩu và Đăng ký */
        .text-center a {
            font-size: 16px;
            color: #007bff;
            text-decoration: none;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        /* Footer */
        footer {
            background-color: #343a40;
            color: white;
            padding: 40px 0;
        }

        footer a {
            color: #d1d1d1;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        footer a:hover {
            color: #fff;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="login-image"></div>
    <div class="login-form">
        <h4>Đăng Nhập</h4>
        <form action="/login/dang-nhap" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Tài khoản</label>
                <input type="text" class="form-control" name="username" id="username" required />
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" name="password" id="password" required />
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Đăng Nhập</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="#">Quên mật khẩu?</a>
        </div>
        <div class="text-center mt-3">
            <a href="/login/view/dang-ky">Đăng ký</a>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>Về chúng tôi</h5>
                <p>Chuyên cung cấp các sản phẩm công nghệ chất lượng cao, uy tín và dịch vụ hỗ trợ tận tâm.</p>
            </div>
            <div class="col-md-3">
                <h5>Hỗ trợ khách hàng</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Câu hỏi thường gặp</a></li>
                    <li><a href="#">Hướng dẫn mua hàng</a></li>
                    <li><a href="#">Chính sách bảo hành</a></li>
                    <li><a href="#">Liên hệ hỗ trợ</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Chính sách</h5>
                <ul class="list-unstyled">
                    <li><a href="#">Chính sách bảo mật</a></li>
                    <li><a href="#">Chính sách đổi trả</a></li>
                    <li><a href="#">Điều khoản dịch vụ</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Theo dõi chúng tôi</h5>
                <a href="#" class="text-white me-2"><i class="fab fa-facebook"></i></a>
                <a href="#" class="text-white me-2"><i class="fab fa-instagram"></i></a>
                <a href="#" class="text-white me-2"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
        <div class="text-center mt-3">
            <p>&copy; 2025 Bản quyền thuộc về FPT Polytechnic. Mọi quyền được bảo lưu.</p>
        </div>
    </div>
</footer>

</body>
</html>
