package fplhn.tiennh21.sd17306.controllers;

import fplhn.tiennh21.sd17306.entities.ChiTietSP;
import fplhn.tiennh21.sd17306.entities.GioHang;
import fplhn.tiennh21.sd17306.entities.GioHangChiTiet;
import fplhn.tiennh21.sd17306.entities.KhachHang;
import fplhn.tiennh21.sd17306.repositories.ChiTietSPRepository;
import fplhn.tiennh21.sd17306.repositories.GioHangChiTietRepository;
import fplhn.tiennh21.sd17306.repositories.GioHangRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class MuaHangController {

    @Autowired
    private ChiTietSPRepository ctspRepo;

    @Autowired
    private GioHangRepository ghRepo;

    @Autowired
    private GioHangChiTietRepository ghctRepo;

    @Autowired
    HttpSession sessions;
    @GetMapping("home")
    public String home(Model model,@RequestParam(defaultValue = "0", name = "page") Integer number){
        Pageable pageable = PageRequest.of(number, 8);
        Page<ChiTietSP> listctsp = this.ctspRepo.findAll(pageable);
        model.addAttribute("sp", listctsp);
        model.addAttribute("view","/views/homeProduct.jsp");
        return "layoutPro";
    }

    @GetMapping("detail-product/{id}")
    public String detail(@PathVariable("id") ChiTietSP sp, Model model){
        model.addAttribute("ctsp",sp);
        model.addAttribute("view","/views/detailProduct.jsp");
        return "layoutPro";
    }

    @GetMapping("gio-hang/user")
    public String giohang(Model model){
        // user dang nhap thanh cong - > session co chua tat ca thong tin thang day
        KhachHang kh = (KhachHang) sessions.getAttribute("user");

        GioHang ghUser = this.ghRepo.getGioHangByKhachHang(kh.getId());

        List<GioHangChiTiet> ghct = this.ghctRepo.getGioHangChiTietByGioHang(ghUser.getId());

        for (GioHangChiTiet hd: ghct
             ) {
            System.out.println(hd.toString());
        }
        model.addAttribute("gh",ghct);
        model.addAttribute("view","/views/giohangUser.jsp");
        return "layoutPro";
    }
    @PostMapping("add-to-gio-hang/{id}")
    public String addToGHCT(@PathVariable("id") ChiTietSP sp, Model model){
        KhachHang kh = (KhachHang) sessions.getAttribute("user");

        GioHang ghUser = this.ghRepo.getGioHangByKhachHang(kh.getId());

        if(this.ghctRepo.findGioHangChiTietByGioHangAndCAndChiTietSp(ghUser.getId(),sp.getId()) == null){
            GioHangChiTiet ghCreate = new GioHangChiTiet();
            ghCreate.setGioHang(ghUser);
            ghCreate.setChiTietSp(sp);
            ghCreate.setSoLuongTon(1);
            ghCreate.setDonGia(BigDecimal.valueOf(Integer.parseInt(sp.getGiaBan())));

            this.ghctRepo.save(ghCreate);
        }else{
            GioHangChiTiet ghctUpadte = this.ghctRepo.findGioHangChiTietByGioHangAndCAndChiTietSp(ghUser.getId(),sp.getId());
            ghctUpadte.setSoLuongTon(ghctUpadte.getSoLuongTon()+1);
            String dongiaString = String.valueOf(ghctUpadte.getDonGia());
            Integer dongiaTong = Integer.parseInt(dongiaString) * 2;
            ghctUpadte.setDonGia(BigDecimal.valueOf(dongiaTong));

            this.ghctRepo.save(ghctUpadte);
        }

        return "redirect:/gio-hang/user";
    }

    @PostMapping("delete-product/{id}")
    public String deleteProductOne(@PathVariable("id") ChiTietSP sp, Model model){

        KhachHang kh = (KhachHang) sessions.getAttribute("user");

        GioHang ghUser = this.ghRepo.getGioHangByKhachHang(kh.getId());

        GioHangChiTiet ghctUpadte = this.ghctRepo.findGioHangChiTietByGioHangAndCAndChiTietSp(ghUser.getId(),sp.getId());

        if(ghctUpadte.getSoLuongTon()-1 ==0){
            this.ghctRepo.delete(ghctUpadte);
        }else {

            ghctUpadte.setSoLuongTon(ghctUpadte.getSoLuongTon() - 1);
            String dongiaString = String.valueOf(ghctUpadte.getDonGia());
            Integer dongiaTong = Integer.parseInt(dongiaString) / 2;
            ghctUpadte.setDonGia(BigDecimal.valueOf(dongiaTong));

            this.ghctRepo.save(ghctUpadte);
        }
        return "redirect:/gio-hang/user";
    }
}
