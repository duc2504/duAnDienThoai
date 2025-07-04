package Controller;

import Model.Users;
import Model.Message;
import Respository.Repository_Message;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MessageServlet", value = {"/Message/hien-thi", "/Message/add"})
public class MessageServlet extends HttpServlet {

    private Repository_Message repository_message;

    @Override
    public void init() throws ServletException {
        super.init();
        // Khởi động repository
        repository_message = new Repository_Message();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.equals("/Message/hien-thi")) {
            hienthi(request, response);
        }
    }

    private void hienthi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int toUserId = Integer.parseInt(request.getParameter("toUserId"));
        List<Message> messages = repository_message.findMessagesToUserId(toUserId);
        request.setAttribute("messages", messages);
        request.setAttribute("toUserId", toUserId);
        request.getRequestDispatcher("/mess/message.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.equals("/Message/add")) {
            add(request, response);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int fromUserId = Integer.parseInt(request.getParameter("fromUserId"));
        int toUserId = Integer.parseInt(request.getParameter("toUserId"));
        String content = request.getParameter("content");

        Message message = new Message();

        message.setContent(content);

        Users from = new Users();
        from.setId(fromUserId);
        message.setFromUser(from);

        Users to = new Users();
        to.setId(toUserId);
        message.setToUser(to);

        repository_message.save(message);

        response.sendRedirect(request.getContextPath() + "/Message/hien-thi?toUserId=" + toUserId);
    }
}
