package Controller;

import Controller.HttpSessionConfigurator;
import Model.Users;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import jakarta.servlet.http.HttpSession;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value = "/chat", configurator = HttpSessionConfigurator.class)
public class ChatEndpoint {

    // Lưu trữ userId -> Session
    private static final Map<Integer, Session> userSessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        if (httpSession != null) {
            Users user = (Users) httpSession.getAttribute("user");
            if (user != null) {
                Integer userId = user.getId();
                Integer roleId = user.getRole().getId();

                userSessions.put(userId, session);
                session.getUserProperties().put("userId", userId);
                session.getUserProperties().put("role", roleId);

                System.out.println("Connected: " + user.getUsername() + " (role=" + roleId + ")");
            } else {
                System.out.println("Không tìm thấy user trong session");
            }
        } else {
            System.out.println("Không lấy được HttpSession");
        }
    }

    @OnMessage
    public void onMessage(Session session, String message) {
        Integer senderId = (Integer) session.getUserProperties().get("userId");
        Integer senderRole = (Integer) session.getUserProperties().get("role");

        for (Map.Entry<Integer, Session> entry : userSessions.entrySet()) {
            Session targetSession = entry.getValue();
            Integer targetRole = (Integer) targetSession.getUserProperties().get("role");

            if (!targetRole.equals(senderRole) && targetSession.isOpen()) {
                targetSession.getAsyncRemote().sendText("User " + senderId + ": " + message);
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        Integer userId = (Integer) session.getUserProperties().get("userId");
        if (userId != null) {
            userSessions.remove(userId);
            System.out.println("Disconnected: User ID " + userId);
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        throwable.printStackTrace();
    }
}
