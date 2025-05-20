<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Lịch Sử Mua Hàng</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f7f9fc;
      margin: 0;
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #333;
      margin-bottom: 30px;
    }

    .invoice {
      background: #fff;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 30px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
    }

    .invoice:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .invoice h3 {
      color: #1a73e8;
      margin-bottom: 10px;
    }

    .invoice p {
      margin: 5px 0;
      color: #555;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    th, td {
      border: 1px solid #e0e0e0;
      padding: 10px;
      text-align: center;
    }

    th {
      background-color: #f1f3f4;
      color: #333;
      font-weight: 600;
    }

    td {
      background-color: #ffffff;
    }

    @media (max-width: 768px) {
      body {
        padding: 10px;
      }

      .invoice {
        padding: 15px;
      }

      table, th, td {
        font-size: 14px;
      }
    }

    .status {
      font-weight: bold;
      padding: 4px 10px;
      border-radius: 4px;
      display: inline-block;
    }

    .status.pending { background: #ffe082; color: #795548; }
    .status.shipping { background: #81d4fa; color: #01579b; }
    .status.completed { background: #a5d6a7; color: #2e7d32; }
    .status.cancelled { background: #ef9a9a; color: #c62828; }
  </style>
</head>
<body>

<h2>Lịch Sử Mua Hàng</h2>

<c:forEach var="hd" items="${hoaDonList}">
  <div class="invoice">
    <h3>Hóa đơn #${hd.hoaDonId}</h3>

    <p><strong>Người nhận:</strong> ${hd.tenNguoiNhanHang}</p>
    <p><strong>Địa chỉ:</strong> ${hd.diaChiNhanHang}</p>
    <p><strong>Số điện thoại:</strong> ${hd.soDienThoai}</p>
    <p><strong>Phương thức thanh toán:</strong> ${hd.phuongThucThanhToan}</p>
    <p><strong>Ngày đặt:</strong> ${hd.ngayDat}</p>
    <p><strong>Ngày hoàn thành:</strong> ${hd.ngayHoanThanhDonHang}</p>
    <p><strong>Tổng tiền:</strong> ${hd.tongTien} VND</p>
    <p><strong>Trạng thái:</strong>
      <span class="status
                <c:choose>
                    <c:when test="${hd.trangThai == 0}">pending</c:when>
                    <c:when test="${hd.trangThai == 1}">shipping</c:when>
                    <c:when test="${hd.trangThai == 2}">completed</c:when>
                    <c:when test="${hd.trangThai == 3}">cancelled</c:when>
                    <c:otherwise>cancelled</c:otherwise>
                </c:choose>">
                <c:choose>
                  <c:when test="${hd.trangThai == 0}">Chờ xử lý</c:when>
                  <c:when test="${hd.trangThai == 1}">Đang giao</c:when>
                  <c:when test="${hd.trangThai == 2}">Hoàn thành</c:when>
                  <c:when test="${hd.trangThai == 3}">Đã hủy</c:when>
                  <c:otherwise>Hủy</c:otherwise>
                </c:choose>
            </span>
    </p>

    <h4>Chi tiết hóa đơn:</h4>
    <table>
      <thead>
      <tr>
        <th>#</th>
        <th>Sản phẩm</th>
        <th>Màu </th>
        <th>Năm phát hành</th>
        <th>Dung lượng pin</th>
        <th>Số lượng</th>
        <th>Đơn giá</th>
        <th>Thành tiền</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="ct" items="${hd.hoaDonChiTiets}" varStatus="stt">
        <tr>
          <td>${stt.index + 1}</td>
          <td>${ct.variant.phone.name}</td>
          <td>${ct.variant.color}</td>
          <td>${ct.variant.releaseYear}</td>
          <td>${ct.variant.batteryCapacity}</td>
          <td>${ct.soLuong}</td>
          <td>${ct.donGia} VND</td>
          <td>${ct.thanhTien} VND</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</c:forEach>

</body>
</html>
