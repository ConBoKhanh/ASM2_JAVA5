package fplhn.tiennh21.sd17306.repositories;


import fplhn.tiennh21.sd17306.entities.CuaHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface CuaHangRepository extends JpaRepository<CuaHang, UUID> {
}
