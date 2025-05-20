package Controller;

import Model.*;
import Respository.*;
import jakarta.persistence.EntityManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Servlet", value = {"/quy/hien-thi",
        "/quy/delete",
        "/quy/view_update",
        "/quy/view_add",
        "/quy/update",
        "/quy/add",
        "/quy/xoagiohang",
        "/quy/hienthi_giohang",
        "/quy/add_giohang",
        "/quy/updateSoLuongGioHangChiTiet",
        "/quy/view_donhang",
        "/quy/add_donhang",
        "/quy/all_donhang",
        "/quy/view_update_donhang",
        "/quy/update_don_hang",



        "/quy/lichSuMuaHang",
        "/quy/hien-thi-full-san-pham",
        "/quy/loc",
        "/quy/danhSachHoaDon"


})
public class Servlet extends HttpServlet {

    Respository_hoaDonChitiet respository_hoaDonChitiet = new Respository_hoaDonChitiet();

    Respository_hoaDon respository_hoaDon = new Respository_hoaDon();
    Respository_Phone respository_phone = new Respository_Phone();

    Respository_chip respository_chip = new Respository_chip();
    Respository_Models respository_models = new Respository_Models();
    Respository_os respository_os = new Respository_os();
    Respository_brand respository_brand= new Respository_brand();

    Respository_variant respository_phonevariant = new Respository_variant();

    Respository_giohangchitiet respository_giohangchitiet = new Respository_giohangchitiet();
    Respository_giohang respository_giohang = new Respository_giohang();

    Respository_donHang respository_donHang = new Respository_donHang();

    Respository_donHangChiTiet respository_donHangChiTiet = new Respository_donHangChiTiet();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals("/quy/hien-thi")) {
            hienthi(request, response);
        } else if (uri.equals("/quy/delete")) {
            delete(request, response);
        } else if (uri.equals("/quy/view_update")) {
            view_update(request, response);
        }
        else if (uri.equals("/quy/view_add")) {
            view_add(request, response);
        }
        else if (uri.equals("/quy/hienthi_giohang")) {
            hienthi_giohang(request, response);
        }
        else if (uri.equals("/quy/xoagiohang")) {
            xoa_giohang(request, response);
        }
        else if (uri.equals("/quy/view_donhang")) {
            view_donhang(request, response);
        }
        else if (uri.equals("/quy/all_donhang")) {
           tatca_donhang(request, response);
        } else if (uri.equals("/quy/view_update_donhang")) {
            view_update_donHang(request, response);
        }

        else if (uri.equals("/quy/lichSuMuaHang")) {
            lichSuMuaHang(request, response);
        }
        else if (uri.equals("/quy/hien-thi-full-san-pham")) {
            SanPhamDangBan(request, response);
        }

            else if (uri.equals("/quy/danhSachHoaDon")) {
            DanhSachHoaDon(request, response);
        }
    }

    private void DanhSachHoaDon(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Users currentUser = (Users) session.getAttribute("user");
//
////        if (currentUser == null) {
////            response.sendRedirect("login.jsp"); // Nếu chưa đăng nhập
////            return;
////        }

        // Lấy danh sách hóa đơn theo User hiện tại
        EntityManager em = HibernateUtil.getFACTORY().createEntityManager();
        List<HoaDon> hoaDonList = em.createQuery(
                        "SELECT h FROM HoaDon h ", HoaDon.class)
                .getResultList();

        // Gán hóa đơn và các chi tiết vào request
        request.setAttribute("hoaDonList", hoaDonList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/phone/DanhSachHoaDon.jsp");
        dispatcher.forward(request, response);
    }

    private void loc(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String priceParam = request.getParameter("price");
        String releaseYearParam = request.getParameter("releaseYear");
        String batteryCapacityParam = request.getParameter("batteryCapacity");
        String trangThaiParam = request.getParameter("trangThai");

        BigDecimal price = null;
        Integer releaseYear = null;
        Integer batteryCapacity = null;
        Integer trangThai = null;

        // Chuyển các tham số sang kiểu dữ liệu tương ứng nếu có giá trị
        if (priceParam != null && !priceParam.isEmpty()) {
            price = new BigDecimal(priceParam);
        }
        if (releaseYearParam != null && !releaseYearParam.isEmpty()) {
            releaseYear = Integer.parseInt(releaseYearParam);
        }
        if (batteryCapacityParam != null && !batteryCapacityParam.isEmpty()) {
            batteryCapacity = Integer.parseInt(batteryCapacityParam);
        }
        if (trangThaiParam != null && !trangThaiParam.isEmpty()) {
            trangThai = Integer.parseInt(trangThaiParam);
        }

        // Gọi hàm lọc từ repository
        List<PhoneVariants> filteredVariants = respository_phonevariant.filterPhoneVariants(price, releaseYear, batteryCapacity, trangThai);

        // Đưa danh sách sản phẩm đã lọc vào request để hiển thị trong JSP
        request.setAttribute("phonevariants", filteredVariants);

        // Chuyển tiếp kết quả sang JSP để hiển thị
        request.getRequestDispatcher("/phone/san-pham.jsp").forward(request, response);


    }

    private void SanPhamDangBan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("phonevariants", respository_phonevariant.getAll_PhoneVariants());
        request.getRequestDispatcher("/phone/san-pham.jsp").forward(request, response);

    }

    private void lichSuMuaHang(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users currentUser = (Users) session.getAttribute("user");

//        if (currentUser == null) {
//            response.sendRedirect("login.jsp"); // Nếu chưa đăng nhập
//            return;
//        }

        // Lấy danh sách hóa đơn theo User hiện tại
        EntityManager em = HibernateUtil.getFACTORY().createEntityManager();
        List<HoaDon> hoaDonList = em.createQuery(
                        "SELECT h FROM HoaDon h WHERE h.user.id = :userId ORDER BY h.ngayDat DESC", HoaDon.class)
                .setParameter("userId", currentUser.getId())
                .getResultList();

        // Gán hóa đơn và các chi tiết vào request
        request.setAttribute("hoaDonList", hoaDonList);
        request.getRequestDispatcher("/phone/lichsumuahang.jsp").forward(request, response);
    }







    private void hienthi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("phonevariants", respository_phonevariant.getTop6_PhoneVariants());
        request.getRequestDispatcher("/phone/hien-thi.jsp").forward(request, response);


    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer ma = Integer.parseInt(request.getParameter("variantId"));
        respository_phonevariant.delete(ma);
        response.sendRedirect("/quy/hien-thi");
    }
    private void view_update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer ma = Integer.parseInt(request.getParameter("variantId"));
        request.setAttribute("phoness", respository_phone.getAll_phone());
        request.setAttribute("phonevariants", respository_phonevariant.getOne_PhoneVariants(ma));
        request.getRequestDispatcher("/phone/view-update.jsp").forward(request, response);
    }
    private void view_add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("phoness", respository_phone.getAll_phone());
        request.getRequestDispatcher("/phone/view-add.jsp").forward(request, response);
    }

