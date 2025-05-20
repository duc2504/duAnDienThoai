package Respository;

import Controller.HibernateUtil;
import Model.Role;
import Model.Users;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

//import javax.management.Query;
import java.util.List;



public class Respository_users {

    public List<Users> getAll_users() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM Users ", Users.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public Users getOne_users(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(Users.class, id);
        }
    }


    public Users login(String username, String password) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {

            // HQL: lấy ra đối tượng Users khớp username & password
            String hql = "FROM Users WHERE username = :username AND password = :password";

            // Tạo Query (nếu bạn dùng Hibernate 5.2+ thì có thể dùng Query<Users>)
            Query query = session.createQuery(hql);

            // Gán tham số vào câu HQL
            query.setParameter("username", username);
            query.setParameter("password", password);

            // Lấy ra kết quả duy nhất (nếu có), ép kiểu sang Users
            Users user = (Users) query.uniqueResult();

            return user; // Trả về null nếu không có kết quả
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console (debug dễ hơn)
            return null;
        }
    }

    public void add_user(Users users) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();

            // Gán Role mặc định có id = 1
            Role defaultRole = session.get(Role.class, 1);
            users.setRole(defaultRole); // Hoặc users.setRoles(defaultRole); tùy tên biến trong entity

            session.save(users);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }
    public void add_admin(Users users) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();

            // Gán Role mặc định có id = 1
            Role defaultRole = session.get(Role.class, 2);
            users.setRole(defaultRole); // Hoặc users.setRoles(defaultRole); tùy tên biến trong entity

            session.save(users);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }


    public Users findByUsername(String username) {
        Session session = HibernateUtil.getFACTORY().openSession();
        try {
            return session.createQuery("FROM Users WHERE username = :username", Users.class)
                    .setParameter("username", username)
                    .uniqueResult();
        } finally {
            session.close();
        }
    }
    public List<Users> getAllExcept(int excludeId) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.createQuery(
                            "FROM Users WHERE id <> :id", Users.class)
                    .setParameter("id", excludeId)
                    .list();
        }
    }



}
