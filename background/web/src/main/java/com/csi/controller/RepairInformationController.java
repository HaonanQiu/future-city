package com.csi.controller;

import com.csi.pojo.Information;
import com.csi.pojo.RepairInformation;
import com.csi.pojo.Vo;
import com.csi.service.RepairInformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/repair")
public class RepairInformationController {

    @Autowired
    private RepairInformationService service;

    //分页查询
    @RequestMapping("/page")
    @ResponseBody
    public Vo<RepairInformation> page(String state, String startDate, String endDate, String page, String limit) throws Exception {
        int pageNo = Integer.parseInt(page);
        int pageSize=Integer.parseInt(limit);
        int begin=(pageNo-1)*pageSize;
        Map<String,String> map=new HashMap<>();
        map.put("state",state);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        Vo<RepairInformation> vo=new Vo<RepairInformation>();
        vo.setCode(0);
        vo.setMsg("success");
        vo.setCount(service.count(map));
        vo.setData(service.page(map,begin,pageSize));
//        List<RepairInformation> page1 = service.page(map, begin, pageSize);
//        for (RepairInformation repairInformation : page1) {
//            System.out.println(repairInformation);
//        }
        return vo;
    }

    //根据ID查询
    @RequestMapping("/findById")
    public String findById(int id, Model model) throws Exception {
        RepairInformation repairInformation = service.selectById(id);
        System.out.println(repairInformation);
        model.addAttribute("repairInformation",repairInformation);
        return "/service/operate/repair_details";
    }

    //修改状态
    @RequestMapping("/state")
    @ResponseBody
    public String changeState(int id,int state){
        int i = service.updateState(id, state);
        if (i>0){
            return "true";
        }else {
            return "false";
        }

    }
}
