package com.csi.controller;

import com.csi.pojo.Login;
import com.csi.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login")

public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("/user/toLogin.action")
    public String toLogin() {
        return "/login.jsp";
    }
    @RequestMapping("/user/login.action")
    public String login(String  name, String password, Model model, HttpServletRequest request) {
        Login login = loginService.findByName(name, password);
        if (login != null) {
            request.getSession().setAttribute("user", login);
            return "redirect:/index.jsp";
        }
        model.addAttribute("errorMsg", "登录失败！账号或密码错误！");
        return "redirect:/login.jsp";
    }

}
