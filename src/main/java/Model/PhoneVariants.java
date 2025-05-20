package Model;



import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "PhoneVariants")
public class PhoneVariants {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "VariantID")
    private Integer variantId;

    @ManyToOne
    @JoinColumn(name = "PhoneID", nullable = false)
    private Phone phone;

    @Column(name = "Quantity")
    private Integer quantity;

    @Column(name = "Color", length = 50)
    private String color;

    @Column(name = "Price", precision = 10, scale = 3)
    private BigDecimal price;

    @Column(name = "ReleaseYear")
    private Integer releaseYear;

    @Column(name = "BatteryCapacity")
    private Integer batteryCapacity;

    @Column(name = "TrangThai")
    private Integer trangThai;

    public PhoneVariants() {
    }




    public PhoneVariants(Integer variantId, Phone phone, Integer quantity, String color, BigDecimal price, Integer releaseYear, Integer batteryCapacity, Integer trangThai) {
        this.variantId = variantId;
        this.phone = phone;
        this.quantity = quantity;
        this.color = color;
        this.price = price;
        this.releaseYear = releaseYear;
        this.batteryCapacity = batteryCapacity;
        this.trangThai = trangThai;
    }

    public PhoneVariants(Phone phone, Integer quantity, String color, BigDecimal price, Integer releaseYear, Integer batteryCapacity, Integer trangThai) {
        this.phone = phone;
        this.quantity = quantity;
        this.color = color;
        this.price = price;
        this.releaseYear = releaseYear;
        this.batteryCapacity = batteryCapacity;
        this.trangThai = trangThai;
    }

    // Getters và Setters

    public Integer getVariantId() {
        return variantId;
    }

    public void setVariantId(Integer variantId) {
        this.variantId = variantId;
    }

    public Phone getPhone() {
        return phone;
    }

    public void setPhone(Phone phone) {
        this.phone = phone;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(Integer releaseYear) {
        this.releaseYear = releaseYear;
    }

    public Integer getBatteryCapacity() {
        return batteryCapacity;
    }

    public void setBatteryCapacity(Integer batteryCapacity) {
        this.batteryCapacity = batteryCapacity;
    }

    public Integer getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }
}
