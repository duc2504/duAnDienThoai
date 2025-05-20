package Model;



import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.util.Date;

@Entity
@Table(name = "GioHang")
public class GioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "GioHangID")
    private Integer id;

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "NgayTao", updatable = false)
    private Date ngayTao;



    @Column(name = "TrangThai")
    private Integer trangThai; // 0: Chưa đặt, 1: Đã đặt

    @ManyToOne
    @JoinColumn(name = "UserID")
    private Users users;

    // Constructors, Getters, Setters
    public GioHang() {}

    public GioHang(Integer id, Date ngayTao, Integer trangThai, Users user) {
        this.id = id;
        this.ngayTao = ngayTao;
        this.trangThai = trangThai;
        this.users = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public GioHang(Integer trangThai) {
        this.trangThai = trangThai;
    }
}

