package Model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.naming.Name;
import javax.xml.namespace.QName;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "DonHangChiTiet")

public class DonHangChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DonHangChiTiet_id")
    private Integer id ;

    @Column(name = "SoLuong")
    private Integer soLuong ;

    @Column(name = "Gia")
    private BigDecimal gia ;

    @Column(name = "ThanhTien")
    private BigDecimal thanhTien ;


    @ManyToOne
    @JoinColumn(name = "VariantID")
    private PhoneVariants phoneVariants ;

    @ManyToOne
    @JoinColumn(name = "DonHangID")
    private DonHang donHang ;

    public DonHangChiTiet(Integer id, Integer soLuong, BigDecimal gia, BigDecimal thanhTien, PhoneVariants phoneVariants, DonHang donHang) {
        this.id = id;
        this.soLuong = soLuong;
        this.gia = gia;
        this.thanhTien = thanhTien;
        this.phoneVariants = phoneVariants;
        this.donHang = donHang;
    }

    public DonHangChiTiet() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public BigDecimal getGia() {
        return gia;
    }

    public void setGia(BigDecimal gia) {
        this.gia = gia;
    }

    public BigDecimal getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(BigDecimal thanhTien) {
        this.thanhTien = thanhTien;
    }

    public PhoneVariants getPhoneVariants() {
        return phoneVariants;
    }

    public void setPhoneVariants(PhoneVariants phoneVariants) {
        this.phoneVariants = phoneVariants;
    }

    public DonHang getDonHang() {
        return donHang;
    }

    public void setDonHang(DonHang donHang) {
        this.donHang = donHang;
    }
}
