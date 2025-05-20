package Respository;

import Controller.HibernateUtil;
import Model.Brand;
import org.hibernate.Session;

import java.util.List;

public class Respository_brand {

    public List<Brand> getAll_thuongHieu() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM Brand ", Brand.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }
    public Brand getOne_thuongHieu(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(Brand.class, id);
        }
    }
}
