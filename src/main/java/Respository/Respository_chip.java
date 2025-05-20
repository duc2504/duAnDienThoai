package Respository;

import Controller.HibernateUtil;
import Model.Chip;
import org.hibernate.Session;

import java.util.List;

public class Respository_chip {

    public List<Chip> getAll_chip() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM Chip ", Chip.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public Chip getOne_chip(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(Chip.class, id);
        }
    }
}
