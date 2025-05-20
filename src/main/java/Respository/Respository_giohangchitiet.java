package Respository;

import Controller.HibernateUtil;
import Model.GioHangChiTiet;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import java.util.UUID;

public class Respository_giohangchitiet {

    public List<GioHangChiTiet> getAll_gioHangChiTiet() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM GioHangChiTiet ",GioHangChiTiet.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public GioHangChiTiet getOne_gioHangChiTiet(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(GioHangChiTiet.class, id);
        }
    }


    public List<GioHangChiTiet> getByGioHangId(int gioHangId) {
        Session session = HibernateUtil.getFACTORY().openSession();
        return session.createQuery("FROM GioHangChiTiet WHERE gioHang.id = :id", GioHangChiTiet.class)
                .setParameter("id", gioHangId)
                .getResultList();
    }
//("FROM GioHangChiTiet WHERE phoneVariants.variantId = :variantId AND gioHang.id = :gioHangId",
//    GioHangChiTiet.class)

    public GioHangChiTiet getByVariantAndGioHang(int variantId, int gioHangId) {
        Transaction transaction = null;
        Session session = HibernateUtil.getFACTORY().openSession();
        GioHangChiTiet result = null;

        try {
            transaction = session.beginTransaction();
            result = session.createQuery("FROM GioHangChiTiet WHERE phoneVariants.variantId = :variantId AND gioHang.id = :gioHangId",
            GioHangChiTiet.class)
                    .setParameter("variantId", variantId)
                    .setParameter("gioHangId", gioHangId)
                    .uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); // rollback chỉ khi session còn mở
            }
            e.printStackTrace(); // hoặc log
        } finally {
            session.close(); // đảm bảo luôn đóng
        }

        return result;
    }


    public void add(GioHangChiTiet ct) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            tx = session.beginTransaction();
            session.save(ct);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();

        }
    }

    public void update(GioHangChiTiet ct) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            tx = session.beginTransaction();
            session.update(ct);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
        }
    }

    public List<GioHangChiTiet> getAllByGioHang(int gioHangId) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            // Truy vấn lấy tất cả chi tiết giỏ hàng từ GioHangChiTiet
            return session.createQuery("FROM GioHangChiTiet WHERE gioHang.id = :gioHangId AND trangThai = 0", GioHangChiTiet.class)
                    .setParameter("gioHangId", gioHangId)
                    .list();
        }
    }

    public void delete(int id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();

            GioHangChiTiet chiTiet = session.get(GioHangChiTiet.class, id);
            if (chiTiet != null) {
                session.delete(chiTiet);
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public void updateTrangThaiByGioHangId(Integer gioHangId) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();

            String hql = "UPDATE GioHangChiTiet SET trangThai = 1 WHERE gioHang.id = :gioHangId AND trangThai = 0";
            Query query = session.createQuery(hql);
            query.setParameter("gioHangId", gioHangId);

            query.executeUpdate();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    public List<GioHangChiTiet> getAllByGioHangAndTrangThai(int gioHangId, int trangThai) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            // Truy vấn lấy tất cả chi tiết giỏ hàng từ GioHangChiTiet với điều kiện trangThai
            return session.createQuery("FROM GioHangChiTiet WHERE gioHang.id = :gioHangId AND trangThai = :trangThai", GioHangChiTiet.class)
                    .setParameter("gioHangId", gioHangId)
                    .setParameter("trangThai", trangThai)
                    .list();
        }
    }
    public GioHangChiTiet getByVariantAndGioHang_TrangThai0(int variantId, int gioHangId) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.createQuery(
                            "FROM GioHangChiTiet WHERE phoneVariants.variantId = :variantId AND gioHang.id = :gioHangId AND trangThai = 0",
                            GioHangChiTiet.class)
                    .setParameter("variantId", variantId)
                    .setParameter("gioHangId", gioHangId)
                    .uniqueResult();
        }
    }

    



}















