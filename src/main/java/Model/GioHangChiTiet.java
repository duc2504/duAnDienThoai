package Model;

import jakarta.persistence.*;

@Entity
@Table(name = "GioHangChiTiet")
public class GioHangChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "GioHangCT_ID")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "GioHangID")
    private GioHang gioHang;

    @ManyToOne
    @JoinColumn(name = "VariantID")
    private PhoneVariants phoneVariants;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "TrangThai")
    private Integer trangThai; // 0: Chưa đặt, 1: Đã đặt

    // Constructors, Getters, Setters
    public GioHangChiTiet() {}


    public GioHangChiTiet(Integer id, GioHang gioHang, PhoneVariants phoneVariants, Integer soLuong) {
        this.id = id;
        this.gioHang = gioHang;
        this.phoneVariants = phoneVariants;
        this.soLuong = soLuong;
    }

    public GioHangChiTiet(GioHang gioHang, PhoneVariants phoneVariants, Integer soLuong) {
        this.gioHang = gioHang;
        this.phoneVariants = phoneVariants;
        this.soLuong = soLuong;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public GioHang getGioHang() {
        return gioHang;
    }

    public void setGioHang(GioHang gioHang) {
        this.gioHang = gioHang;
    }

    public PhoneVariants getPhoneVariants() {
        return phoneVariants;
    }

    public void setPhoneVariants(PhoneVariants phoneVariants) {
        this.phoneVariants = phoneVariants;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }
}

