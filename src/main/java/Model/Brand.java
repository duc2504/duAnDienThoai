package Model;



import jakarta.persistence.*;

@Entity
@Table(name = "Brands") // Trùng với bảng Brands trong DB
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BrandID") // Bản đồ với cột trong DB
    private Integer id;

    @Column(name = "BrandName")
    private String name; // Nên đặt tên Java theo camelCase

    public Brand(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Brand() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

