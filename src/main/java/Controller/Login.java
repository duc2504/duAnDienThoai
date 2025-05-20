package Controller;

import Model.Users;
import Respository.Respository_users;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Login", value = {"/login/hien-thi",
        "/login/view/dang-ky",
        "/login/dang-ky",
        "/login/dang-nhap"

})
public class Login extends HttpServlet {

    Respository_users respository_users = new Respository_users();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals("/login/hien-thi")) {
           request.getRequestDispatcher("/phone/login.jsp").forward(request,response);
        }
        else if(uri.equals("/login/view/dang-ky")){
            request.getRequestDispatcher("/phone/dang-ky.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals("/login/dang-nhap")) {
            // Lấy dữ liệu từ form
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Gọi repository để kiểm tra đăng nhập
            Respository_users repo = new Respository_users();
            Users user = repo.login(username, password);


            if (user != null) {
                if (user.getRole() == null) {
                    // Nếu role bị null → báo lỗi
                    request.setAttribute("error", "Tài khoản chưa được phân quyền!");
                    request.getRequestDispatcher("/phone/login.jsp").forward(request, response);
                } else if (user.getRole().getId() == 1) {
                    // Đăng nhập thành công và đúng quyền user
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect("/quy/hien-thi");
                }
                else if (user.getRole().getId() == 2) {
                    // Đăng nhập thành công và đúng quyền user
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect("/quy/hien-thi");
                } else {
                    // Đúng tài khoản nhưng không đúng quyền
                    request.setAttribute("error", "Bạn không có quyền truy cập!");
                    request.getRequestDispatcher("/phone/login.jsp").forward(request, response);
                }
            } else {
                // Sai tài khoản hoặc mật khẩu
                request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
                request.getRequestDispatcher("/phone/login.jsp").forward(request, response);
            }
        } else if (uri.equals("/login/dang-ky")){
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Kiểm tra người dùng đã tồn tại chưa
            Users existingUser = respository_users.findByUsername(username);
            if (existingUser != null) {
                request.setAttribute("error", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("/phone/dang-ky.jsp").forward(request, response);
                return;
            }

           if(username.endsWith("admin")){
               Users newUser = new Users();
               newUser.setUsername(username);
               newUser.setPassword(password); // Thực tế nên hash mật khẩu nhé
               respository_users.add_admin(newUser);
           } else {
               Users newUser = new Users();
               newUser.setUsername(username);
               newUser.setPassword(password); // Thực tế nên hash mật khẩu nhé
               respository_users.add_user(newUser);
           }



            // Sau khi đăng ký xong, chuyển sang trang đăng nhập hoặc tự động login
            response.sendRedirect("/login/hien-thi");
        }
    }

}