//    private void hienthi_giohang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Users user = (Users) session.getAttribute("user");
//
//        if (user == null) {
//            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang login
//            response.sendRedirect("/login.jsp");
//            return;
//        }
//
//        // Tìm giỏ hàng của người dùng
//        GioHang gioHang = respository_giohang.findByUserIdAndTrangThai(user.getId());  // Giỏ hàng có trạng thái 2 (có sản phẩm)
//        if (gioHang == null) {
//            // Nếu giỏ hàng không tồn tại hoặc chưa có sản phẩm, thông báo cho người dùng
//            request.setAttribute("message", "Giỏ hàng của bạn đang trống.");
//        } else {
//            // Nếu giỏ hàng đã có sản phẩm, lấy danh sách chi tiết giỏ hàng
//            List<GioHangChiTiet> chiTietGioHang = respository_giohangchitiet.getAllByGioHang(gioHang.getId());
//            request.setAttribute("gioHang", gioHang);
//            request.setAttribute("chiTietGioHang", chiTietGioHang);
//        }
//
//        // Chuyển đến trang hiển thị giỏ hàng
//        request.getRequestDispatcher("/phone/giohang.jsp").forward(request, response);
//
//    }

    private void hienthi_giohang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang login
            response.sendRedirect("/login.jsp");
            return;
        }

        // Tìm giỏ hàng của người dùng (trạng thái 2: đang có sản phẩm)
        GioHang gioHang = respository_giohang.findByUserIdAndTrangThai(user.getId());

        if (gioHang == null) {
            request.setAttribute("message", "Giỏ hàng của bạn đang trống.");
        } else {
            // Lấy danh sách chi tiết giỏ hàng
            List<GioHangChiTiet> chiTietGioHang = respository_giohangchitiet.getAllByGioHang(gioHang.getId());

            if (chiTietGioHang == null || chiTietGioHang.isEmpty()) {
                // Nếu danh sách chi tiết rỗng, cập nhật trạng thái giỏ hàng về 0
                gioHang.setTrangThai(0);
                respository_giohang.update(gioHang);

                request.setAttribute("message", "Giỏ hàng của bạn đang trống.");
            } else {
                // Nếu có sản phẩm thì hiển thị
                request.setAttribute("chiTietGioHang", chiTietGioHang);
            }

            request.setAttribute("gioHang", gioHang);
        }

        // Chuyển đến trang hiển thị giỏ hàng
        request.getRequestDispatcher("/phone/giohang.jsp").forward(request, response);
    }


    private void xoa_giohang(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Integer ma = Integer.parseInt(request.getParameter("id"));
        respository_giohangchitiet.delete(ma);
        response.sendRedirect("/quy/hienthi_giohang");
    }

    private void view_donhang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang login
            response.sendRedirect("/login.jsp");
            return;
        }

        // Tìm giỏ hàng của người dùng
        GioHang gioHang = respository_giohang.findByUserIdAndTrangThai(user.getId());  // Giỏ hàng có trạng thái 2 (có sản phẩm)
        if (gioHang == null) {
            // Nếu giỏ hàng không tồn tại hoặc chưa có sản phẩm, thông báo cho người dùng
            request.setAttribute("message", "Giỏ hàng của bạn đang trống.");
        } else {
            // Nếu giỏ hàng đã có sản phẩm, lấy danh sách chi tiết giỏ hàng
            List<GioHangChiTiet> chiTietGioHang = respository_giohangchitiet.getAllByGioHang(gioHang.getId());
            request.setAttribute("gioHang", gioHang);
            request.setAttribute("chiTietGioHang", chiTietGioHang);
        }

        // Chuyển đến trang hiển thị giỏ hàng
        request.getRequestDispatcher("/phone/donhang.jsp").forward(request, response);
    }
    private void view_update_donHang(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Integer ma = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("hoaDon" ,respository_donHang.getOne(ma));

        request.setAttribute("donHangChiTietList",respository_donHangChiTiet.getByDonHangId(ma));
        request.getRequestDispatcher("/phone/view_update_don_hang.jsp").forward(request,response);
    }



    private void tatca_donhang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        request.setAttribute("listHoaDon",respository_donHang.getAll());
        request.getRequestDispatcher("/phone/all_donhang.jsp").forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.equals("/quy/add")) {
            add(request, response);
        } else if (uri.equals("/quy/update")) {
            update(request, response);
        }
        else if (uri.equals("/quy/add_giohang")) {
            addGioHang(request, response);
        }
        else if (uri.equals("/quy/updateSoLuongGioHangChiTiet")) {
            updateSoLuong(request, response);  // Thêm xử lý update số long
        }
        else if (uri.equals("/quy/add_donhang")) {
            add_donhang(request, response);
        }

                else if (uri.equals("/quy/update_don_hang")) {
            update_don_hang(request, response);
        }
        else if (uri.equals("/quy/loc")) {
            loc(request, response);
        }



    }



    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int variantId = Integer.parseInt(request.getParameter("variantId"));
            // Lấy các tham số từ form
            String ten1 = request.getParameter("ten");
            Phone phone = respository_phone.getOne_phone(Integer.parseInt(ten1));



            int soLuong = Integer.parseInt(request.getParameter("soluong"));
            String color = request.getParameter("color");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            int batteryCapacity = Integer.parseInt(request.getParameter("batteryCapacity"));
            int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
            int trangThai = Integer.parseInt(request.getParameter("trangThai"));

            // Giả sử bạn có entity Phone và PhoneVariant
            // Lấy đối tượng Phone từ repository theo id


            PhoneVariants newVariant = new PhoneVariants(variantId,phone,soLuong,color,price,batteryCapacity,releaseYear,trangThai);


            // Lưu vào DB
            respository_phonevariant.update(newVariant);

            // Chuyển hướng hoặc thông báo
            response.sendRedirect("/quy/hien-thi"); // hoặc setAttribute + forward nếu cần thông báo

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm điện thoại: " + e.getMessage());
            request.getRequestDispatcher("/view_add.jsp").forward(request, response);
        }
    }
    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ form
            String ten1 = request.getParameter("ten");
            Phone phone = respository_phone.getOne_phone(Integer.parseInt(ten1));
            int soLuong = Integer.parseInt(request.getParameter("soluong"));
            String color = request.getParameter("color");
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            int batteryCapacity = Integer.parseInt(request.getParameter("batteryCapacity"));
            int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
            int trangThai = Integer.parseInt(request.getParameter("trangThai"));

            // Giả sử bạn có entity Phone và PhoneVariant
            // Lấy đối tượng Phone từ repository theo id


            PhoneVariants newVariant = new PhoneVariants(phone,soLuong,color,price,batteryCapacity,releaseYear,trangThai);


            // Lưu vào DB
            respository_phonevariant.add(newVariant);

            // Chuyển hướng hoặc thông báo
            response.sendRedirect("/quy/hien-thi"); // hoặc setAttribute + forward nếu cần thông báo

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi khi thêm điện thoại: " + e.getMessage());
            request.getRequestDispatcher("/view_add.jsp").forward(request, response);
        }
    }



    private void addGioHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer variantId = Integer.parseInt(request.getParameter("variantId"));
        Integer soLuong = 1;

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login.jsp");
            return;
        }

        GioHang gioHang = respository_giohang.findByUserIdAndTrangThai(user.getId());
        if (gioHang == null) {
            gioHang = new GioHang();
            gioHang.setUsers(user);
            gioHang.setTrangThai(0); // Chưa đặt hàng
            respository_giohang.add(gioHang);
        }

        // Kiểm tra nếu đã có sản phẩm trong giỏ hàng thì tăng số lượng
        GioHangChiTiet chiTiet = respository_giohangchitiet.getByVariantAndGioHang_TrangThai0(variantId, gioHang.getId());
        if (chiTiet == null) {
            PhoneVariants variant = respository_phonevariant.getOne_PhoneVariants(variantId);
            chiTiet = new GioHangChiTiet(gioHang, variant, soLuong);
            chiTiet.setTrangThai(0);
            respository_giohangchitiet.add(chiTiet);
        } else {
            // Nếu đã có thì tăng số lượng
            chiTiet.setSoLuong(chiTiet.getSoLuong() + soLuong);
            respository_giohangchitiet.update(chiTiet);
        }

        gioHang.setTrangThai(1); // Đánh dấu giỏ hàng đã có sản phẩm
        respository_giohang.update(gioHang);

        response.sendRedirect("/quy/hien-thi");
    }



    private void updateSoLuong(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer variantId = Integer.parseInt(request.getParameter("variantId"));
        Integer gioHangId = Integer.parseInt(request.getParameter("gioHangId"));
        String action = request.getParameter("action");

        // Tìm giỏ hàng và chi tiết giỏ hàng đang có trạng thái 0
        GioHang gioHang = respository_giohang.getOne_gioHang(gioHangId);
        if (gioHang != null) {
            GioHangChiTiet chiTiet = respository_giohangchitiet.getByVariantAndGioHang_TrangThai0(variantId, gioHangId);
            if (chiTiet != null) {
                int currentQuantity = chiTiet.getSoLuong();
                if ("increase".equals(action)) {
                    chiTiet.setSoLuong(currentQuantity + 1);  // Tăng số lượng
                    respository_giohangchitiet.update(chiTiet);
                } else if ("decrease".equals(action)) {
                    if (currentQuantity > 1) {
                        chiTiet.setSoLuong(currentQuantity - 1);  // Giảm số lượng
                        respository_giohangchitiet.update(chiTiet);
                    } else {
                        // Nếu số lượng là 1 và giảm tiếp thì xóa luôn khỏi giỏ
                        respository_giohangchitiet.delete(chiTiet.getId());
                    }
                }
            }
        }

        response.sendRedirect("/quy/hienthi_giohang");
    }


    private void add_donhang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");

            if (user == null) {
                response.sendRedirect("/login.jsp");
                return;
            }

            // 1. Lấy thông tin từ form
            String diaChi = request.getParameter("diaChiNhanHang");
            String sdt = request.getParameter("soDienThoai");
            String tenNguoiNhan = request.getParameter("tenNguoiNhanHang");
            String ptThanhToan = request.getParameter("phuongThucThanhToan");
            BigDecimal tongTien = new BigDecimal(request.getParameter("tongTien"));

            // 2. Tạo mới đơn hàng
            DonHang donHang = new DonHang();
            donHang.setDiaChiNhanHang(diaChi);
            donHang.setSoDienThoai(sdt);
            donHang.setTenNguoiNhanHang(tenNguoiNhan);
            donHang.setPhuongThucThanhToan(ptThanhToan);
            donHang.setTongTien(tongTien);
            donHang.setTrangThai(0);
            donHang.setNgayDat(LocalDate.now());
            donHang.setUsers(user);

            // Lưu đơn hàng để lấy ID (auto-generated)
            respository_donHang.insert(donHang); // Bạn cần có DonHangRepository

            // 3. Lấy giỏ hàng và chi tiết giỏ hàng
            GioHang gioHang = respository_giohang.findByUserIdAndTrangThai(user.getId());
            if (gioHang == null) {
                request.setAttribute("message", "Không tìm thấy giỏ hàng.");
                request.getRequestDispatcher("/phone/donhang.jsp").forward(request, response);
                return;
            }

            List<GioHangChiTiet> gioHangChiTietList = respository_giohangchitiet.getAllByGioHang(gioHang.getId());

            // 4. Sao chép từng sản phẩm sang DonHangChiTiet
            for (GioHangChiTiet ghct : gioHangChiTietList) {
                DonHangChiTiet dhct = new DonHangChiTiet();
                dhct.setDonHang(donHang);
                dhct.setPhoneVariants(ghct.getPhoneVariants());
                dhct.setSoLuong(ghct.getSoLuong());
                dhct.setGia(ghct.getPhoneVariants().getPrice()); // Hoặc lấy từ ghct nếu cần
                dhct.setThanhTien(ghct.getPhoneVariants().getPrice().multiply(BigDecimal.valueOf(ghct.getSoLuong())));
                respository_donHangChiTiet.insert(dhct); // Lưu từng DonHangChiTiet
            }



        respository_giohangchitiet.updateTrangThaiByGioHangId(gioHang.getId());
            // 6. Chuyển hướng sang trang thông báo hoặc danh sách đơn hàng
        response.sendRedirect("/quy/hien-thi"); // hoặc setAttribute + forward nếu cần thông báo
        }


    private void update_don_hang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        int trangThai = Integer.parseInt(request.getParameter("trangThai"));

        DonHang donHang = respository_donHang.getOne(id);
        if (donHang != null) {
            donHang.setTrangThai(trangThai);
            respository_donHang.update(donHang);

            if (trangThai == 2 ) {
                // Tạo hóa đơn mới
                HoaDon hoaDon = new HoaDon();
                hoaDon.setDonHang(donHang);
                hoaDon.setUser(donHang.getUsers()); // giả sử DonHang có thông tin người dùng
                hoaDon.setDiaChiNhanHang(donHang.getDiaChiNhanHang());
                hoaDon.setSoDienThoai(donHang.getSoDienThoai());
                hoaDon.setTenNguoiNhanHang(donHang.getTenNguoiNhanHang());
                hoaDon.setPhuongThucThanhToan(donHang.getPhuongThucThanhToan());
                hoaDon.setNgayDat(donHang.getNgayDat());
                hoaDon.setNgayHoanThanhDonHang(LocalDate.now());
                hoaDon.setTrangThai(2); // trạng thái hóa đơn mới, ví dụ: 1 = đang chờ thanh toán
                hoaDon.setTongTien(donHang.getTongTien()); // nếu có
                respository_hoaDon.add(hoaDon); // lưu hóa đơn vào DB

                // Lấy danh sách chi tiết đơn hàng
                List<DonHangChiTiet> listChiTiet = respository_donHangChiTiet.getByDonHangId(donHang.getId());

                // Tạo chi tiết hóa đơn
                for (DonHangChiTiet dhct : listChiTiet) {
                    HoaDonChiTiet hdct = new HoaDonChiTiet();
                    hdct.setHoaDon(hoaDon);
                    hdct.setVariant(dhct.getPhoneVariants());
                    hdct.setSoLuong(dhct.getSoLuong());
                    hdct.setDonGia(dhct.getGia());
                    hdct.setThanhTien(dhct.getThanhTien());
                    respository_hoaDonChitiet.add(hdct);

                    PhoneVariants variant = dhct.getPhoneVariants();
                    int soLuongCon = variant.getQuantity() - dhct.getSoLuong();
                    if (soLuongCon < 0) {
                        soLuongCon = 0; // tránh âm nếu thiếu kiểm tra ở UI
                    }
                    variant.setQuantity(soLuongCon);
                     respository_phonevariant.update(variant);
                }
            }

            response.sendRedirect("/quy/all_donhang");
        }
    }








}

