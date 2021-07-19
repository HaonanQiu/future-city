package com.csi.controller;

import com.csi.utils.EmailUtil;
import com.csi.utils.UuidUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/email")
public class EmailController {
    @RequestMapping("/send")
    @ResponseBody
    public String send(HttpServletRequest request, String email) {
        String verCode = UuidUtil.getVerCode();
        boolean result = EmailUtil.send_email(email, verCode);
        HttpSession session = request.getSession();
        if (result) {
            session.removeAttribute("verCode");
            session.setAttribute("email", email);
            session.setAttribute("verCode", verCode);
            return "true";
        } else {
            return "false";
        }
    }
}
