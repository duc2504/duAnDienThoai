package Model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "DonHang")

public class DonHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DonHangID")
    private Integer id ;


    private String DiaChiNhanHang;
    private String SoDienThoai ;
    private String TenNguoiNhanHang ;
    private String PhuongThucThanhToan ;

    private LocalDate NgayDat ;
    private BigDecimal TongTien ;
    private Integer TrangThai ;


    @ManyToOne
    @JoinColumn(name = "UserID")
    private Users users ;

    public DonHang(Integer id, String diaChiNhanHang, String soDienThoai, String tenNguoiNhanHang, String phuongThucThanhToan, LocalDate ngayDat, BigDecimal tongTien, Integer trangThai, Users users) {
        this.id = id;
        DiaChiNhanHang = diaChiNhanHang;
        SoDienThoai = soDienThoai;
        TenNguoiNhanHang = tenNguoiNhanHang;
        PhuongThucThanhToan = phuongThucThanhToan;
        NgayDat = ngayDat;
        TongTien = tongTien;
        TrangThai = trangThai;
        this.users = users;
    }

    public DonHang() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDiaChiNhanHang() {
        return DiaChiNhanHang;
    }

    public void setDiaChiNhanHang(String diaChiNhanHang) {
        DiaChiNhanHang = diaChiNhanHang;
    }

    public String getSoDienThoai() {
        return SoDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        SoDienThoai = soDienThoai;
    }

    public String getTenNguoiNhanHang() {
        return TenNguoiNhanHang;
    }

    public void setTenNguoiNhanHang(String tenNguoiNhanHang) {
        TenNguoiNhanHang = tenNguoiNhanHang;
    }

    public String getPhuongThucThanhToan() {
        return PhuongThucThanhToan;
    }

    public void setPhuongThucThanhToan(String phuongThucThanhToan) {
        PhuongThucThanhToan = phuongThucThanhToan;
    }

    public LocalDate getNgayDat() {
        return NgayDat;
    }

    public void setNgayDat(LocalDate ngayDat) {
        NgayDat = ngayDat;
    }

    public BigDecimal getTongTien() {
        return TongTien;
    }

    public void setTongTien(BigDecimal tongTien) {
        TongTien = tongTien;
    }

    public Integer getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(Integer trangThai) {
        TrangThai = trangThai;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
