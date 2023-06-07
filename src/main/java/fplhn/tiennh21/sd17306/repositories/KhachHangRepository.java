package fplhn.tiennh21.sd17306.repositories;

import fplhn.tiennh21.sd17306.entities.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.UUID;
@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, UUID> {
    @Query(value = "SELECT kh FROM KhachHang kh WHERE kh.sdt = ?1 and kh.matKhau = ?2" )
    KhachHang getKhachHangBySdtEqualsAndMatKhauEquals(String sdt,String matkhau);
}
