package Respository;

import Controller.HibernateUtil;
import Model.DonHang;
import Model.DonHangChiTiet;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class Respository_donHangChiTiet {

    public List<DonHangChiTiet> getAll() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM DonHangChiTiet", DonHangChiTiet.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public DonHangChiTiet getOne(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(DonHangChiTiet.class, id);
        }
    }

    public void insert(DonHangChiTiet donHangChiTiet) {
        Session session = HibernateUtil.getFACTORY().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(donHangChiTiet);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public List<DonHangChiTiet> getByDonHangId(Integer donHangId) {
        Session session = HibernateUtil.getFACTORY().openSession();
        String hql = "FROM DonHangChiTiet WHERE donHang.id = :id";
        return session.createQuery(hql, DonHangChiTiet.class)
                .setParameter("id", donHangId)
                .getResultList();
    }


}
