package com.csi.controller;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Information;
import com.csi.pojo.Vo;
import com.csi.service.InformationService;
import com.csi.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/information")
public class InformationController {

    @Autowired
    private InformationService informationService;

    //分页查询
    @RequestMapping("/page")
    @ResponseBody
    public Vo<Information> page(String title, String startDate, String endDate, String page, String limit) throws Exception {
        int pageNo = Integer.parseInt(page);
        int pageSize=Integer.parseInt(limit);
        int begin=(pageNo-1)*pageSize;
        Map<String,String> map=new HashMap<>();
        map.put("title",title);
        map.put("startDate",startDate);
        map.put("endDate",endDate);
        Vo<Information> vo=new Vo<Information>();
        vo.setCode(0);
        vo.setMsg("success");
        vo.setCount(informationService.count(map));
        vo.setData(informationService.page(map,begin,pageSize));
        return vo;
    }

    //添加通知
    @RequestMapping("/save")
    @ResponseBody
    public String save( @RequestBody Information information){
        int i = informationService.addInformation(information);
        if (i>0){
            return "true";
        }else {
            return "false";
        }
    }

    //根据ID查询
    @RequestMapping("/findById")
    public String findByName(int id, Model model) throws Exception {
        Information information = informationService.selectById(id);
        model.addAttribute("information",information);
        return "/message/operate/if_edit";
    }

    //删除通知
    @RequestMapping("/remove")
    @ResponseBody
    public String remove(String checkIds){
        String[] ids = checkIds.split(",");
        int i = informationService.deleteInformation(ids);
        if (i>0){
            return "true";
        }else {
            return "false";
        }
    }

    //修改通知信息
    @RequestMapping("/edit1")
    @ResponseBody
    public String edit( @RequestBody Information information){
        System.out.println(information);
        int i = informationService.update(information);
        if (i>0){
            return "true";
        }else {
            return "false";
        }
    }

}
