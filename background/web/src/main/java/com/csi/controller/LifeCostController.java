package com.csi.controller;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.LifeCost;
import com.csi.pojo.RepairInformation;
import com.csi.pojo.Vo;
import com.csi.service.LifeCostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("lifeCost")
public class LifeCostController {


    @Autowired
    private LifeCostService lifeCostService;

    //分页查询
    @RequestMapping("/page")
    @ResponseBody
    public Vo<LifeCost> page(String state, String startDate, String endDate, String page, String limit) throws Exception {
        int pageNo = Integer.parseInt(page);
        int pageSize=Integer.parseInt(limit);
        int begin=(pageNo-1)*pageSize;
        Map<String,String> map=new HashMap<>();
        map.put("state",state);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        Vo<LifeCost> vo=new Vo<LifeCost>();
        vo.setCode(0);
        vo.setMsg("success");
        vo.setCount(lifeCostService.count(map));
        vo.setData(lifeCostService.page(map,begin,pageSize));
//        List<RepairInformation> page1 = service.page(map, begin, pageSize);
//        for (RepairInformation repairInformation : page1) {
//            System.out.println(repairInformation);
//        }
        return vo;
    }
}
