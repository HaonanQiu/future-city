package com.csi.controller;

import com.csi.pojo.HouseHolder;
import com.csi.service.HouseHolderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/householder")
public class HouseHolderController {
    @Autowired
    private HouseHolderService houseHolderService;

    @RequestMapping("/login")
    @ResponseBody
    public String login(HttpServletRequest request, String identification, String password) {
        HouseHolder houseHolder = houseHolderService.findByIdentification(identification);
        if (password.equals(houseHolder.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("householder", houseHolder);
            return "true";
        } else {
            return "false";
        }
    }

    @RequestMapping("findByEmail")
    @ResponseBody
    public String findByEmail(String email) {
        HouseHolder houseHolder = houseHolderService.findByEmail(email);
        return houseHolder == null ? "false" : "true";
    }

    @RequestMapping("loginByEmail")
    @ResponseBody
    public String loginByEmail(HttpServletRequest request, String email, String code) {
        HouseHolder houseHolder = houseHolderService.findByEmail(email);
        if (houseHolder != null) {
            HttpSession session = request.getSession();
            String verCode = (String) session.getAttribute("verCode");
            if (verCode.equals(code)) {
                session.setAttribute("householder", houseHolder);
                return "true";
            } else {
                return "false";
            }
        } else {
            return "false";
        }
    }

    @RequestMapping("validate")
    @ResponseBody
    public String validate(HttpServletRequest request, String code){
        if(request.getSession().getAttribute("verCode").equals(code)){
            return "true";
        }else{
            return "false";
        }
    }

    @RequestMapping(value = "amendPwd", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String amendPwd(HttpServletRequest request, String password, String email){
        HouseHolder houseHolder = houseHolderService.findByEmail(email);
        houseHolder.setPassword(password);
        boolean result = houseHolderService.amend(houseHolder);
        request.getSession().invalidate();
        return result ? "<h1>????????????</h1><a href='/web/login.jsp'>??????????????????????????????</a>" : "<h1>????????????</h1><a href='/web/login.jsp'>??????????????????????????????</a>";
    }

    @RequestMapping(value = "complete", produces = "text/html; charset=UTF-8")
    @ResponseBody
    public String complete(HttpServletRequest request, String email, String code, String phone) {
        HttpSession session = request.getSession();
        String verCode = (String) session.getAttribute("verCode");
        if (verCode.equals(code)) {
            HouseHolder houseHolder = (HouseHolder) session.getAttribute("householder");
            houseHolder.setEmail(email);
            houseHolder.setPhone(phone);
            houseHolder.setState(1);
            boolean result = houseHolderService.amend(houseHolder);
            if(result){
                return "<h1>????????????</h1>";
            }else{
                return "<h1>????????????????????????????????????</h1>";
            }
        } else {
            return "<h1>???????????????</h1>";
        }
    }
}
