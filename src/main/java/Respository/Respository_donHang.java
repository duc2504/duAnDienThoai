package Respository;

import Controller.HibernateUtil;
import Model.Chip;
import Model.DonHang;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class Respository_donHang {
    public List<DonHang> getAll() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM DonHang ", DonHang.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public DonHang getOne(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(DonHang.class, id);
        }
    }

    public void insert(DonHang dh) {
        Session session = HibernateUtil.getFACTORY().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(dh);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
    public void update(DonHang donHang) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.update(donHang);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }



}
