package Respository;

import Model.Message;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

import java.util.List;

public class Repository_Message {

    private EntityManagerFactory emf;
    private EntityManager entityManager;

    public Repository_Message() {
        emf = Persistence.createEntityManagerFactory("your-persistence-unit-name"); // Thay thế bằng persistence-unit của bạn
        entityManager = emf.createEntityManager();
    }

    // Lưu message vào cơ sở dữ kiện
    public void save(Message message) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(message);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Lấy tất cả messages gửi đến một user
    public List<Message> findMessagesToUserId(int toUserId) {
        return entityManager.createQuery(
                        "SELECT m FROM Message m WHERE m.toUser.id = :toId", Message.class)
                .setParameter("toId", toUserId)
                .getResultList();
    }

    // Lấy tất cả messages mà một user gửi đi
    public List<Message> findMessagesFromUserId(int fromUserId) {
        return entityManager.createQuery(
                        "SELECT m FROM Message m WHERE m.fromUser.id = :fromId", Message.class)
                .setParameter("fromId", fromUserId)
                .getResultList();
    }

    // Đóng tài nguyên
    public void close(){
        if (entityManager.isOpen()) {
            entityManager.close();
        }
        if (emf.isOpen()) {
            emf.close();
        }
    }
}

