package Model;



import jakarta.persistence.*;

@Entity
@Table(name = "Models") // Trùng với bảng Brands trong DB
public class Models {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ModelID")
    private Integer id;

    @Column(name = "ModelName")
    private String name; // Nên đặt tên Java theo camelCase

    public Models() {
    }

    public Models(Integer id, String name) {
        this.id = id;
        this.name = name;
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

