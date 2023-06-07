package fplhn.tiennh21.sd17306.controllers.admin;

import fplhn.tiennh21.sd17306.entities.CuaHang;
import fplhn.tiennh21.sd17306.entities.MauSac;
import fplhn.tiennh21.sd17306.repositories.MauSacRepository;
import fplhn.tiennh21.sd17306.request.CuaHangVM;
import fplhn.tiennh21.sd17306.request.MauSacVM;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

@Controller
@RequestMapping("admin/mau-sac")
public class MauSacController {
    @Autowired
    private MauSacVM ms;

    @Autowired
    private MauSacRepository repo;

//    @GetMapping("index")
//    public String index(Model model)
//    {
//        List<MauSac> ds = repo.findAll();
//        model.addAttribute("data", ds);
//        return "admin/mau_sac/index";
//    }
@GetMapping("index")
public String getAll(@RequestParam(defaultValue = "0", name = "page") Integer number, Model model) {
    // Page => Trang => Noi dung cua 1 trang
    // 6 phan tu list
    // 1 : size ( 1 trang muon size = bn) : 4 => 4 phan tu 1/trang
    // => Page 1: 4 phan tu dau tien => Page = 0
    // => Page 2: 2 phan tu con lai => Page = 1
    // 2:  soPage => Trang so may : pageNo
    Pageable pageable = PageRequest.of(number, 2);
    Page<MauSac> ds = repo.findAll(pageable);
    model.addAttribute("data", ds );
    return "admin/mau_sac/index";
}

    @GetMapping("createms")
    public String create(Model model)
    {
        model.addAttribute("ms", ms);
        model.addAttribute("action", "/mau-sac/store");
        return "admin/mau_sac/createms";
    }
    @PostMapping("store")
    public String store(
            @Valid @ModelAttribute("ms") MauSacVM ms,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            // Báo lỗi
            System.out.println(ms.getTen());
            return "admin/mau_sac/createms";
        } else {
            MauSac ch = new MauSac();
            ms.loadFromDomain(ch);
            this.repo.save(ch);
        }
        return "redirect:/mau-sac/index";
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") MauSac mauSac)
    {
        System.out.println(mauSac.getTen());
        System.out.println(mauSac.getMa());
        this.repo.delete(mauSac);
        return "redirect:/mau-sac/index";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") MauSac mauSac, Model model)
    {
        ms.loadFromDomain(mauSac);
        model.addAttribute("ms", ms);
        model.addAttribute("action", "/mau-sac/update/" + mauSac.getId());
        return "admin/mau_sac/createms";
    }
    @PostMapping("update/{id}")
    public String update(
            @PathVariable("id") MauSac domain,
            @Valid @ModelAttribute("ms") MauSacVM ms,
            BindingResult result
    ) {
        if (result.hasErrors()) {
            return "admin/mau_sac/createms";
        } else {
            domain.loadFromVM(ms);
            this.repo.save(domain);
        }
        return "redirect:/mau-sac/index";
    }
}
