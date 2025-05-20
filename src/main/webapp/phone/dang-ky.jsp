<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Đăng Ký - Energy Pilates</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
      background-image: url("/img/black-friday-concept-with-space-middle.jpg");
      background-size: cover;
      background-position: center center;
      background-attachment: fixed;
      background-repeat: no-repeat;
    }

    .register-container {
      max-width: 1000px;
      margin: 80px auto;
      display: flex;
      background: rgba(255, 255, 255, 0.85);
      border-radius: 15px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
      overflow: hidden;
    }

    .register-image {
      width: 50%;
      background: url("/img/pngtree-smartphone-shop-sale-logo-design-png-image_5069958.jpg") no-repeat center;
      background-size: cover;
      opacity: 0.3;
    }

    .register-form {
      width: 50%;
      padding: 40px;
      background: rgba(255, 255, 255, 0.35);
    }

    .register-form h4 {
      font-size: 28px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 30px;
    }

    .form-control {
      height: 50px;
      font-size: 18px;
      margin-bottom: 20px;
      border-radius: 5px;
    }

    .btn-primary {
      font-size: 18px;
      padding: 12px;
      background-color: #007bff;
      border: none;
      width: 100%;
      border-radius: 5px;
    }

    .btn-primary:hover {
      background-color: #0056b3;
      transition: background-color 0.3s ease;
    }

    .text-center a {
      font-size: 16px;
      color: #007bff;
      text-decoration: none;
    }

    .text-center a:hover {
      text-decoration: underline;
    }

    .error-message {
      color: red;
      text-align: center;
      font-size: 16px;
      margin-top: 10px;
    }
  </style>
</head>
<body>
<div class="register-container">
  <div class="register-image"></div>
  <div class="register-form">
    <h4>Đăng Ký Tài Khoản</h4>
    <form action="/login/dang-ky" method="post">
      <div class="mb-3">
        <label for="username" class="form-label">Tài khoản</label>
        <input type="text" class="form-control" name="username" id="username" required />
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Mật khẩu</label>
        <input type="password" class="form-control" name="password" id="password" required />
      </div>
      <div class="d-grid">
        <button type="submit" class="btn btn-primary">Đăng Ký</button>
      </div>
    </form>
    <div class="error-message">
      <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </div>
    <div class="text-center mt-3">
      <a href="/login/hien-thi">Đã có tài khoản? Đăng nhập</a>
    </div>
  </div>
</div>
</body>
</html>
