package com.csi.controller;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Vo;
import com.csi.service.HouseholderService;
import com.csi.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/houseHolder")
public class HouseHolderController {

    @Autowired
    private HouseholderService householderService;

    //添加户主
    @RequestMapping("/save")
    @ResponseBody
    public String save( @RequestBody HouseHolder houseHolder){
        houseHolder.setId(UuidUtil.getNumId());
        System.out.println(houseHolder);
        householderService.addHouseholder(houseHolder);
        return "true";
    }

    //删除户主
    @RequestMapping("/remove")
    @ResponseBody
    public String remove(String checkIds){
        String[] ids = checkIds.split(",");
        householderService.deleteHouseholder(ids);
        return "true";
    }

    //修改户主状态
    @RequestMapping("/state")
    @ResponseBody
    public String changeState(int id,int state){
        int i = householderService.updateState(id, state);
        return "true";
    }

    //修改户主信息
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(@RequestBody HouseHolder houseHolder){
        int i = householderService.updateAll(houseHolder);
        return "true";
    }

    //分页查询
    @RequestMapping("/page")
    @ResponseBody
    public Vo<HouseHolder> page(String name,String identification, String state,String page,String limit) throws Exception {
        int pageNo = Integer.parseInt(page);
        int pageSize=Integer.parseInt(limit);
        int begin=(pageNo-1)*pageSize;
        Map<String,String> map=new HashMap<>();
        map.put("name",name);
        map.put("identification",identification);
        map.put("state",state);
        Vo<HouseHolder> vo=new Vo<HouseHolder>();
        vo.setCode(0);
        vo.setMsg("success");
        vo.setCount(householderService.count(map));
        vo.setData(householderService.page(map,begin,pageSize));
        return vo;
    }

    //根据ID查询
    @RequestMapping("/findById")
    public String findByName(int id, Model model) throws Exception {
        HouseHolder houseHolder = householderService.selectById(id);
        model.addAttribute("houseHolder",houseHolder);
        return "/community/operate/hh_edit";
    }


}
