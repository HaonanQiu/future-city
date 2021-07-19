package com.csi.controller;

import com.csi.pojo.Room;
import com.csi.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private RoomService roomService;

    @RequestMapping("/findAll")
    public String findAll(Model model, int hid) {
        List<Room> rooms = roomService.findAll(hid);
        model.addAttribute("rooms", rooms);
        return "/room";
    }

    @RequestMapping("/findById")
    @ResponseBody
    public String findById(HttpServletRequest request, String id) {
        Room room = roomService.findById(id);
        if (room != null) {
            HttpSession session = request.getSession();
            session.setAttribute("room", room);
            return "true";
        } else {
            return "false";
        }
    }

    @RequestMapping("/repairRoom")
    public String repairRoom(Model model, int hid) {
        List<Room> rooms = roomService.findAll(hid);
        model.addAttribute("rooms", rooms);
        return "/repair_form";
    }
}
