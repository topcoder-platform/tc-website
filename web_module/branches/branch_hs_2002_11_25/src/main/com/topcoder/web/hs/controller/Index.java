package com.topcoder.web.hs.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;

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
            System.out.println("query: " + request.getQueryString());
            String command = request.getParameter("c")==null?"":request.getParameter("c");
            if (command.equals("hs_reg_email")) {
                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("High School Registration");
                StringBuffer msgText = new StringBuffer(1000);

                msgText.append("first:  " + checkNull(request.getParameter("firstName")) + "\n");
                msgText.append("last:   " + checkNull(request.getParameter("lastName")) + "\n");
                msgText.append("school: " + checkNull(request.getParameter("school")) + "\n");
                msgText.append("email:  " + checkNull(request.getParameter("email")) + "\n");
                msgText.append("type:   " + checkNull(request.getParameter("coderType")) + "\n");
                mail.setBody(msgText.toString());
                mail.addToAddress("service@topcoder.com", TCSEmailMessage.TO);
                mail.setFromAddress(checkNull(request.getParameter("email")));
                EmailEngine.send(mail);
                response.sendRedirect("/hs/registration/temp_thankyou.jsp");
            } else {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/hs/home/index.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String checkNull(String s) {
        return s==null?"":s;
    }
}
