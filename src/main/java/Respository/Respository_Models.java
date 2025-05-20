package Respository;


import Controller.HibernateUtil;
import Model.Models;
import org.hibernate.Session;

import java.util.List;

public class Respository_Models {

    public List<Models> getAll_models() {
        try (Session session = HibernateUtil.getFACTORY().openSession()) { // Mở session làm việc với Hibernate
            return session.createQuery("FROM Models", Models.class).list(); // Sử dụng HQL để lấy toàn bộ danh sách dự án
        }
    }

    public Models getOne_models(Integer id) {
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            return session.get(Models.class, id);
        }
    }

}

