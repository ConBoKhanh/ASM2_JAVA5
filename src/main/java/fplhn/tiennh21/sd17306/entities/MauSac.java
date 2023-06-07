package fplhn.tiennh21.sd17306.entities;

import fplhn.tiennh21.sd17306.request.CuaHangVM;
import fplhn.tiennh21.sd17306.request.MauSacVM;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "MauSac")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MauSac {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name="Id")
    private UUID id;

    @Column(name="Ma")
    private String ma;

    @Column(name="Ten")
    private String ten;

    public void loadFromVM(MauSacVM ms)
    {
        this.setTen( ms.getTen() );
        this.setMa( ms.getMa() );

    }
}