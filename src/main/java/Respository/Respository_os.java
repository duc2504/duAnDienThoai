package Respository;

import Controller.HibernateUtil;
import Model.OS;
import org.hibernate.Session;

import java.util.List;

public class Respository_os {

    public List<OS> getAll_os() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM OS ", OS.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public OS getOne_os(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(OS.class, id);
        }
    }
}
