package com.csi.controller;

import com.csi.pojo.Information;
import com.csi.service.InformationService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/information")
public class InformationController {
    @Autowired
    private InformationService informationService;

    @RequestMapping("/find")
    public String find(HttpServletRequest request) {
        List<Information> informationList = informationService.findAll();
        List<Information> threeInformation = null;
        if (informationList.size() >= 3) {
            threeInformation = informationList.subList(0, 3);
        }
        HttpSession session = request.getSession();
        session.setAttribute("threeInformation", threeInformation);
        session.setAttribute("informationList", informationList);
        return "/index";
    }

    @RequestMapping("/findByPage")
    public String findByPage(Model model,
                             @RequestParam(name = "pageNum", required = true, defaultValue = "1") int pageNum,
                             @RequestParam(name = "pageSize", required = true, defaultValue = "5") int pageSize) {
        List<Information> informationList = informationService.findByPage(pageNum, pageSize);

        PageInfo<Information> pageInfo = new PageInfo<>(informationList);

        model.addAttribute("pageInfo", pageInfo);
        return "/news";
    }

    @RequestMapping("/more")
    @ResponseBody
    public String more(HttpServletRequest request, int id){
        Information information = informationService.findById(id);
        information.setReadCount((information.getReadCount() + 1));
        HttpSession session = request.getSession();
        session.setAttribute("information", information);
        boolean result = informationService.amend(information);
        return result ? "true" : "false";
    }
}
