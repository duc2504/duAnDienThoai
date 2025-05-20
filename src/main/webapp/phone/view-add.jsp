<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .form-container h2 {
            font-size: 26px;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
            border-radius: 5px;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        .cancel-button {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .cancel-button a {
            text-decoration: none;
            color: #007bff;
        }

        .cancel-button a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Thêm Sản Phẩm Mới</h2>
    <form action="/quy/add" method="post">
        <div>
            <label for="ten" class="form-label">Tên:</label>
            <select id="ten" name="ten" class="form-control">
                <c:forEach var="phones" items="${phoness}">
                    <option value="${phones.id}">${phones.name}</option>
                </c:forEach>
            </select>
        </div>

        <div>
            <label for="soluong" class="form-label">Số lượng:</label>
            <input id="soluong" name="soluong" required type="number" class="form-control">
        </div>

        <div>
            <label for="color" class="form-label">Màu sắc:</label>
            <input id="color" name="color" type="text" required class="form-control">
        </div>

        <div>
            <label for="price" class="form-label">Giá bán:</label>
            <input id="price" name="price" type="number" step="0.001" required class="form-control">
        </div>

        <div>
            <label for="battery" class="form-label">Dung lượng pin (mAh):</label>
            <input id="battery" name="batteryCapacity" type="number" required class="form-control">
        </div>

        <div>
            <label for="releaseYear" class="form-label">Năm phát hành:</label>
            <input id="releaseYear" name="releaseYear" type="number" required class="form-control">
        </div>

        <div>
            <label for="trangThai" class="form-label">Trạng thái:</label>
            <select id="trangThai" name="trangThai" class="form-control">
                <option value="1">Còn hàng</option>
                <option value="0">Hết hàng</option>
            </select>
        </div>

        <button type="submit" class="btn-submit w-100">Thêm điện thoại</button>
    </form>

    <div class="cancel-button">
        <a href="/quy/hien-thi">Trang Chủ</a>
    </div>
</div>
</body>
</html>
