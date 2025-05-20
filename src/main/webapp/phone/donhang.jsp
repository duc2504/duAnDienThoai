<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Giỏ Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .cart-container {
            max-width: 900px;
            margin: 40px auto;
        }

        .table th {
            background-color: #0d6efd;
            color: white;
        }

        .form-label {
            margin-top: 10px;
            font-weight: 500;
        }

        .form-control {
            border-radius: 8px;
        }

        .btn-submit {
            background-color: #0d6efd;
            color: white;
            border-radius: 8px;
            padding: 10px 20px;
        }

        .btn-submit:hover {
            background-color: #0b5ed7;
        }

        .total-price {
            font-size: 1.3rem;
            font-weight: bold;
            margin-top: 20px;
        }

        .card {
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            background-color: white;
        }
    </style>
</head>
<body>

<div class="container cart-container">
    <h2 class="text-center mb-4">🛒 Đơn hàng của bạn</h2>

    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <c:set var="totalPrice" value="0" />
    <c:if test="${not empty gioHang}">
        <div class="card mb-4">
            <table class="table table-bordered text-center">
                <thead>
                <tr>
                    <th>Tên Sản Phẩm</th>
                    <th>Số Lượng</th>
                    <th>Giá</th>
                    <th>Thành Tiền</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="chiTiet" items="${chiTietGioHang}">
                    <tr>
                        <td>${chiTiet.phoneVariants.phone.name}</td>
                        <td>${chiTiet.soLuong}</td>
                        <td>${chiTiet.phoneVariants.price} ₫</td>
                        <td>${chiTiet.soLuong * chiTiet.phoneVariants.price} ₫</td>
                    </tr>
                    <c:set var="totalPrice" value="${totalPrice + (chiTiet.soLuong * chiTiet.phoneVariants.price)}" />
                </c:forEach>
                </tbody>
            </table>

            <div class="total-price text-end">
                Tổng tiền cần thanh toán: <span class="text-danger">${totalPrice} ₫</span>
            </div>
        </div>
    </c:if>

    <form action="/quy/add_donhang" method="post" class="card">
        <div class="mb-3">
            <label class="form-label">Địa chỉ nhận hàng:</label>
            <input type="text" name="diaChiNhanHang" class="form-control" maxlength="100" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Số điện thoại:</label>
            <input type="text" name="soDienThoai" class="form-control" maxlength="10" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Tên người nhận hàng:</label>
            <input type="text" name="tenNguoiNhanHang" class="form-control" maxlength="30" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phương thức thanh toán:</label>
            <input type="text" name="phuongThucThanhToan" class="form-control" maxlength="30" required>
        </div>

        <div class="mb-4">
            <label class="form-label">Tổng tiền:</label>
            <input type="number" name="tongTien" class="form-control" value="${totalPrice}" readonly>
        </div>

        <div class="text-end">
            <button type="submit" class="btn btn-submit">Xác nhận đặt hàng</button>
        </div>
    </form>

    <div class="text-center mt-4">
        <a href="/quy/hien-thi" class="btn btn-outline-secondary">⬅️ Quay lại Trang chủ</a>
    </div>
</div>

</body>
</html>
