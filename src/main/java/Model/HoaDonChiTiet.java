package Model;



import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "HoaDonChiTiet")
public class HoaDonChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "HoaDonChiTietID")
    private Integer hoaDonChiTietId;

    @ManyToOne
    @JoinColumn(name = "HoaDonID")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "VariantID")
    private PhoneVariants variant;

    @Column(name = "SoLuong")
    private Integer soLuong;

    @Column(name = "DonGia", precision = 18, scale = 3)
    private BigDecimal donGia;

    @Column(name = "ThanhTien", precision = 18, scale = 3)
    private BigDecimal thanhTien;

    public HoaDonChiTiet() {
    }

    // Getters & Setters

    public Integer getHoaDonChiTietId() {
        return hoaDonChiTietId;
    }

    public void setHoaDonChiTietId(Integer hoaDonChiTietId) {
        this.hoaDonChiTietId = hoaDonChiTietId;
    }

    public HoaDon getHoaDon() {
        return hoaDon;
    }

    public void setHoaDon(HoaDon hoaDon) {
        this.hoaDon = hoaDon;
    }

    public PhoneVariants getVariant() {
        return variant;
    }

    public void setVariant(PhoneVariants variant) {
        this.variant = variant;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public BigDecimal getDonGia() {
        return donGia;
    }

    public void setDonGia(BigDecimal donGia) {
        this.donGia = donGia;
    }

    public BigDecimal getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(BigDecimal thanhTien) {
        this.thanhTien = thanhTien;
    }
}

