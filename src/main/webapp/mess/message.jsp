<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Tin nhắn</title>
</head>
<body>
<h1>Các tin nhắn gửi đến bạn (User ${toUserId})</h1>

<ul>
  <c:forEach var="msg" items="${messages}">
    <li>
      Từ User ${msg.fromUser.id}: ${msg.content} (vào lúc ${msg.sentAt})
    </li>
  </c:forEach>
</ul>

<h2>Gửi thêm tin nhắn</h2>
<form action="${pageContext.request.contextPath}/Message/add" method="post">
  <input type="hidden" name="fromUserId" value="${toUserId}" />
  <label>To User ID:</label> <input type="number" name="toUserId" /><br/>

  <label>Nội dung:</label> <textarea name="content" rows="5" cols="30"></textarea><br/>

  <input type="submit" value="Gửi" />
</form>

<a href="${pageContext.request.contextPath}/Message/hien-thi?toUserId=${toUserId}">
  Tải lại
</a>

</body>
</html>
