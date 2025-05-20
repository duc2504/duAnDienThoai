package Model;



import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Collection;
import java.util.List;


@Entity
@Table(name = "HoaDon")
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "HoaDonID")
    private Integer hoaDonId;

    @OneToOne
    @JoinColumn(name = "DonHangID", unique = true)
    private DonHang donHang;

    @ManyToOne
    @JoinColumn(name = "UserID")
    private Users user;

    @Column(name = "DiaChiNhanHang", length = 255)
    private String diaChiNhanHang;

    @Column(name = "SoDienThoai", length = 20)
    private String soDienThoai;

    @Column(name = "TenNguoiNhanHang", length = 100)
    private String tenNguoiNhanHang;

    @Column(name = "PhuongThucThanhToan", length = 50)
    private String phuongThucThanhToan;

    @Column(name = "NgayDat")
    private LocalDate ngayDat;

    @Column(name = "NgayHoanThanhDonHang")
    private LocalDate ngayHoanThanhDonHang;

    @Column(name = "TongTien", precision = 18, scale = 3)
    private BigDecimal tongTien;

    @Column(name = "TrangThai")
    private Integer trangThai;


    @OneToMany(mappedBy = "hoaDon", cascade = CascadeType.ALL)
    private List<HoaDonChiTiet> hoaDonChiTiets;

    public List<HoaDonChiTiet> getHoaDonChiTiets() {
        return hoaDonChiTiets;
    }

    public void setHoaDonChiTiets(List<HoaDonChiTiet> hoaDonChiTiets) {
        this.hoaDonChiTiets = hoaDonChiTiets;
    }

    public HoaDon(Integer hoaDonId, DonHang donHang, Users user, String diaChiNhanHang, String soDienThoai, String tenNguoiNhanHang, String phuongThucThanhToan, LocalDate ngayDat, LocalDate ngayHoanThanhDonHang, BigDecimal tongTien, Integer trangThai) {
        this.hoaDonId = hoaDonId;
        this.donHang = donHang;
        this.user = user;
        this.diaChiNhanHang = diaChiNhanHang;
        this.soDienThoai = soDienThoai;
        this.tenNguoiNhanHang = tenNguoiNhanHang;
        this.phuongThucThanhToan = phuongThucThanhToan;
        this.ngayDat = ngayDat;
        this.ngayHoanThanhDonHang = ngayHoanThanhDonHang;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
    }

    public HoaDon() {
    }

    public Integer getHoaDonId() {
        return hoaDonId;
    }

    public void setHoaDonId(Integer hoaDonId) {
        this.hoaDonId = hoaDonId;
    }

    public DonHang getDonHang() {
        return donHang;
    }

    public void setDonHang(DonHang donHang) {
        this.donHang = donHang;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getDiaChiNhanHang() {
        return diaChiNhanHang;
    }

    public void setDiaChiNhanHang(String diaChiNhanHang) {
        this.diaChiNhanHang = diaChiNhanHang;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getTenNguoiNhanHang() {
        return tenNguoiNhanHang;
    }

    public void setTenNguoiNhanHang(String tenNguoiNhanHang) {
        this.tenNguoiNhanHang = tenNguoiNhanHang;
    }

    public String getPhuongThucThanhToan() {
        return phuongThucThanhToan;
    }

    public void setPhuongThucThanhToan(String phuongThucThanhToan) {
        this.phuongThucThanhToan = phuongThucThanhToan;
    }

    public LocalDate getNgayDat() {
        return ngayDat;
    }

    public void setNgayDat(LocalDate ngayDat) {
        this.ngayDat = ngayDat;
    }

    public LocalDate getNgayHoanThanhDonHang() {
        return ngayHoanThanhDonHang;
    }

    public void setNgayHoanThanhDonHang(LocalDate ngayHoanThanhDonHang) {
        this.ngayHoanThanhDonHang = ngayHoanThanhDonHang;
    }

    public BigDecimal getTongTien() {
        return tongTien;
    }

    public void setTongTien(BigDecimal tongTien) {
        this.tongTien = tongTien;
    }

    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }


}
