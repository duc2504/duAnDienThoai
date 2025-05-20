package Respository;

import Controller.HibernateUtil;
import Model.Brand;
import Model.Phone;
import Model.PhoneVariants;
import jakarta.persistence.TypedQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.math.BigDecimal;
import java.util.List;

public class Respository_variant {
    public List<PhoneVariants> getAll_PhoneVariants() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM PhoneVariants", PhoneVariants.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public List<PhoneVariants> getTop6_PhoneVariants() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.createQuery("FROM PhoneVariants", PhoneVariants.class)
                    .setMaxResults(6)
                    .list();
        }
    }

    public PhoneVariants getOne_PhoneVariants(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(PhoneVariants.class, id);
        }
    }

    public void add(PhoneVariants phoneVariants) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.save(phoneVariants);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace(); // Kiểm tra lỗi
        }
    }
    public void update(PhoneVariants phoneVariants) {
        Transaction transaction = null; // Khai báo transaction để quản lý giao dịch
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction(); // Bắt đầu giao dịch
            session.update(phoneVariants); // Cập nhật dữ liệu dự án
            transaction.commit(); // Xác nhận thay đổi vào database
        } catch (Exception e) {
            if (transaction != null) transaction.rollback(); // Nếu có lỗi, hoàn tác giao dịch
            e.printStackTrace(); // In lỗi ra console
        }
    }

    public void delete(Integer id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            PhoneVariants phoneVariants = session.get(PhoneVariants.class, id);
            if (phoneVariants != null) {
                session.delete(phoneVariants);
                transaction.commit();
            } else {
                System.out.println("Phòng ban không tồn tại!");
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }












        public List<PhoneVariants> filterPhoneVariants(BigDecimal price, Integer releaseYear, Integer batteryCapacity, Integer trangThai) {
            try (Session session = HibernateUtil.getFACTORY().openSession()) {
                // Xây dựng câu truy vấn với các điều kiện lọc
                StringBuilder hql = new StringBuilder("FROM PhoneVariants pv WHERE 1=1");

                if (price != null) {
                    hql.append(" AND pv.price = :price");
                }
                if (releaseYear != null) {
                    hql.append(" AND pv.releaseYear = :releaseYear");
                }
                if (batteryCapacity != null) {
                    hql.append(" AND pv.batteryCapacity = :batteryCapacity");
                }
                if (trangThai != null) {
                    hql.append(" AND pv.trangThai = :trangThai");
                }

                Query<PhoneVariants> query = session.createQuery(hql.toString(), PhoneVariants.class);

                // Gán các tham số vào truy vấn
                if (price != null) {
                    query.setParameter("price", price);
                }
                if (releaseYear != null) {
                    query.setParameter("releaseYear", releaseYear);
                }
                if (batteryCapacity != null) {
                    query.setParameter("batteryCapacity", batteryCapacity);
                }
                if (trangThai != null) {
                    query.setParameter("trangThai", trangThai);
                }

                return query.list();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }






}
