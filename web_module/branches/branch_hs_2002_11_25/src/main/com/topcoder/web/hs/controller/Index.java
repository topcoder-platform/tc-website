package com.topcoder.web.hs.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public final class Index extends HttpServlet {

    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
    }


    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.sendRedirect(response.encodeRedirectURL("/hs"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
