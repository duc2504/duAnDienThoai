package Respository;

import Controller.HibernateUtil;
import Model.GioHang;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class Respository_giohang {

    public List<GioHang> getAll_gioHang() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM GioHang ", GioHang.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public GioHang getOne_gioHang(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(GioHang.class, id);
        }
    }

    public GioHang findByUserIdAndTrangThai(int userId) {
        Session session = HibernateUtil.getFACTORY().openSession();
        try {
            return session.createQuery("FROM GioHang WHERE users.id = :userId ", GioHang.class)
                    .setParameter("userId", userId)

                    .uniqueResult();
        } finally {
            session.close();
        }
    }

    public void add(GioHang gioHang) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            tx = session.beginTransaction();
            session.save(gioHang);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
    }

    public void update(GioHang gioHang) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            tx = session.beginTransaction();
            session.update(gioHang);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
        }
    }




}
