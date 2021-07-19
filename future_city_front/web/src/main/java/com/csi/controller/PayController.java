package com.csi.controller;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Orders;
import com.csi.service.BalanceService;
import com.csi.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pay")
public class PayController {
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private BalanceService balanceService;

    @RequestMapping("/success")
    public String success(HttpServletRequest request, String out_trade_no, double total_amount) {
        HouseHolder houseHolder = (HouseHolder) request.getSession().getAttribute("householder");
        int type = Integer.parseInt((String) request.getSession().getAttribute("type"));
        Orders orders = new Orders(out_trade_no, houseHolder, null, 0, total_amount, type);
        ordersService.addOrders(orders);
        balanceService.recharge(houseHolder.getId(), total_amount, type);
        return "redirect:/balance/check";
    }
}
