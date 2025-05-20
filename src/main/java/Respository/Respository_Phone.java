package Respository;




import Controller.HibernateUtil;
import Model.Phone;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Respository_Phone {
    public List<Phone> getAll_phone() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM Phone ", Phone.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public Phone getOne_phone(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(Phone.class, id);
        }
    }

    public List<Phone> getPhoneByIds(List<Integer> ids){
        return getAll_phone().stream().filter(phone -> ids.contains(phone.getId())).collect(Collectors.toList());
    }

    public void update_Phone(Phone phone) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            session.beginTransaction();
            session.update(phone);  // Cập nhật sản phẩm trong DB
            session.getTransaction().commit();
        }
    }

    public void add(Phone phone) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.save(phone);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace(); // Kiểm tra lỗi
        }
    }
    public void update(Phone phone) {
        Transaction transaction = null; // Khai báo transaction để quản lý giao dịch
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction(); // Bắt đầu giao dịch
            session.update(phone); // Cập nhật dữ liệu dự án
            transaction.commit(); // Xác nhận thay đổi vào database
        } catch (Exception e) {
            if (transaction != null) transaction.rollback(); // Nếu có lỗi, hoàn tác giao dịch
            e.printStackTrace(); // In lỗi ra console
        }
    }

    public void delete_phone(Integer id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
           Phone phone = session.get(Phone.class, id);
            if (phone != null) {
                session.delete(phone);
                transaction.commit();
            } else {
                System.out.println("Phòng ban không tồn tại!");
            }
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public List<Phone> phanTrang(int page){
        int size = 2;
        Session session = HibernateUtil.getFACTORY().openSession();
        Query query = session.createQuery("FROM Phone ");
        query.setFirstResult(page * size);
        query.setMaxResults(size);
        return query.list();
    }
}






