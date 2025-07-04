package Model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "Messages")
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Message_ID")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "FromUser_ID")
    private Users fromUser;

    @ManyToOne
    @JoinColumn(name = "ToUser_ID")
    private Users toUser;

    @Column(name = "Content")
    private String content;

    @Column(name = "SentAt")
    private LocalDateTime sentAt = LocalDateTime.now();

    // getters and setters...


    public Message() {
    }

    public Message(Integer id, Users fromUser, Users toUser, String content, LocalDateTime sentAt) {
        this.id = id;
        this.fromUser = fromUser;
        this.toUser = toUser;
        this.content = content;
        this.sentAt = sentAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Users getFromUser() {
        return fromUser;
    }

    public void setFromUser(Users fromUser) {
        this.fromUser = fromUser;
    }

    public Users getToUser() {
        return toUser;
    }

    public void setToUser(Users toUser) {
        this.toUser = toUser;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getSentAt() {
        return sentAt;
    }

    public void setSentAt(LocalDateTime sentAt) {
        this.sentAt = sentAt;
    }
}
