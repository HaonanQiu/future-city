package com.csi.controller;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.RepairInformation;
import com.csi.service.RepairInformationService;
import com.csi.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/repair")
public class RepairController {
    @Autowired
    private RepairInformationService repairInformationService;

    @RequestMapping("/fillIn")
    @ResponseBody
    public String fillIn(String hid, String address, String phone, String message) {
        RepairInformation repairInformation = new RepairInformation();
        int id = UuidUtil.getId();
        repairInformation.setId(id);
        repairInformation.setAddress(address);
        repairInformation.setPhone(phone);
        repairInformation.setMessage(message);
        HouseHolder houseHolder = new HouseHolder();
        int hid1 = Integer.parseInt(hid);
        houseHolder.setId(hid1);
        repairInformation.setHouseholder(houseHolder);
        boolean result = repairInformationService.addRepairInformation(repairInformation);
        return result ? "true" : "false";
    }

    @RequestMapping(value = "/findByState", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String findByState(int hid, int state) {
        List<RepairInformation> repairs = repairInformationService.findByState(hid, state);
        String stateStr = new String();
        StringBuilder html = new StringBuilder();
        html.append("<div class=\"layui-tab-item layui-show\">\n" +
                "                        <table class=\"layui-table\">\n" +
                "                            <colgroup>\n" +
                "                                <col width=\"150\">\n" +
                "                                <col width=\"200\">\n" +
                "                                <col>\n" +
                "                            </colgroup>\n" +
                "                            <thead>\n" +
                "                            <tr>\n" +
                "                                <th>编号</th>\n" +
                "                                <th>地址</th>\n" +
                "                                <th>创建时间</th>\n" +
                "                                <th>操作</th>\n" +
                "                            </tr>\n" +
                "                            </thead>\n" +
                "                            <tbody>");
        for (RepairInformation repair : repairs) {
            switch (state) {
                case 0:
                    stateStr = "待审核";
                    break;
                case 1:
                    stateStr = "正在维修";
                    break;
                case 2:
                    stateStr = "<input type='button' class='layui-btn layui-btn-normal' value='去评价" + repair.getId() + "' onclick='goto(this)' />";
                    break;
                case 3:
                    stateStr = "已完成";
                    break;
            }
            html.append("<tr>\n" +
                    "                                    <td>" + repair.getId() + "</td>\n" +
                    "                                    <td>" + repair.getAddress() + "</td>\n" +
                    "                                    <td>" + repair.createTimeStr() + "</td>\n" +
                    "                                    <td>" + stateStr + "</td>\n" +
                    "                                </tr>");
        }
        html.append("</tbody>\n" +
                "                        </table>\n" +
                "                    </div>");
        return html.toString();
    }
}
