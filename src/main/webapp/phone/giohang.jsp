<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Giỏ Hàng</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .cart-container {
      max-width: 1000px;
      margin: 40px auto;
    }

    .table th {
      background-color: #0d6efd;
      color: white;
    }

    .btn-sm {
      padding: 5px 10px;
      font-size: 0.875rem;
    }

    .total-price {
      font-size: 1.25rem;
      font-weight: bold;
      margin-top: 20px;
    }

    .cart-actions {
      display: flex;
      justify-content: space-between;
      margin-top: 30px;
    }

    .card {
      padding: 25px;
      border-radius: 15px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      background-color: white;
    }

    h2 {
      margin-bottom: 30px;
      text-align: center;
    }
  </style>
</head>
<body>

<div class="container cart-container">
  <h2>🛒 Giỏ Hàng của Bạn</h2>

  <c:if test="${not empty message}">
    <div class="alert alert-info">${message}</div>
  </c:if>

  <c:set var="totalPrice" value="0" />
  <c:if test="${not empty gioHang}">
    <div class="card">
      <table class="table table-bordered text-center align-middle">
        <thead>
        <tr>
          <th>Tên Sản Phẩm</th>
          <th>Số Lượng</th>
          <th>Giá</th>
          <th>Thành Tiền</th>
          <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="chiTiet" items="${chiTietGioHang}">
          <tr>
            <td>${chiTiet.phoneVariants.phone.name}</td>
            <td>
              <form action="/quy/updateSoLuongGioHangChiTiet" method="post" class="d-flex justify-content-center align-items-center gap-2">
                <input type="hidden" name="variantId" value="${chiTiet.phoneVariants.variantId}">
                <input type="hidden" name="gioHangId" value="${gioHang.id}">
                <button type="submit" name="action" value="decrease" class="btn btn-danger btn-sm">−</button>
                <span>${chiTiet.soLuong}</span>
                <button type="submit" name="action" value="increase" class="btn btn-success btn-sm">＋</button>
              </form>
            </td>
            <td>${chiTiet.phoneVariants.price} ₫</td>
            <td>${chiTiet.soLuong * chiTiet.phoneVariants.price} ₫</td>
            <td>
              <a href="/quy/xoagiohang?id=${chiTiet.id}" class="btn btn-warning btn-sm" onclick="return confirm('Xác nhận xóa sản phẩm này?')">🗑️ Xóa</a>
            </td>
          </tr>
          <c:set var="totalPrice" value="${totalPrice + (chiTiet.soLuong * chiTiet.phoneVariants.price)}" />
        </c:forEach>
        </tbody>
      </table>

      <div class="text-end total-price">
        Tổng tiền giỏ hàng: <span class="text-danger">${totalPrice} ₫</span>
      </div>
    </div>
  </c:if>

  <div class="cart-actions mt-4">
    <a href="/quy/hien-thi" class="btn btn-outline-primary">⬅️ Trang Chủ</a>
    <a href="/quy/view_donhang" class="btn btn-success">🛍️ Tiến hành đặt hàng</a>
  </div>
</div>

</body>
</html>
