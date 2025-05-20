package Respository;

import Controller.HibernateUtil;
import Model.HoaDon;
import Model.PhoneVariants;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class Respository_hoaDon {
    public List<HoaDon> getAll() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM HoaDon", HoaDon.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public void add(HoaDon hoaDon) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.save(hoaDon);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace(); // Kiểm tra lỗi
        }
    }

    public List<HoaDon> getHoaDonByUserId(int userId) {
        Session session = HibernateUtil.getFACTORY().openSession();
        List<HoaDon> list = session.createQuery(
                        "FROM HoaDon hd WHERE hd.user.id = :userId", HoaDon.class)
                .setParameter("userId", userId)
                .getResultList();
        session.close();
        return list;
    }

}
