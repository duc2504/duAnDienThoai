package Respository;

import Controller.HibernateUtil;
import Model.HoaDonChiTiet;
import Model.Phone;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class Respository_hoaDonChitiet {
    public void add(HoaDonChiTiet hoaDonChiTiet) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getFACTORY().openSession()) {
            transaction = session.beginTransaction();
            session.save(hoaDonChiTiet);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace(); // Kiểm tra lỗi
        }
    }


    public List<HoaDonChiTiet> getByHoaDonId(int hoaDonId) {
        Session session = HibernateUtil.getFACTORY().openSession();
        List<HoaDonChiTiet> list = session.createQuery(
                        "FROM HoaDonChiTiet ct WHERE ct.hoaDon.id = :hoaDonId", HoaDonChiTiet.class)
                .setParameter("hoaDonId", hoaDonId)
                .getResultList();
        session.close();
        return list;
    }


}
