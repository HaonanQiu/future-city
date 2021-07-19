package com.csi.controller;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.LifeCost;
import com.csi.service.LifeCostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/lifeCost")
public class LifeCostController {
    @Autowired
    private LifeCostService lifeCostService;

    @RequestMapping("/check")
    public String check(HttpServletRequest request, Model model, int category){
        HouseHolder houseHolder = (HouseHolder) request.getSession().getAttribute("householder");
        System.out.println(houseHolder);
        List<LifeCost> lifeCosts = lifeCostService.findByCategory(houseHolder.getId(), category);
        model.addAttribute("lifeCosts", lifeCosts);
        return "/bill";
    }
}
