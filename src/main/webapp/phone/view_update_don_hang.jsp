<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>Cập Nhật Hóa Đơn</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }

    .form-container {
      max-width: 800px;
      margin: 40px auto;
      background-color: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
    }

    h2, h4 {
      text-align: center;
      margin-bottom: 30px;
    }

    .form-label {
      font-weight: 600;
    }

    .btn-submit {
      background-color: #007bff;
      color: white;
      transition: 0.3s;
    }

    .btn-submit:hover {
      background-color: #0056b3;
    }

    .cancel-button {
      text-align: center;
      margin-top: 20px;
    }

    .cancel-button a {
      color: #6c757d;
      text-decoration: none;
    }

    .cancel-button a:hover {
      text-decoration: underline;
    }

    .table td, .table th {
      vertical-align: middle;
    }

    .readonly-input {
      background-color: #e9ecef;
    }
  </style>
</head>
<body>
<div class="form-container">
  <h4>🧾 Danh Sách Sản Phẩm Trong Hóa Đơn</h4>
  <table class="table table-striped table-bordered">
  <thead class="table-secondary">
  <tr>
    <th>Tên Sản Phẩm</th>
    <th>Số Lượng</th>
    <th>Đơn Giá</th>
    <th>Thành Tiền</th>
  </tr>
  </thead>
  <tbody>
  <c:set var="tongThanhTien" value="0" />
  <c:forEach var="ct" items="${donHangChiTietList}">
    <tr>
      <td>${ct.phoneVariants.phone.name}</td>
      <td>${ct.soLuong}</td>
      <td><fmt:formatNumber value="${ct.gia}" type="currency" currencySymbol="₫" /></td>
      <td>
        <fmt:formatNumber value="${ct.thanhTien}" type="currency" currencySymbol="₫" />
      </td>
    </tr>
    <c:set var="tongThanhTien" value="${tongThanhTien + ct.thanhTien}" />
  </c:forEach>
  </tbody>
  <tfoot>
  <tr class="table-info fw-bold">
    <td colspan="3" class="text-end">Tổng Thành Tiền:</td>
    <td><fmt:formatNumber value="${tongThanhTien}" type="currency" currencySymbol="₫" /></td>
  </tr>
  </tfoot>
</table>


  <h2>✏️ Cập Nhật Hóa Đơn</h2>
  <form  action="/quy/update_don_hang" method="post">
    <div class="row g-3">
      <div class="col-md-6">
        <label class="form-label">Mã Hóa Đơn</label>
        <input name="id" value="${hoaDon.id}" readonly class="form-control readonly-input">
      </div>
      <div class="col-md-6">
        <label class="form-label">User ID</label>
        <input value="${hoaDon.users.id}" readonly class="form-control readonly-input">
      </div>

      <div class="col-md-6">
        <label class="form-label">Tên Người Nhận</label>
        <input name="tenNguoiNhanHang" value="${hoaDon.tenNguoiNhanHang}" readonly class="form-control readonly-input">
      </div>
      <div class="col-md-6">
        <label class="form-label">Số Điện Thoại</label>
        <input name="soDienThoai" value="${hoaDon.soDienThoai}" readonly class="form-control readonly-input">
      </div>

      <div class="col-12">
        <label class="form-label">Địa Chỉ Nhận</label>
        <input name="diaChiNhanHang" value="${hoaDon.diaChiNhanHang}" readonly class="form-control readonly-input">
      </div>

      <div class="col-md-6">
        <label class="form-label">Phương Thức Thanh Toán</label>
        <input name="phuongThucThanhToan" value="${hoaDon.phuongThucThanhToan}" readonly class="form-control readonly-input">
      </div>
      <div class="col-md-6">
        <label class="form-label">Ngày Đặt</label>
        <input type="date" name="ngayDat" value="${hoaDon.ngayDat}" readonly class="form-control readonly-input">
      </div>

      <div class="col-md-6">
        <label class="form-label">Tổng Tiền</label>
        <input type="text" name="tongTien"
               value="${hoaDon.tongTien}" readonly class="form-control readonly-input">
      </div>

      <div class="col-md-6">
        <label class="form-label">Trạng Thái</label>
        <select name="trangThai" class="form-select">
          <option value="0" <c:if test="${hoaDon.trangThai == 0}">selected</c:if>>🕒 Chờ xử lý</option>
          <option value="1" <c:if test="${hoaDon.trangThai == 1}">selected</c:if>>✅ Đang giao</option>
          <option value="2" <c:if test="${hoaDon.trangThai == 2}">selected</c:if>>📦 Hoàn Thành</option>
          <option value="3" <c:if test="${hoaDon.trangThai == 3}">selected</c:if>>❌ Đã hủy</option>
        </select>
      </div>
    </div>

    <div class="d-flex gap-3 mt-4">
      <button type="submit" class="btn btn-primary w-50">
        💾 Cập Nhật Hóa Đơn
      </button>
    </div>
  </form>




  <div class="cancel-button">
    <a href="/quy/all_donhang">← Quay lại danh sách đơn hàng</a>
  </div>
</div>
</body>
</html>
