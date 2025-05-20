<%@ page import="Model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat</title>
</head>
<body>
<h3>Nhập tin nhắn:</h3>
<input type="text" id="msg" />
<button onclick="sendMessage()">Gửi</button>

<h3>Hộp thư đến:</h3>

<input id="chatBox">

<script>
    const socket = new WebSocket("ws://localhost:8080/phone/chat.jsp");

    socket.onmessage = function(event) {
        const chatBox = document.getElementById("chatBox");
        const msg = document.createElement("div");
        msg.textContent = event.data;
        chatBox.appendChild(msg);
    };

    function sendMessage() {
        const msg = document.getElementById("msg").value;
        socket.send(msg);
        document.getElementById("msg").value = '';
    }
</script>
</body>
</html>
