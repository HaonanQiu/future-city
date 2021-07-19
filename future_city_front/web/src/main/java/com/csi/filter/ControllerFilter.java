package com.csi.filter;

import com.csi.pojo.HouseHolder;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "ControlFilter", urlPatterns = {"*.do"})
public class ControllerFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HouseHolder houseHolder = (HouseHolder) ((HttpServletRequest) req).getSession().getAttribute("householder");
        if (houseHolder == null) {
            ((HttpServletResponse) resp).sendRedirect("login.jsp");
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}