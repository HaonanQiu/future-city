package com.csi.controller;

import com.csi.pojo.UnitPrice;
import com.csi.pojo.Vo;
import com.csi.service.UnitPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/unitPrice")
public class UnitPriceController {

    @Autowired
    private UnitPriceService unitPriceService;

    @RequestMapping("/list")
    @ResponseBody
    public Vo<UnitPrice> list() throws Exception {
        Vo<UnitPrice> vo = new Vo<UnitPrice>();
        vo.setCode(0);
        vo.setMsg("success");
        vo.setCount(0);
        List<UnitPrice> list = unitPriceService.list();
        System.out.println(list);
        vo.setData(list);
        return vo;
    }

    @RequestMapping("/save")
    @ResponseBody
    public void save(@RequestBody UnitPrice unitPrice,HttpServletResponse resp) throws Exception {
        System.out.println(unitPrice);
        int i = unitPriceService.addUnitPrice(unitPrice);
        System.out.println(i);
        try {
            if (i > 0) {
                resp.getWriter().print("true");
            } else
                resp.getWriter().print("false");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/remove")
    @ResponseBody
    public String delete(String name) throws Exception {
        unitPriceService.deleteUnitPrice(name);
        return "true";
    }

    @RequestMapping("/findByName")
    public String findByName(String name,Model model) throws Exception {
        UnitPrice unitPrice = unitPriceService.findByName(name);
        model.addAttribute("unitPrice",unitPrice);
        return "/cost/operate/up_edit";
    }

    @RequestMapping("/edit")
    @ResponseBody
    public String edit(@RequestBody UnitPrice unitPrice) throws Exception {
        unitPriceService.updateUnitPrice(unitPrice);
        return "true";
    }

}
