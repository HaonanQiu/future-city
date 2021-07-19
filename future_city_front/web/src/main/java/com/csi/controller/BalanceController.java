package com.csi.controller;

import com.csi.pojo.Balance;
import com.csi.pojo.HouseHolder;
import com.csi.service.BalanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/balance")
public class BalanceController {
    @Autowired
    private BalanceService balanceService;

    @RequestMapping("/check")
    public String check(HttpServletRequest request, Model model){
        HouseHolder houseHolder = (HouseHolder) request.getSession().getAttribute("householder");
        Balance balance = balanceService.findByHid(houseHolder.getId());
        model.addAttribute("balance", balance);
        return "/pay";
    }
}
