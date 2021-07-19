package com.csi.controller;

import com.csi.pojo.HouseHolder;
import com.csi.pojo.Room;
import com.csi.pojo.Vo;
import com.csi.service.HouseholderService;
import com.csi.service.RoomService;
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
@RequestMapping("/room")
public class RoomController {

    @Autowired
    private RoomService roomService;
    @Autowired
    private HouseholderService householderService;

    //分页查询
    @RequestMapping("/page")
    @ResponseBody
    public Vo<Room> page(String buildingNum, String unitNum, String roomNum, String page, String limit) throws Exception {
        int pageNo = Integer.parseInt(page);
        int pageSize=Integer.parseInt(limit);
        int begin=(pageNo-1)*pageSize;
        Map<String,String> map=new HashMap<>();
        map.put("buildingNum",buildingNum);
        map.put("unitNum",unitNum);
        map.put("roomNum",roomNum);
        Vo<Room> vo=new Vo<>();
        vo.setCode(0);
        vo.setMsg("success");
        vo.setCount(roomService.count(map));
        List<Room> rooms = roomService.page(map, begin, pageSize);
        vo.setData(rooms);
        return vo;
    }

    //根据ID查询
    @RequestMapping("/findById")
    public String findByName(String id, Model model) throws Exception {
        Room room = roomService.selectById(id);
        model.addAttribute("room",room);
        return "/community/operate/room_details";
    }

    //修改户主信息
    @RequestMapping("/edit")
    @ResponseBody
    public String edit(@RequestBody Room room){
        System.out.println(room);
        int i = roomService.update(room);
        return "true";
    }

    //添加户主信息
    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestBody Room room){
        room.setId(UuidUtil.getShortUuid());
        int i = roomService.add(room);
        return "true";
    }

}
