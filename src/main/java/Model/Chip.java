package Model;





import jakarta.persistence.*;

@Entity
@Table(name = "Chips")
public class Chip {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ChipID")
    private Integer  id ;

    @Column(name = "ChipName")
    private  String name;

    public Chip(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Chip() {
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}

