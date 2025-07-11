package Model;



import jakarta.persistence.*;

@Entity
@Table(name = "OperatingSystems")
public class OS {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "OSID")
    private Integer  id ;
    @Column(name = "OSName")
    private  String name;

    public OS() {
    }

    public OS(Integer id, String name) {
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
