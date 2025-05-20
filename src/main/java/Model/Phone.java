package Model;


import jakarta.persistence.*;

@Entity
@Table(name = "Phones")
public class Phone {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PhoneID")
    private Integer id;


    @Column(name = "NamePhone")
    private String name;

    @ManyToOne
    @JoinColumn(name = "BrandID")
    private Brand brands;

    @ManyToOne
    @JoinColumn(name = "ModelID")
    private Models modelss;
    @ManyToOne
    @JoinColumn(name = "OSID")
    private OS oss;

    @ManyToOne
    @JoinColumn(name = "ChipID")
    private Chip chips;

    @Column(name = "Quantity")  // Số lượng sản phẩm
    private Integer quantity;

    @Column(name = "TrangThai")  // Số lượng sản phẩm
    private Integer trangThai;

    public Phone(String name, Brand brands, Models modelss, OS oss, Chip chips, Integer quantity, Integer trangThai) {
        this.name = name;
        this.brands = brands;
        this.modelss = modelss;
        this.oss = oss;
        this.chips = chips;
        this.quantity = quantity;
        this.trangThai = trangThai;
    }

    public Phone(Integer id, String name, Brand brands, Models modelss, OS oss, Chip chips, Integer quantity, Integer trangThai) {
        this.id = id;
        this.name = name;
        this.brands = brands;
        this.modelss = modelss;
        this.oss = oss;
        this.chips = chips;
        this.quantity = quantity;
        this.trangThai = trangThai;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Phone() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Brand getBrands() {
        return brands;
    }

    public void setBrands(Brand brands) {
        this.brands = brands;
    }

    public Models getModelss() {
        return modelss;
    }

    public void setModelss(Models modelss) {
        this.modelss = modelss;
    }

    public OS getOss() {
        return oss;
    }

    public void setOss(OS oss) {
        this.oss = oss;
    }

    public Chip getChips() {
        return chips;
    }

    public void setChips(Chip chips) {
        this.chips = chips;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }
}


