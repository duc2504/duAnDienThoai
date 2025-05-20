<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Danh sách hóa đơn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            max-width: 1200px;
            margin-top: 50px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        }

        h3 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            color: #343a40;
        }

        table {
            border-collapse: collapse;
        }

        thead th {
            background-color: #007bff;
            color: #ffffff;
            text-align: center;
            vertical-align: middle;
        }

        tbody td {
            vertical-align: middle;
            background-color: #ffffff;
            text-align: center;
        }

        tr:hover td {
            background-color: #f1f9ff;
        }

        .btn-action {
            padding: 6px 12px;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
        }

        .btn-update {
            background-color: #17a2b8;
            color: #fff;
        }

        .btn-update:hover {
            background-color: #138496;
            color: #fff;
        }

        .btn-disabled {
            background-color: #6c757d;
            color: #ffffff;
            cursor: not-allowed;
        }

        .btn-back {
            margin-top: 25px;
            display: inline-block;
            background-color: #28a745;
            color: white;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-back:hover {
            background-color: #218838;
            color: white;
        }

        .table-container {
            overflow-x: auto;
        }

        .badge {
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .btn-action {
                display: block;
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h3>Danh sách hóa đơn</h3>

    <div class="table-container">
        <table class="table table-bordered table-hover align-middle">
            <thead>
            <tr>
                <th>Đơn Hàng ID</th>
                <th>Địa Chỉ Nhận</th>
                <th>SĐT</th>
                <th>Tên Người Nhận</th>
                <th>PT Thanh Toán</th>
                <th>Ngày Đặt</th>
                <th>Tổng Tiền</th>
                <th>Trạng Thái</th>
                <th>User ID</th>
                <th>Hành Động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="hd" items="${listHoaDon}">
                <tr>
                    <td>${hd.id}</td>
                    <td>${hd.diaChiNhanHang}</td>
                    <td>${hd.soDienThoai}</td>
                    <td>${hd.tenNguoiNhanHang}</td>
                    <td>${hd.phuongThucThanhToan}</td>
                    <td>${hd.ngayDat}</td>
                    <td>${hd.tongTien}</td>
                    <td>
                        <c:choose>
                            <c:when test="${hd.trangThai == 0}">
                                <span class="badge bg-warning text-dark">Chờ xử lý</span>
                            </c:when>
                            <c:when test="${hd.trangThai == 1}">
                                <span class="badge bg-info text-dark">Đang giao</span>
                            </c:when>
                            <c:when test="${hd.trangThai == 2}">
                                <span class="badge bg-success">Hoàn thành</span>
                            </c:when>
                            <c:when test="${hd.trangThai == 3}">
                                <span class="badge bg-danger">Đã hủy</span>
                            </c:when>
                        </c:choose>
                    </td>
                    <td>${hd.users.id}</td>
                    <td>
                        <c:choose>
                            <c:when test="${hd.trangThai == 2 || hd.trangThai == 3}">
                                <span class="badge bg-secondary" title="Không thể sửa">Không thể sửa</span>
                            </c:when>
                            <c:otherwise>
                                <a href="/quy/view_update_donhang?id=${hd.id}" class="btn-action btn-update">Sửa</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="text-center">
        <a href="/quy/hien-thi" class="btn-back">Quay về Trang Chủ</a>
    </div>
</div>

</body>
</html>
