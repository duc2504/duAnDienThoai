package Controller;


import Model.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class HibernateUtil {
    private static final SessionFactory FACTORY;

    static {
        try {


            Configuration conf = new Configuration();

            Properties properties = new Properties();
            properties.put(Environment.DIALECT, "org.hibernate.dialect.SQLServer2016Dialect");
            properties.put(Environment.DRIVER, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
            properties.put(Environment.URL, "jdbc:sqlserver://localhost:1433;databaseName=duAn_DienThoai;encrypt=true;trustServerCertificate=true;");
            properties.put(Environment.USER, "sa");
            properties.put(Environment.PASS, "quy123");
            properties.put(Environment.SHOW_SQL, "true");
            properties.put(Environment.HBM2DDL_AUTO, "update");
            // add model
            conf.addAnnotatedClass(Phone.class);
            conf.addAnnotatedClass(Chip.class);
            conf.addAnnotatedClass(Models.class);
            conf.addAnnotatedClass(OS.class);
            conf.addAnnotatedClass(Brand.class);
            conf.addAnnotatedClass(PhoneVariants.class);

            conf.addAnnotatedClass(Users.class);
            conf.addAnnotatedClass(Role.class);

            conf.addAnnotatedClass(GioHang.class);
            conf.addAnnotatedClass(GioHangChiTiet.class);


            conf.addAnnotatedClass(DonHang.class);
            conf.addAnnotatedClass(DonHangChiTiet.class);


            conf.addAnnotatedClass(HoaDon.class);
            conf.addAnnotatedClass(HoaDonChiTiet.class);



//
//            conf.addAnnotatedClass(User.class);
//
//            conf.addAnnotatedClass(Quyen.class);
//            conf.addAnnotatedClass(TaiKhoan.class);
//
//
//            conf.addAnnotatedClass(DuAn.class);
//            conf.addAnnotatedClass(PhongBan.class);
//            conf.addAnnotatedClass(NhanVien.class);

            conf.setProperties(properties);
            ServiceRegistry registry = new StandardServiceRegistryBuilder()
                    .applySettings(conf.getProperties()).build();
            FACTORY = conf.buildSessionFactory(registry);
        } catch (Exception e) {
            throw new ExceptionInInitializerError("Lỗi kết nối Hibernate: " + e.getMessage());
        }
    }

    public static SessionFactory getFACTORY() {
        return FACTORY;
    }

    public static void main(String[] args) {
        if (getFACTORY() != null) {
            System.out.println("Kết nối thành công: " + getFACTORY());
        } else {
            System.out.println("Kết nối thất bại!");
        }
    }
}

